import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:mobile_alerts_client/Model/device/device_types.dart';

import 'measurementid02.dart';

part 'measurement.g.dart';

@Collection()
class Measurement {
  int measurementId;
  DateTime measureTime;
  DateTime serverReceiveTime;
  DateTime fetchTime;
  bool? lowBattery;
  Id id = Isar.autoIncrement;
  String
      rawData; //Required because IsarLink does not support Generics or abstract types in links
  Measurement(
      {required this.measurementId,
      required this.measureTime,
      required this.serverReceiveTime,
      required this.lowBattery,
      required this.rawData,
      required this.fetchTime});

  @override
  bool operator ==(Object other) {
    if (other is! Measurement) return false;
    return measurementId == other.measurementId;
  }

  @override
  int get hashCode => measurementId.hashCode;

  String getDataPoint(String key) {
    return jsonDecode(rawData)[key].toString();
  }

  factory Measurement.fromMap(Map<String, dynamic> data) => Measurement(
        measurementId: data['idx'] as int,
        measureTime:
            DateTime.fromMillisecondsSinceEpoch((data['ts'] as int) * 1000),
        serverReceiveTime:
            DateTime.fromMillisecondsSinceEpoch((data['c'] as int) * 1000),
        lowBattery: data['lb'] as bool?,
        rawData: jsonEncode(data),
        fetchTime: DateTime.now(),
        // temperature: (data['t1'] as num).toDouble(),
      );
  //TODO support other Sensors see https://mobile-alerts.eu/info/public_server_api_documentation.pdf
  //check from highest-specific to the least specific
}
