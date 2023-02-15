import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:mobile_alerts_client/Domain/device_repository.dart';
import 'package:mobile_alerts_client/Model/device/measurements/measurement.dart';
import 'device.dart';

class RegisteredDevices extends ChangeNotifier {
  List<Device> devices = [];

  /// lastpoll is intendet just to give a vague idea when the last poll was
  DateTime? get lastpoll {
    Iterable<DateTime> test = devices
        .expand((element) => element.measurements)
        .map((e) => e.fetchTime);
    if (test.isEmpty) return null;
    return test.reduce((value, maxi) {
      if (value.isAfter(maxi)) return value;
      return maxi;
    });
  }

  RegisteredDevices() {
    devices = DeviceRepository.getAll()
      ..sort((a, b) => a.order.compareTo(b.order));
  }

  Future<void> updateDeviceData() async {
    //https://dart.dev/guides/language/language-tour#generators
    for (final device in devices) {
      unawaited(device.getNewMeasurement()); //because it notifies listeners
    }
  }

  Future<void> addDevice(String id) async {
    Device newdevice = Device(deviceid: id, order: devices.length);
    DeviceRepository.save(newdevice);
    devices.add(newdevice);
    notifyListeners();
    unawaited(newdevice.getNewMeasurement());
  }

  void reorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final dragged = devices.removeAt(oldIndex);
    devices.insert(newIndex, dragged);

    for (var i = 0; i < devices.length; i++) {
      devices[i].order = i;
      DeviceRepository.update(devices[i]);
    }
    notifyListeners();
  }
}
