import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:mobile_alerts_client/Domain/device_repository.dart';
import 'package:mobile_alerts_client/Model/device/device_types.dart';

import 'measurements/measurement.dart';
import 'package:http/http.dart' as http;

part 'device.g.dart';

//flutter pub run build_runner build

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

  bool? lowbattery;

  @enumerated
  late DeviceType deviceType;

  final IsarLinks<Measurement> measurements = IsarLinks();

  Device({required this.deviceid, required this.order, this.name}) {
    deviceType = DeviceType.fromId(deviceid);
  }

  static Future<String> _fetchDevice(String deviceid) async {
    final response = await http.post(
        Uri.parse("https://www.data199.com/api/pv1/device/lastmeasurement"),
        body: "deviceids=$deviceid",
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw UnimplementedError(); //TODO Errorhandling
    }
  }

  Future<void> getNewMeasurement() async {
    var json = jsonDecode(await Device._fetchDevice(deviceid));
    json = (json['devices'] as List<dynamic>).first as Map<String, dynamic>;

    var measurement = (Measurement.fromMap(json['measurement']));

    measurements.add(measurement);
    lastseen = json['lastseen'];
    lowbattery = json['lowbattery'];
    DeviceRepository.update(this);
    DeviceRepository.updateMeasurements(this);
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
