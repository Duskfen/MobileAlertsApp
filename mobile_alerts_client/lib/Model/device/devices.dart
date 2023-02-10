import 'device.dart';

class RegisteredDevices {
  DateTime? lastUpdateTime;

  Duration get getNextUpdateAvailable {
    DateTime? lastUpdateTime = this.lastUpdateTime;
    if (lastUpdateTime == null) return Duration.zero;
    return const Duration(minutes: 5) -
        DateTime.now().difference(lastUpdateTime);
  }

  List<Device> devices = [];

  Stream<Device> updateDeviceData() async* {
    //https://dart.dev/guides/language/language-tour#generators
    throw UnimplementedError();
  }
}
