import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_alerts_client/Model/device/device_types.dart';
import 'package:prompt_dialog/prompt_dialog.dart';
import 'package:provider/provider.dart';

import '../../Model/device/registered_devices.dart';
import 'device_context_menu.dart';
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
          buildDefaultDragHandles: false,
          onReorder: (oldIndex, newIndex) {
            registeredDevices.reorder(oldIndex, newIndex);
          },
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
              ChangeNotifierProvider.value(
                  key: Key("device_$i"),
                  value: registeredDevices.devices[i],
                  child: DeviceContextMenuRegion(
                      contextMenuBuilder: (
                        BuildContext context,
                        Offset offset,
                      ) {
                        ThemeData theme = Theme.of(context);
                        return AdaptiveTextSelectionToolbar(
                          anchors: TextSelectionToolbarAnchors(
                              primaryAnchor: offset),
                          children: [
                            Card(
                              color: theme.colorScheme.background,
                              margin: EdgeInsets.zero,
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text("delete"),
                                        SizedBox(width: 20),
                                        Icon(Icons.delete),
                                      ],
                                    ),
                                    Divider()
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text("rename"),
                                        SizedBox(width: 20),
                                        Icon(Icons.edit),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                        // return AdaptiveTextSelectionToolbar.buttonItems(
                        //   buttonItems: [
                        //     ContextMenuButtonItem(
                        //         onPressed: () {
                        //           ContextMenuController.removeAny();
                        //           throw UnimplementedError();
                        //         },
                        //         label: "delete")
                        //   ],
                        //   anchors: TextSelectionToolbarAnchors(
                        //       primaryAnchor: offset),
                        // );
                      },
                      child: const DeviceCard())),
            const SizedBox(
              key: Key("devices_padbox"),
              height: 85,
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
          DeviceType.fromId(value);
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
