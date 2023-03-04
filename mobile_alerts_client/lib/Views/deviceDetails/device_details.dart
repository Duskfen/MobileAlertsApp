import 'package:flutter/material.dart';
import 'package:mobile_alerts_client/Views/homepage/Measurements/measurement_content.dart';
import 'package:mobile_alerts_client/Views/homepage/device_card.dart';

import '../../Model/device/device.dart';
import '../../globals.dart';
import '../../main.dart';
import '../homepage/default_app_bar.dart';
import 'measurements_compact.dart';

class DeviceDetails extends StatelessWidget {
  const DeviceDetails({
    super.key,
    required this.device,
    required this.removeDevice,
  });

  // final Function(Device d) onChangeDevice;
  final Function(Device device) removeDevice;
  final Device device;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return ValueListenableBuilder<ThemeMode>(
        valueListenable: MainApp.themeNotifier,
        builder: (context, themeMode, child) {
          return Scaffold(
            appBar:
                AppBars.defaultAppBar(context, themeMode, const Text("Device")),
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Hero(
                      tag: "hero_device_${device.id}",
                      child: DeviceCard(
                        removeDevice: removeDevice,
                        device: device,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Measurments:",
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    _MeasurementList(device: device)
                  ],
                )),
          );
        });
  }
}

class _MeasurementList extends StatelessWidget {
  const _MeasurementList({
    required this.device,
  });

  final Device device;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: ListView(
          children: [
            for (final measurement
                in device.measurements.toList()
                  ..sort((a, b) => b.measureTime.compareTo(a.measureTime)))
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 16,
                    ),
                    child: ConstrainedBox(
                      constraints:
                          const BoxConstraints(minWidth: double.infinity),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          Text(
                              "${Globals.dateFormat(measurement.measureTime) ?? "unknown"}:"),
                          MeasurementCompact(
                            deviceType: device.deviceType,
                            measurement: measurement,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
