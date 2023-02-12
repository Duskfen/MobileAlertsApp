import 'package:isar/isar.dart';
import 'package:mobile_alerts_client/Model/device/measurements/measurementid02.dart';

import '../Model/device/device.dart';

class DeviceRepository {
  static final isar =
      Isar.openSync([DeviceSchema, MeasurementID02Schema], inspector: true);

  static List<Device> getAllDevices() {
    return (isar.devices.where().findAllSync())
      ..forEach((element) {
        element.measurements.loadSync();
      });
  }

  static Device saveDevice(Device device) {
    isar.writeTxnSync(() {
      isar.devices.putSync(device);
    });
    updateDeviceMeasurements(device);

    return device;
    //updateDeviceMeasurements(device);
  }

  static void updateDeviceMeasurements(Device device) {
    isar.writeTxnSync(() {
      device.measurements
          .saveSync(); //Somehow thy async version does not work properly!
      device.measurements.loadSync();
    });
  }

  static void deleteDevice(Device device) {
    return isar.writeTxnSync(() {
      isar.devices.deleteSync(device.id);
    });
  }
}
