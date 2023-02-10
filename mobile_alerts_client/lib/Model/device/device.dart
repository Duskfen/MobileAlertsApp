import 'dart:convert';
import 'measurements/measurement.dart';

class Device {
  final String deviceid;
  final int lastseen;
  final bool lowbattery;
  final List<Measurement> measurement;

  Device(
      {required this.deviceid,
      required this.lastseen,
      required this.lowbattery,
      required this.measurement});

  factory Device.fromId({required String deviceId}) {
    //TODO HTTP Request
    //return Device.fromJson("");
    throw UnimplementedError();
  }

  //TODO ErrorHandling (bad responses)
  factory Device.fromMap(Map<String, dynamic> data) => Device(
        deviceid: data['deviceid'] as String,
        lastseen: data['lastseen'] as int,
        lowbattery: data['lowbattery'] as bool,
        measurement: [
          Measurement.fromMap(data['measurement'] as Map<String, dynamic>)
        ],
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Device].
  factory Device.fromJson(String data) {
    return Device.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  Future<void> getNewMeasurement() async {
    //Todo HTTP Request
    throw UnimplementedError();
  }

  @override
  bool operator ==(Object other) {
    if (other is! Device) return false;
    return deviceid == other.deviceid;
  }

  @override
  int get hashCode => deviceid.hashCode;
}
