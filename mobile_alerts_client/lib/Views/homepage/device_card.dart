import 'package:flutter/material.dart';
import 'package:prompt_dialog/prompt_dialog.dart';
import 'package:provider/provider.dart';

import '../../Model/device/device.dart';
import '../../globals.dart';
import 'Measurements/measurement_content.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Consumer<Device>(builder: (context, device, child) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Header(theme: theme, device: device),
              const Divider(),
              device.measurements.isNotEmpty == true
                  ? MeasurementContent(device: device)
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      );
    });
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ((device.name == null || device.name?.isEmpty == true)
                ? Text(
                    device.deviceid,
                    style: theme.textTheme.bodyLarge,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
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
            GestureDetector(
              onTap: () async {
                final String? result = (await prompt(
                  context,
                  title: const Text("New device name"),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid name';
                    }
                    return null;
                  },
                ));

                if (result == null) return;
                device.setName = result;
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.edit, size: 16),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 16,
        ),
        if (device.measurements.isNotEmpty)
          Text(
            Globals.dateFormat(device.measurements.last.measureTime),
            style: theme.textTheme.bodyLarge,
          ),
      ],
    );
  }
}
