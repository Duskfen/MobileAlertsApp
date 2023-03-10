import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mrx_charts/mrx_charts.dart';

class BarChart extends StatelessWidget {
  const BarChart(
      {super.key,
      required this.dataPoints,
      required this.xFormatter,
      required this.yFormatter});

  final List<double> dataPoints;
  final String Function(String value) xFormatter;
  final String Function(String value) yFormatter;

  @override
  Widget build(BuildContext context) {
    if (dataPoints.isEmpty || dataPoints.length < 2) {
      return const SizedBox.shrink();
    }

    ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: theme.colorScheme.background,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Chart(
            padding: const EdgeInsets.all(4),
            duration: const Duration(milliseconds: 500),
            layers: [
              ChartAxisLayer(
                settings: ChartAxisSettings(
                  x: ChartAxisSettingsAxis(
                    frequency: 1,
                    max: (dataPoints.max + 0.1),
                    min: (dataPoints.min),
                    textStyle: theme.textTheme.labelSmall ??
                        TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 10.0,
                        ),
                  ),
                  y: ChartAxisSettingsAxis(
                    frequency: 1,
                    max: dataPoints.length.toDouble(),
                    min: 0,
                    textStyle: theme.textTheme.labelSmall ??
                        TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 10.0,
                        ),
                  ),
                ),
                labelX: (value) => xFormatter(value.toString()),
                labelY: (value) => yFormatter(value.toInt().toString()),
              ),
              ChartBarLayer(
                items: dataPoints
                    .toSet()
                    .mapIndexed((i, value) => ChartBarDataItem(
                        color: theme.colorScheme.primary,
                        value: dataPoints
                            .where((element) => element == value)
                            .length
                            .toDouble(),
                        x: value.toDouble()))
                    .toList(),
                settings: const ChartBarSettings(
                  thickness: 8.0,
                  radius: BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
