//background worker did not work as intended (did not fire in backround)

//import 'package:mobile_alerts_client/Backgroundservice/poll_devices.dart';
//import 'package:workmanager/workmanager.dart';

// @pragma('vm:entry-point')
// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) async {
//     switch (task) {
//       case periodicPollDevices:
//         await PollDevices.pollAllAvailableDevices();
//         return Future.value(true);
//       default:
//         return Future.error(Exception("task is not supported"));
//     }
//   });
// }

//const periodicPollDevices = "at.duskfen.mobilealerts.pollDevices";
