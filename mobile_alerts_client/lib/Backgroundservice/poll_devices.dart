import 'package:mobile_alerts_client/Domain/device_repository.dart';

class PollDevices {
  static Future<void> pollAllAvailableDevices() async {
    //TODO delete measurements older than <TODO>

    List<Future<void>> pendingDevices = [];
    for (final device in DeviceRepository.getAllDevices()) {
      pendingDevices.add(device.getNewMeasurement());
    }
    for (final pendingRequest in pendingDevices) {
      await pendingRequest;
    }
  }
}
