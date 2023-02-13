import 'package:flutter/material.dart';
import 'package:mobile_alerts_client/Model/device/device.dart';

import '../../../Model/device/measurements/measurement.dart';
import '../../../globals.dart';

class MeaurementContentId02 extends StatelessWidget {
  const MeaurementContentId02({super.key, required this.device});

  final Device device;

  @override
  Widget build(BuildContext context) {
    Measurement measurement = device.measurements.last;
    //ThemeData theme = Theme.of(context);
    // return Column(
    //   children: [
    //     ListTile(
    //       leading: const Icon(Icons.thermostat),
    //       iconColor: theme.iconTheme
    //           .color, //TODO COLOR (bzw. schau ob im Theme der color drin is)
    //       title: Text("${measurement.getDataPoint("t1")}°C"),
    //       trailing: Text(Globals.dateFormat(measurement.measureTime)),
    //     )
    //   ],
    //);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.thermostat),
                      Text("${measurement.getDataPoint("t1")}°C"),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.thermostat),
                      Text("${measurement.getDataPoint("t1")}°C"),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.thermostat),
                      Text("${measurement.getDataPoint("t1")}°C"),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.thermostat),
                      Text("${measurement.getDataPoint("t1")}°C"),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
