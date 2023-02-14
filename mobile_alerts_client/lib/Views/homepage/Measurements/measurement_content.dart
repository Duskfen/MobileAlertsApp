import 'package:flutter/material.dart';
import 'package:mobile_alerts_client/Model/device/device.dart';
import 'package:mobile_alerts_client/Model/device/device_types.dart';

import '../../../Model/device/measurements/measurement.dart';
import 'measurememntid02_content.dart';

class MeasurementContent extends StatelessWidget {
  const MeasurementContent({super.key, required this.device});

  final Device device;

  @override
  Widget build(BuildContext context) {
    Measurement measurement = device.measurements.last;
    return Column(
      children: [
        for (int i = 0; i < device.deviceType.keyIcons.length; i += 2)
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int j = 0; j < 2; j++) //2 items in each row
                    i + j < device.deviceType.keyIcons.length
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

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            device.deviceType.keyIcons[i].icon,
            color: theme.colorScheme.secondary,
          ),
          Text(measurement.getDataPoint(device.deviceType.keyIcons[i].key) +
              device.deviceType.keyIcons[i].unit),
        ],
      ),
    );
  }
}
