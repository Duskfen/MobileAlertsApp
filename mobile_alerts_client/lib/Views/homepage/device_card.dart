import 'package:flutter/material.dart';
import 'package:mobile_alerts_client/Views/deviceDetails/device_details.dart';
import 'package:mobile_alerts_client/Views/homepage/Measurements/measurement_error_content.dart';
import 'package:prompt_dialog/prompt_dialog.dart';
import 'package:provider/provider.dart';

import '../../Model/device/device.dart';
import '../../globals.dart';
import 'Measurements/measurement_content.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard(
      {super.key, required this.removeDevice, required this.device});
  final Function(Device device) removeDevice;
  final Device device;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ChangeNotifierProvider.value(
      value: device,
      child: Consumer<Device>(builder: (context, device, child) {
        return GestureDetector(
          onTap: () {
            if (Navigator.canPop(context)) {
              //if it is in a sub-route (i.e. already opend, dont navigate again)
              return;
            }
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DeviceDetails(
                        device: device,
                        removeDevice: removeDevice,
                      )),
            );
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Header(
                    theme: theme,
                    device: device,
                    removeDevice: removeDevice,
                  ),
                  const Divider(),
                  deviceStateAwareContent(theme, device)
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget deviceStateAwareContent(ThemeData theme, Device device) {
    switch (device.state) {
      case DeviceState.fetching:
        return const CircularProgressIndicator();
      case DeviceState.ready:
        if (device.measurements.isEmpty) {
          return const CircularProgressIndicator();
        }
        return MeasurementContent(
          deviceType: device.deviceType,
          measurement: device.measurements.last,
        );
      case DeviceState.error:
        return MeasurementErrorContent(device: device);
      default:
        throw UnimplementedError();
    }
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.theme,
    required this.device,
    required this.removeDevice,
  });

  final ThemeData theme;
  final Device device;
  final Function(Device device) removeDevice;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceBetween,
            children: [
              HeadLeft(device: device, theme: theme),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (device.measurements.isNotEmpty)
                    Text(
                      "${Globals.dateFormat(device.measurements.last.measureTime)}",
                      style: theme.textTheme.bodyLarge,
                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: BatteryIndicator(
                      device: device,
                      theme: theme,
                    ),
                  ),
                  DevicePopupMenu(device: device, removeDevice: removeDevice),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class BatteryIndicator extends StatelessWidget {
  const BatteryIndicator(
      {super.key, required this.device, required this.theme});

  final ThemeData theme;
  final Device device;

  @override
  Widget build(BuildContext context) {
    switch (device.lowbattery) {
      case true:
        return Icon(
          Icons.battery_1_bar,
          color: theme.colorScheme.error,
        );
      case false:
        return const Icon(Icons.battery_full);
      case null:
        return Icon(
          Icons.battery_unknown,
          color: theme.colorScheme.error,
        );
      default:
    }
    return const Icon(Icons.battery_alert);
  }
}

class DevicePopupMenu extends StatelessWidget {
  const DevicePopupMenu({
    super.key,
    required this.device,
    required this.removeDevice,
  });

  final Device device;
  final Function(Device device) removeDevice;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        // padding: EdgeInsets.all(0),
        onSelected: (selection) async {
          switch (selection) {
            case 0:
              await renameDevice(context, device);
              break;
            case 1:
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
              await removeDevice(device);
              break;
          }
        },
        itemBuilder: (BuildContext context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.edit),
                    Text(
                      "Rename",
                    )
                  ],
                ),
              ),
              PopupMenuItem(
                value: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.delete),
                    Text(
                      "Delete",
                    )
                  ],
                ),
              )
            ]);
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
