// import 'package:isar/isar.dart';

// import 'device.dart';

// @collection
// class RegisteredDevices {
//   Id id = Isar.autoIncrement;
//   DateTime? lastUpdateTime;

//   @ignore
//   Duration get getNextUpdateAvailable {
//     DateTime? lastUpdateTime = this.lastUpdateTime;
//     if (lastUpdateTime == null) return Duration.zero;
//     return const Duration(minutes: 5) -
//         DateTime.now().difference(lastUpdateTime);
//   }

//   List<Device> devices = [];
//   Future<void> updateDeviceData() async {
//     //https://dart.dev/guides/language/language-tour#generators
//     //listeners get notified
//     for (final device in devices) {
//       device.getNewMeasurement();
//     }
//   }
// }
