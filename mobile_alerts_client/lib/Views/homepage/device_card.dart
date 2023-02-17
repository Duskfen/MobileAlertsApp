import 'package:flutter/material.dart';
import 'package:mobile_alerts_client/Model/device/registered_devices.dart';
import 'package:mobile_alerts_client/Views/homepage/Measurements/measurement_error_content.dart';
import 'package:mobile_alerts_client/Views/homepage/device_context_menu.dart';
import 'package:prompt_dialog/prompt_dialog.dart';
import 'package:provider/provider.dart';

import '../../Model/device/device.dart';
import '../../globals.dart';
import 'Measurements/measurement_content.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard(
      {super.key, required this.removeDevice, required this.reoderDevice});
  final Function(Device device) removeDevice;
  final Function(Device device, int change) reoderDevice;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Consumer<Device>(builder: (context, device, child) {
      return DeviceContextMenuRegion(
        contextMenuBuilder: (context, offset) {
          return ContextMenuContent(
            offset: offset,
            device: device,
            removeDevice: removeDevice,
            reoderDevice: reoderDevice,
          );
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Header(theme: theme, device: device),
                const Divider(),
                deviceStateAwareContent(theme, device)
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget deviceStateAwareContent(ThemeData theme, Device device) {
    switch (device.state) {
      case DeviceState.fetching:
        return const CircularProgressIndicator();
      case DeviceState.ready:
        if (device.measurements.isEmpty) {
          return const CircularProgressIndicator();
        }
        return MeasurementContent(device: device);
      case DeviceState.error:
        return MeasurementErrorContent(device: device);
      default:
        throw UnimplementedError();
    }
  }
}

class ContextMenuContent extends StatelessWidget {
  const ContextMenuContent(
      {super.key,
      required this.offset,
      required this.device,
      required this.removeDevice,
      required this.reoderDevice});

  final Offset offset;
  final Device device;
  final Function(Device device) removeDevice;
  final Function(Device device, int change) reoderDevice;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTextSelectionToolbar(
      anchors: TextSelectionToolbarAnchors(primaryAnchor: offset),
      children: [
        MaterialButton(
          onPressed: () {
            ContextMenuController.removeAny();
            removeDevice(device);
          },
          child: const Icon(Icons.delete),
        ),
        const VerticalDivider(),
        MaterialButton(
          onPressed: () async {
            ContextMenuController.removeAny();
            await renameDevice(context, device);
          },
          child: const Icon(Icons.edit),
        ),
        const VerticalDivider(),
        GestureDetector(
          onTap: () {
            ContextMenuController.removeAny();
            reoderDevice(device, -1);
          },
          child: const SizedBox(
            width: 40,
            child: Expanded(child: Center(child: Icon(Icons.arrow_upward))),
          ),
        ),
        GestureDetector(
          onTap: () {
            ContextMenuController.removeAny();
            reoderDevice(device, 1);
          },
          child: const SizedBox(
            width: 40,
            child: Expanded(child: Center(child: Icon(Icons.arrow_downward))),
          ),
        ),
        const VerticalDivider(),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.theme,
    required this.device,
  });

  final ThemeData theme;
  final Device device;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              HeadLeft(device: device, theme: theme),
              if (device.measurements.isNotEmpty)
                Text(
                  "${Globals.dateFormat(device.measurements.last.measureTime)}",
                  style: theme.textTheme.bodyLarge,
                ),
            ],
          ),
        );
      },
    );
  }
}

class HeadLeft extends StatelessWidget {
  const HeadLeft({
    super.key,
    required this.device,
    required this.theme,
  });

  final Device device;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      //mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        ((device.name == null || device.name?.isEmpty == true)
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    device.deviceid,
                    style: theme.textTheme.bodyLarge,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await renameDevice(context, device);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(Icons.edit,
                          size: 16, color: theme.colorScheme.secondary),
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    device.name!,
                    style: theme.textTheme.bodyLarge,
                  ),
                  Text(
                    device.deviceid,
                    style: theme.textTheme.labelMedium
                        ?.copyWith(color: theme.disabledColor),
                  )
                ],
              )),
      ],
    );
  }
}

Future<void> renameDevice(BuildContext context, Device device) async {
  final String? result = await prompt(
    context,
    title: const Text("name device"),
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter a valid name';
      }
      return null;
    },
    isSelectedInitialValue: true,
    initialValue: device.getName,
  );

  if (result == null) return;
  device.setName = result;
}
