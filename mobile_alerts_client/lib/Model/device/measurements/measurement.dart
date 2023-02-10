import 'measurementid02.dart';

abstract class Measurement {
  int measurementId;
  DateTime measureTime;
  DateTime serverReceiveTime;
  bool lowBattery;

  Measurement(
      {required this.measurementId,
      required this.measureTime,
      required this.serverReceiveTime,
      required this.lowBattery});

  @override
  bool operator ==(Object other) {
    if (other is! Measurement) return false;
    return measurementId == other.measurementId;
  }

  @override
  int get hashCode => measurementId.hashCode;

  factory Measurement.fromMap(Map<String, dynamic> data) {
    //TODO support other Sensors see https://mobile-alerts.eu/info/public_server_api_documentation.pdf
    //check from highest-specific to the least specific
    return MeasurementID02.fromMap(data);
  }
}
