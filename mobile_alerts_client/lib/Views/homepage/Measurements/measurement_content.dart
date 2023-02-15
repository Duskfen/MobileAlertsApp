import 'package:flutter/material.dart';
import 'package:mobile_alerts_client/Model/device/device.dart';
import 'package:mobile_alerts_client/Model/device/device_types.dart';

import '../../../Model/device/measurements/measurement.dart';

class MeasurementContent extends StatelessWidget {
  const MeasurementContent({super.key, required this.device});

  final Device device;

  @override
  Widget build(BuildContext context) {
    Measurement measurement = device.measurements.last;
    return Column(
      children: [
        for (int i = 0;
            i < device.deviceType.measurementProperties.length;
            i += 2)
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int j = 0; j < 2; j++) //2 items in each row
                    i + j < device.deviceType.measurementProperties.length
                        ? ValueRow(
                            device: device, i: i + j, measurement: measurement)
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
    required this.device,
    required this.i,
    required this.measurement,
  });

  final Device device;
  final int i;
  final Measurement measurement;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
        // alignment: Alignment.center,
        constraints: const BoxConstraints(minWidth: 110),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: theme.colorScheme.secondary,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              device.deviceType.measurementProperties[i].icon,
              color: theme.colorScheme.onSecondary,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
                device.deviceType.measurementProperties[i].formatter(
                    measurement.getDataPoint(
                            device.deviceType.measurementProperties[i].key) +
                        device.deviceType.measurementProperties[i].unit),
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: theme.colorScheme.onSecondary)),
          ],
        ));
  }
}
