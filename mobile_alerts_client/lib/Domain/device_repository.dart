import 'package:isar/isar.dart';
import 'package:mobile_alerts_client/Model/device/measurements/measurement.dart';

import '../Model/device/device.dart';

class DeviceRepository {
  static final isar =
      Isar.openSync([DeviceSchema, MeasurementSchema], inspector: true);

  static List<Device> getAll() {
    return (isar.devices.where().findAllSync())
      ..forEach((element) {
        element.measurements.loadSync();
      });
  }

  static Device save(Device device) {
    isar.writeTxnSync(() {
      isar.devices.putSync(device);
    });
    updateMeasurements(device);

    return device;
  }

  static void update(Device device) {
    save(device);
  }

  static void updateMeasurements(Device device) {
    isar.writeTxnSync(() {
      device.measurements
          .saveSync(); //Somehow thy async version does not work properly!
      device.measurements.loadSync();

      List<Id> ids = device.measurements
          .where((element) =>
              element.fetchTime.millisecondsSinceEpoch <
              DateTime.now()
                  .subtract(const Duration(minutes: 1))
                  .millisecondsSinceEpoch)
          .map((e) => e.id)
          .toList();

      isar.measurements.deleteAllSync(ids);
    });
  }

  static void remove(Device device) {
    List<Id> ids = device.measurements.map((e) => e.id).toList();
    isar.writeTxnSync(() {
      isar.measurements.deleteAllSync(ids);
    });
    return isar.writeTxnSync(() {
      isar.devices.deleteSync(device.id);
    });
  }
}
