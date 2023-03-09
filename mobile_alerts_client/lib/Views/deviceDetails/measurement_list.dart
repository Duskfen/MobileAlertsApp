import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeline_tile/timeline_tile.dart';
import "package:collection/collection.dart";

import '../../Model/device/device.dart';
import '../../globals.dart';
import 'measurement_compact.dart';

class MeasurementList extends StatelessWidget {
  const MeasurementList({
    super.key,
    required this.device,
  });

  final Device device;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    var dateGroupedMeasurments = groupBy(
        device.measurements.toList().reversed,
        (p0) => Globals.onlyDate(
              p0.fetchTime,
            ));

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            for (final group in dateGroupedMeasurments.entries
                .sortedBy((element) =>
                    DateFormat("dd.MM.yyyy").parseStrict(element.key))
                .reversed)
              TimelineTile(
                indicatorStyle: IndicatorStyle(
                  width: 15,
                  color: theme.colorScheme.secondaryContainer,
                  indicatorXY: 0,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                afterLineStyle: LineStyle(
                  color: theme.colorScheme.secondaryContainer,
                  thickness: 2,
                ),
                alignment: TimelineAlign.start,
                endChild: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(group.key),
                        for (final item in group.value)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  alignment: WrapAlignment.spaceBetween,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Text(
                                        '${Globals.onlyTime(item.fetchTime)}:'),
                                    MeasurementCompact(
                                        deviceType: device.deviceType,
                                        measurement: item),
                                  ],
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
