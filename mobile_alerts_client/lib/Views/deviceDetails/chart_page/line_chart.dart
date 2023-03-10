import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mobile_alerts_client/Model/device/device_type.dart';
import 'package:mrx_charts/mrx_charts.dart';

/// expects as x-values a datetime formatted in millisecondsSinceEpoch
class LineChart extends StatelessWidget {
  const LineChart(
      {super.key,
      required this.dataPoints,
      required this.xFormatter,
      required this.measurementProperty,
      required this.yFormatter});

  final List<ChartLineDataItem> dataPoints;
  final MeasurementProperty measurementProperty;
  final String Function(double value) xFormatter;
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
              layers: layers(theme),
            )),
      ),
    );
  }

  List<ChartLayer> layers(ThemeData theme) {
    final labelStyle = theme.textTheme.labelSmall ??
        TextStyle(
          color: Colors.white.withOpacity(0.6),
          fontSize: 10.0,
        );
    final from = DateTime.fromMillisecondsSinceEpoch(dataPoints
        .reduce((curr, next) => curr.x < next.x ? curr : next)
        .x
        .toInt()); //min

    final to = DateTime.fromMillisecondsSinceEpoch(dataPoints
        .reduce((curr, next) => curr.x > next.x ? curr : next)
        .x
        .toInt()); //max
    var frequency =
        (to.millisecondsSinceEpoch - from.millisecondsSinceEpoch) / 2;
    var yFrequency = (dataPoints
                .map((e) => e.value)
                .max - //TODO edgecase what if they are the same?
            dataPoints.map((e) => e.value).min) /
        9;
    if (yFrequency == 0) {
      yFrequency += 0.1;
    }
    if (frequency == 0) {
      frequency += 1;
    }
    return [
      ChartHighlightLayer(
        shape: () => ChartHighlightLineShape<ChartLineDataItem>(
          backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
          currentPos: (item) => item.currentValuePos,
          radius: const BorderRadius.all(Radius.circular(8.0)),
          width: 60.0,
        ),
      ),
      ChartAxisLayer(
        settings: ChartAxisSettings(
          x: ChartAxisSettingsAxis(
            frequency: frequency,
            max: to.millisecondsSinceEpoch.toDouble(),
            min: from.millisecondsSinceEpoch.toDouble(),
            textStyle: labelStyle,
          ),
          y: ChartAxisSettingsAxis(
              frequency: yFrequency,
              max: dataPoints.map((e) => e.value).max,
              min: dataPoints.map((e) => e.value).min,
              textStyle: labelStyle),
        ),
        labelX: (value) => xFormatter(value),
        labelY: (value) => yFormatter(value.toStringAsFixed(1)),
      ),
      ChartLineLayer(
        items: dataPoints,
        settings: ChartLineSettings(
          color: theme.colorScheme.primary,
          thickness: 3.0,
        ),
      ),
      ChartTooltipLayer(
        shape: () => ChartTooltipLineShape<ChartLineDataItem>(
            backgroundColor: theme.colorScheme.onBackground,
            circleBackgroundColor: theme.colorScheme.onBackground,
            circleBorderColor: theme.colorScheme.background,
            circleSize: 4.0,
            circleBorderThickness: 2.0,
            currentPos: (item) => item.currentValuePos,
            onTextValue: (item) =>
                '${item.value.toString()}${measurementProperty.unit}',
            marginBottom: 6.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 8.0,
            ),
            radius: 6.0,
            textStyle: (theme.textTheme.labelLarge ?? labelStyle)
                .copyWith(color: theme.colorScheme.background)),
      ),
    ];
  }
}
