import 'package:flutter/material.dart';
import 'package:mobile_alerts_client/Model/device/device_type.dart';

import '../../../Model/device/measurements/measurement.dart';

class MeasurementContent extends StatelessWidget {
  const MeasurementContent(
      {super.key, required this.deviceType, required this.measurement});

  final DeviceType deviceType;
  final Measurement measurement;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < deviceType.measurementProperties.length; i += 2)
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int j = 0; j < 2; j++) //2 items in each row
                    i + j < deviceType.measurementProperties.length
                        ? ValueRow(
                            deviceType: deviceType,
                            i: i + j,
                            measurement: measurement)
                        : const SizedBox.shrink()
                ],
              ))
      ],
    );
  }
}

class ValueRow extends StatelessWidget {
  const ValueRow({
    super.key,
    required this.deviceType,
    required this.i,
    required this.measurement,
  });

  final DeviceType deviceType;
  final int i;
  final Measurement measurement;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Tooltip(
      message: deviceType.measurementProperties[i].description,
      child: Container(
          // alignment: Alignment.center,
          constraints: const BoxConstraints(minWidth: 110),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: theme.colorScheme.background,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                deviceType.measurementProperties[i].icon,
                color: theme.colorScheme.onBackground,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                  deviceType.measurementProperties[i].formatter(
                      measurement.getDataPoint(
                              deviceType.measurementProperties[i].key) +
                          deviceType.measurementProperties[i].unit),
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: theme.colorScheme.onBackground)),
            ],
          )),
    );
  }
}
