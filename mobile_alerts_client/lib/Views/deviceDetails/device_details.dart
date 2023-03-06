import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_alerts_client/Domain/device_repository.dart';
import 'package:mobile_alerts_client/Model/device/measurements/measurement.dart';
import 'package:mobile_alerts_client/Views/homepage/device_card.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../Model/device/device.dart';
import '../../globals.dart';
import '../../main.dart';
import '../homepage/default_app_bar.dart';
import 'measurement_compact.dart';
import "package:collection/collection.dart";

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
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Align(
                    //     alignment: Alignment.topLeft,
                    //     child: Text(
                    //       "Measurments:",
                    //       style: theme.textTheme.bodyLarge,
                    //     ),
                    //   ),
                    // ),
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
    ThemeData theme = Theme.of(context);

    var dateGroupedMeasurments = groupBy(
        device.measurements.toList().reversed,
        (p0) => Globals.onlyDate(
              p0.fetchTime,
            ));

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            for (final group in dateGroupedMeasurments.entries
                .sortedBy((element) =>
                    DateFormat("dd.MM.yyyy").parseStrict(element.key))
                .reversed)
              TimelineTile(
                indicatorStyle: IndicatorStyle(
                  width: 15,
                  color: theme.colorScheme.secondaryContainer,
                  indicatorXY: 0,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                afterLineStyle: LineStyle(
                  color: theme.colorScheme.secondaryContainer,
                  thickness: 2,
                ),
                alignment: TimelineAlign.start,
                endChild: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(group.key),
                        for (final item in group.value)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  alignment: WrapAlignment.spaceBetween,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Text(
                                        '${Globals.onlyTime(item.fetchTime)}:'),
                                    MeasurementCompact(
                                        deviceType: device.deviceType,
                                        measurement: item),
                                  ],
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
