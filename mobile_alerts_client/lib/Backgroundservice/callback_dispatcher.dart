import 'dart:developer';

import 'package:mobile_alerts_client/Backgroundservice/poll_devices.dart';
import 'package:workmanager/workmanager.dart';

class CallbackDispatcher {
  static const periodicPollDevices = "at.duskfen.mobilealerts.pollDevices";
  @pragma('vm:entry-point')
  static void callbackDispatcher() {
    Workmanager().executeTask((task, inputData) async {
      switch (task) {
        case periodicPollDevices:
          log("poll devices");
          await PollDevices.pollAllAvailableDevices();
          return Future.value(true);
        default:
          return Future.error(Exception("task is not supported"));
      }
    });
  }
}
