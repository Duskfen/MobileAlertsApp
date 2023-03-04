import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/material.dart';
import 'package:mobile_alerts_client/Domain/device_repository.dart';
import 'device.dart';

@JsonSerializable()
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
    await (newdevice.getNewMeasurement());
  }

  Future<void> remove(Device device) async {
    devices.remove(device);
    notifyListeners();
    DeviceRepository.remove(device);
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

  Future<void> import(String path) async {
    final List<Device>? read = JsonMapper.deserialize<RegisteredDevices>(
            await File(path).readAsString())
        ?.devices;
    if (read == null) return;

    for (var device in devices) {
      DeviceRepository.remove(device);
    }
    devices.removeWhere((element) => true);

    for (var device in read) {
      device = DeviceRepository.save(device);
      devices.add(device);
      notifyListeners();
      await (device.getNewMeasurement());
    }
  }

  Future<void> export(String path) async {
    devices.removeWhere((element) =>
        element.error != null); //or there is a serialization error (?)

    await File(
            '$path/mobileAlertsExport_${DateTime.now().toIso8601String()}.json')
        .writeAsString(JsonMapper.serialize(this));
  }
}
