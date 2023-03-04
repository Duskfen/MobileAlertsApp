import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mobile_alerts_client/Model/device/device_types.dart';
import 'package:prompt_dialog/prompt_dialog.dart';
import 'package:provider/provider.dart';

import '../../Model/device/device.dart';
import '../../Model/device/registered_devices.dart';
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
        body: ReorderableListView(
          header: Padding(
            key: const Key("Header_Key_Import_Export"),
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                ElevatedButton.icon(
                    onPressed: () async {
                      String? path =
                          await FilePicker.platform.getDirectoryPath();
                      if (path == null) {
                        return;
                      }
                      await registeredDevices.export(path);
                    },
                    icon: const Icon(Icons.arrow_upward),
                    label: const Text("Export")),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton.icon(
                    onPressed: () async {
                      FilePickerResult? result = (await FilePicker.platform
                          .pickFiles(
                              allowMultiple: false,
                              type: FileType.custom,
                              allowedExtensions: ["json"]));
                      if (result == null) {
                        return;
                      }
                      String? path = result.files.single.path;
                      if (path == null) {
                        return;
                      }
                      await registeredDevices.import(path);
                    },
                    icon: const Icon(Icons.arrow_downward),
                    label: const Text("Import")),
              ],
            ),
          ),
          onReorder: (int oldIndex, int newIndex) {
            registeredDevices.reorder(oldIndex, newIndex);
          },
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
          children: [
            if (registeredDevices.devices.isEmpty)
              const Card(
                key: Key("No_Device_Information_Banner"),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Text("Start by adding your first sensor!"),
                  ),
                ),
              ),
            for (int i = 0; i < registeredDevices.devices.length; i++)
              Hero(
                key: Key("device_${registeredDevices.devices[i].id}"),
                tag: "hero_device_${registeredDevices.devices[i].id}",
                child: DeviceCard(
                  removeDevice: (Device device) =>
                      registeredDevices.remove(device),
                  device: registeredDevices.devices[i],
                ),
              ),
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
      onPressed: () async => await handlePrompt(context),
      child: const Icon(Icons.add),
    );
  }

  handlePrompt(BuildContext context) async {
    String? newsensor = await prompt(
      context,
      title: const Text("Your Sensor-ID"),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a valid ID';
        }
        try {
          DeviceType.fromId(value.toUpperCase());
        } catch (e) {
          return 'This Sensortype is not supported';
        }
        return null;
      },
    );
    if (newsensor == null) return;

    unawaited(devices.addDevice(newsensor)); //listeners get notified
  }
}
