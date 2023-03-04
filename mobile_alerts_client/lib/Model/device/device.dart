import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:isar/isar.dart';
import 'package:mobile_alerts_client/Domain/device_repository.dart';
import 'package:mobile_alerts_client/Model/device/device_types.dart';

import 'measurements/fetch_error.dart';
import 'measurements/measurement.dart';

part 'device.g.dart';

//flutter pub run build_runner build

enum DeviceState {
  ready,
  fetching,
  error,
}

@JsonSerializable()
@Collection()
class Device extends ChangeNotifier {
  Id id = Isar.autoIncrement;

  String deviceid;

  String? name;
  String? get getName => name;
  int order;
  // ignore: invalid_annotation_target
  @ignore //is needed.. or the builder tries to use it as a field
  set setName(String? name) {
    this.name = name;
    DeviceRepository.update(this);
    notifyListeners();
  }

  int? lastseen;

  @JsonProperty(ignore: true)
  @ignore
  DeviceState state = DeviceState.ready;

  @ignore
  FetchError? error;

  bool? lowbattery;

  @enumerated
  late DeviceType deviceType;

  @JsonProperty(ignore: true)
  final IsarLinks<Measurement> measurements = IsarLinks();

  Device({required String deviceid, required this.order, this.name})
      : deviceid = deviceid.toUpperCase() {
    deviceType = DeviceType.fromId(deviceid);
  }

  //
  static Future<Response> _fetchDevice(String deviceid) async {
    return await post(
        Uri.parse("https://www.data199.com/api/pv1/device/lastmeasurement"),
        body: "deviceids=$deviceid",
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        });
  }

  Future<void> getNewMeasurement() async {
    if (state == DeviceState.fetching) return;
    state = DeviceState.fetching;
    notifyListeners();

    Response r = await Device._fetchDevice(deviceid);
    if (r.statusCode != 200) {
      error = FetchError.fromResponse(r);
      state = DeviceState.error;
    } else {
      error = null;

      var json = jsonDecode(r.body);
      json = (json['devices'] as List<dynamic>).first as Map<String, dynamic>;

      var measurement = (Measurement.fromMap(json['measurement']));

      measurements.add(measurement);
      lastseen = json['lastseen'];
      lowbattery = json['lowbattery'];
      DeviceRepository.update(this);
      DeviceRepository.updateMeasurements(this);
      state = DeviceState.ready;
    }
    notifyListeners();
  }

  @override
  bool operator ==(Object other) {
    if (other is! Device) return false;
    return deviceid == other.deviceid;
  }

  @override
  int get hashCode => deviceid.hashCode;
}
