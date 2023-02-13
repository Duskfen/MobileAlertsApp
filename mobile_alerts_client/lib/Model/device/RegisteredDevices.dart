import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:mobile_alerts_client/Domain/device_repository.dart';
import 'device.dart';

class RegisteredDevices extends ChangeNotifier {
  List<Device> devices = [];

  /// lastpoll is intendet just to give a vague idea when the last poll was
  DateTime? get lastpoll {
    var last = devices.map((e) => e.lastseen).reduce((value, maxi) {
      if (value == null) return maxi;
      if (maxi == null) return value;
      return max<int>(value, maxi);
    });
    if (last == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(last * 1000);
  }

  RegisteredDevices() {
    devices = DeviceRepository.getAll();
  }

  Future<void> updateDeviceData() async {
    //https://dart.dev/guides/language/language-tour#generators
    for (final device in devices) {
      unawaited(device.getNewMeasurement()); //because it notifies listeners
    }
  }

  Future<void> addDevice(String id) async {
    Device newdevice = Device(deviceid: id);
    DeviceRepository.save(newdevice);
    devices.add(newdevice);
    notifyListeners();
    unawaited(newdevice.getNewMeasurement());
  }
}
