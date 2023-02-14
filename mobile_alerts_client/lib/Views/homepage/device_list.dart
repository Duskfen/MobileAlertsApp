import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prompt_dialog/prompt_dialog.dart';
import 'package:provider/provider.dart';

import '../../Model/device/RegisteredDevices.dart';
import 'device_card.dart';

class DeviceList extends StatelessWidget {
  const DeviceList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisteredDevices>(
        builder: (context, registeredDevices, child) {
      return Scaffold(
        floatingActionButton:
            ElevatedSensorAddButton(devices: registeredDevices),
        body: ListView(
          children: [
            for (final device in registeredDevices.devices)
              ChangeNotifierProvider.value(
                  value: device, child: const DeviceCard()),
          ],
        ),
      );
    });
  }
}

class ElevatedSensorAddButton extends StatelessWidget {
  const ElevatedSensorAddButton({
    required this.devices,
    super.key,
  });

  final RegisteredDevices devices;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async => await handlePropmpt(context),
      child: const Icon(Icons.add),
    );
  }

  handlePropmpt(BuildContext context) async {
    String? newsensor = await prompt(
      context,
      title: const Text("Your Sensor-ID"),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a valid ID';
        }
        return null;
      },
    );
    if (newsensor == null) return;

    unawaited(devices.addDevice(newsensor)); //listeners get notified
  }
}
