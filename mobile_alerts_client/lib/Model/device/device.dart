import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:mobile_alerts_client/Domain/device_repository.dart';
import 'package:mobile_alerts_client/Model/device/device_types.dart';
import 'package:mobile_alerts_client/Model/device/measurements/measurementid02.dart';

import 'measurements/measurement.dart';
import 'package:http/http.dart' as http;

part 'device.g.dart';

//flutter pub run build_runner build

@Collection()
class Device extends ChangeNotifier {
  Id id = Isar.autoIncrement;

  String deviceid;

  String name = "";

  int? lastseen;

  bool? lowbattery;

  @enumerated
  late DeviceType deviceType;

  final IsarLinks<MeasurementID02> measurements = IsarLinks();

  Device({required this.deviceid}) {
    deviceType = DeviceType.fromId(deviceid);
  }

  // Device({
  //   required deviceid,
  // }) {
  //   this.deviceid = deviceid;
  //   deviceType = DeviceType.fromId(deviceid);
  // }

  static Future<Device> createDevice(String deviceid) async {
    return Device.fromJson(jsonDecode(await _fetchDevice(deviceid)));
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

  /// `dart:convert`
  ///
  /// Parses the json and returns the resulting Json object as [Device].
  factory Device.fromJson(Map<String, dynamic> json) {
    json = (json['devices'] as List<dynamic>).first as Map<String, dynamic>;
    var d = Device(
      deviceid: json['deviceid'],
    )
      ..lastseen = json['lastseen']
      ..lowbattery = json['lowbattery']
      ..deviceType = DeviceType.fromId(json["deviceid"]);

    var m = (Measurement.fromMap(json['measurement'],
        type: DeviceType.fromId(json["deviceid"])) as MeasurementID02);

    d.measurements.add(m);

    return d;
  }

  Future<void> getNewMeasurement() async {
    var json = jsonDecode(await Device._fetchDevice(deviceid));
    json = (json['devices'] as List<dynamic>).first as Map<String, dynamic>;

    var measurement =
        (Measurement.fromMap(json['measurement'], type: deviceType)
            as MeasurementID02);

    measurements.add(measurement);
    DeviceRepository.updateDeviceMeasurements(this);
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
