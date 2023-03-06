
import 'package:flutter/material.dart';
import 'package:mobile_alerts_client/Model/device/device_types.dart';

import '../../../Model/device/measurements/measurement.dart';

class MeasurementCompact extends StatelessWidget {
  const MeasurementCompact(
      {super.key, required this.deviceType, required this.measurement});

  final DeviceType deviceType;
  final Measurement measurement;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: [
        for (final property in deviceType.measurementProperties)
          Tooltip(
            message: property.description,
            child: Container(
                // alignment: Alignment.center,
                constraints: const BoxConstraints(minWidth: 110),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: theme.colorScheme.background,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      property.icon,
                      color: theme.colorScheme.onBackground,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                        property.formatter(
                            measurement.getDataPoint(property.key) +
                                property.unit),
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(color: theme.colorScheme.onBackground)),
                  ],
                )),
          )
      ],
    );
  }
}
