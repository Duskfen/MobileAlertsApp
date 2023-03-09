import 'package:flutter/material.dart';

import '../../../Model/device/device.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key, required this.device});

  final Device device;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return ListView(
      children: [
        for (final measurementProperty
            in device.deviceType.measurementProperties)
          Card(
            child: Column(
              children: [
                Container(
                    // alignment: Alignment.center,
                    constraints: const BoxConstraints(minWidth: 110),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: theme.colorScheme.background,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          measurementProperty.icon,
                          color: theme.colorScheme.onBackground,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(measurementProperty.description,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onBackground)),
                        ),
                      ],
                    )),
                const Placeholder(
                    fallbackHeight:
                        100), //TODO based on measurementProperty.dataType descide which chart(s) should be displayable (maybe do another tab-bar) Also create different Chart components which accept an array of datapoints
              ],
            ),
          )
      ],
    );
  }
}
