import 'package:flutter/material.dart';

import '../../../Model/device/device.dart';
import '../../../globals.dart';

class MeasurementErrorContent extends StatelessWidget {
  const MeasurementErrorContent({super.key, required this.device});

  final Device device;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: theme.colorScheme.error,
      ),
      child: Column(children: [
        Text("An error happend at ${Globals.dateFormat(device.error?.time)}",
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: theme.colorScheme.onError)),
        const Divider(),
        Text(
            "${device.error?.statusCode.toString()} - ${device.error?.reasonPhrase?.toString()}",
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: theme.colorScheme.onError)),
        Text(device.error?.body ?? "",
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: theme.colorScheme.onError)),
      ]),
    );
  }
}
