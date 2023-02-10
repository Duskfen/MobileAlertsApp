import 'dart:convert';

import 'measurement.dart';

/// MeasurementData from an ID02 Sensor
class MeasurementID02 extends Measurement {
  double temperature;

  MeasurementID02({
    required this.temperature,
    required super.measurementId,
    required super.measureTime,
    required super.serverReceiveTime,
    required super.lowBattery,
  });

  factory MeasurementID02.fromMap(Map<String, dynamic> data) => MeasurementID02(
        measurementId: data['idx'] as int,
        measureTime:
            DateTime.fromMillisecondsSinceEpoch((data['ts'] as int) * 1000),
        serverReceiveTime:
            DateTime.fromMillisecondsSinceEpoch((data['c'] as int) * 1000),
        lowBattery: data['lb'] as bool,
        temperature: (data['t1'] as num).toDouble(),
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Measurement].
  factory MeasurementID02.fromJson(String data) {
    return MeasurementID02.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
