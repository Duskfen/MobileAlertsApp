import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_alerts_client/Domain/device_repository.dart';
import 'device.dart';

class RegisteredDevices extends ChangeNotifier {
  List<Device> devices = [];

  RegisteredDevices() {
    devices = DeviceRepository.getAll()
      ..sort((a, b) => a.order.compareTo(b.order));
  }

  Future<void> updateDeviceData() async {
    //https://dart.dev/guides/language/language-tour#generators
    for (final device in devices) {
      if (device.state == DeviceState.error) {
        if (device.error!.time.difference(DateTime.now()).abs() >
            const Duration(minutes: 15)) {
          unawaited(device.getNewMeasurement()); //because it notifies listeners
        }
        continue;
      }
      if (device.measurements.isEmpty) {
        unawaited(device.getNewMeasurement()); //because it notifies listeners
        continue;
      }
      if (device.measurements.last.fetchTime.difference(DateTime.now()).abs() >
          const Duration(minutes: 15)) {
        unawaited(device.getNewMeasurement()); //because it notifies listeners
        continue;
      }
    }
  }

  Future<void> addDevice(String id) async {
    Device newdevice = Device(deviceid: id, order: devices.length);
    DeviceRepository.save(newdevice);
    devices.add(newdevice);
    notifyListeners();
    unawaited(newdevice.getNewMeasurement());
  }

  Future<void> remove(Device device) async {
    devices.remove(device);
    notifyListeners();
    DeviceRepository.remove(device);
  }

  void reorder(Device device, int change) {
    Device old = device;
    if (old.order + change >= 0 && old.order + change < devices.length) {
      devices.remove(device);
      devices.insert(old.order + change, old);
    }

    for (var i = 0; i < devices.length; i++) {
      devices[i].order = i;
      DeviceRepository.update(devices[i]);
    }
    notifyListeners();
  }
}
