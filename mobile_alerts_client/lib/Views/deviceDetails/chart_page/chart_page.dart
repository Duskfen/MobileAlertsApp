import 'package:flutter/material.dart';
import 'package:mobile_alerts_client/Model/device/data_type.dart';
import 'package:mobile_alerts_client/Views/deviceDetails/chart_page/bar_chart.dart';
import 'package:mobile_alerts_client/Views/deviceDetails/chart_page/line_chart.dart';
import 'package:mrx_charts/mrx_charts.dart';

import '../../../Model/device/device.dart';
import '../../../globals.dart';

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
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                      // alignment: Alignment.center,
                      constraints: const BoxConstraints(minWidth: 110),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: theme.colorScheme.background,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
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
                  if (measurementProperty.dataType == DataType.nominal ||
                      measurementProperty.dataType == DataType.ordinal)
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 200),
                      child: BarChart(
                        dataPoints: device.measurements
                            .map((e) =>
                                double.tryParse(
                                    e.getDataPoint(measurementProperty.key)) ??
                                (e
                                            .getDataPoint(
                                                measurementProperty.key)
                                            .toLowerCase() ==
                                        "true"
                                    ? 1.0
                                    : 0.0))
                            .toList(),
                        xFormatter: measurementProperty.formatter,
                        yFormatter: (String value) => value,
                      ),
                    ),
                  if (measurementProperty.dataType == DataType.continuous ||
                      measurementProperty.dataType == DataType.discrete)
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 200),
                      child: LineChart(
                        dataPoints: device.measurements
                            .map((measurement) => ChartLineDataItem(
                                value: double.parse(measurement
                                    .getDataPoint(measurementProperty.key)),
                                x: measurement
                                    .measureTime.millisecondsSinceEpoch
                                    .toDouble()))
                            .toList(),
                        xFormatter: ((value) =>
                            Globals.dateFormat(
                                DateTime.fromMillisecondsSinceEpoch(
                                    value.toInt())) ??
                            "?"),
                        yFormatter: (String value) => value,
                        measurementProperty: measurementProperty,
                      ),
                    ),
                ],
              ),
            ),
          )
      ],
    );
  }
}
