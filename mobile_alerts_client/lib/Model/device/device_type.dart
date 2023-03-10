import 'package:flutter/material.dart';
import 'package:mobile_alerts_client/Model/device/measurements/wind_directions.dart';

import 'data_type.dart';

enum DeviceType {
  id01("01", [
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t1",
      icon: Icons.thermostat,
      description: "measured temperature",
      unit: "°C",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t2",
      icon: Icons.thermostat,
      description: "measured temperature of the cable sensor",
      unit: "°C",
      dataType: DataType.continuous,
    ),
  ]),
  id02("02", [
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t1",
      icon: Icons.thermostat,
      description: "measured temperature",
      unit: "°C",
      dataType: DataType.continuous,
    ),
  ]),
  id03("03", [
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t1",
      icon: Icons.thermostat,
      description: "measured temperature",
      unit: "°C",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "h",
      icon: Icons.water_drop,
      description: "measured humidity",
      unit: "%",
      dataType: DataType.continuous,
    ),
  ]),
  id04("04", [
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t1",
      icon: Icons.thermostat,
      description: "measured temperature",
      unit: "°C",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t2",
      icon: Icons.thermostat,
      description: "measured temperature of the cable sensor",
      unit: "°C",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "h",
      icon: Icons.water_drop,
      description: "measured humidity",
      unit: "%",
      dataType: DataType.continuous,
    ),
  ]),
  id05("05", [
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t1",
      icon: Icons.thermostat,
      description: "measured temperature",
      unit: "°C",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t2",
      icon: Icons.thermostat,
      description: "measured temperature of the cable sensor",
      unit: "°C",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "h",
      icon: Icons.water_drop,
      description: "measured humidity",
      unit: "%",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "ppm",
      icon: Icons.thermostat,
      description: "measured air quality",
      unit: "ppm",
      dataType: DataType.continuous,
    ),
  ]),
  id06("06", [
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t1",
      icon: Icons.thermostat,
      description: "measured temperature",
      unit: "°C",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t2",
      icon: Icons.thermostat,
      description: "measured temperature of the cable sensor",
      unit: "°C",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "h",
      icon: Icons.water_drop,
      description: "measured humidity",
      unit: "%",
      dataType: DataType.continuous,
    ),
  ]),
  id07("07", [
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t1",
      icon: Icons.thermostat,
      description: "measured temperature",
      unit: "°C",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t2",
      icon: Icons.thermostat,
      description: "measured temperature of the cable sensor",
      unit: "°C",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "h",
      icon: Icons.water_drop,
      description: "measured humidity",
      unit: "%",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "h2",
      icon: Icons.water_drop,
      description: "measured humidity of the external sensor",
      unit: "%",
      dataType: DataType.continuous,
    ),
  ]),
  id08("08", [
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t1",
      icon: Icons.thermostat,
      description: "measured temperature",
      unit: "°C",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "r",
      icon: Icons.water,
      description: "measured rain",
      unit: "mm",
      dataType: DataType.continuous,
    ),
  ]),
  id09("09", [
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t1",
      icon: Icons.thermostat,
      description: "measured temperature",
      unit: "°C",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t2",
      icon: Icons.thermostat,
      description: "measured temperature of the cable sensor",
      unit: "°C",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "h",
      icon: Icons.water_drop,
      description: "measured humidity",
      unit: "%",
      dataType: DataType.continuous,
    ),
  ]),
  id0A("0A", [
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t1",
      icon: Icons.thermostat,
      description: "measured temperature",
      unit: "°C",
      dataType: DataType.continuous,
    ),
  ]),
  id0B("0B", [
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "ws",
      icon: Icons.wind_power,
      description: "measured windspeed",
      unit: "m/s",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "wg",
      icon: Icons.air,
      description: "measured gust",
      unit: "m/s",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.windDirectionFormatter,
      key: "wd",
      icon: Icons.navigation,
      description: "measured wind direction",
      unit: "",
      dataType: DataType.nominal,
    ),
  ]),
  id0E("0E", [
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t1",
      icon: Icons.thermostat,
      description: "measured temperature",
      unit: "°C",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "h",
      icon: Icons.water_drop,
      description: "measured humidity",
      unit: "%",
      dataType: DataType.continuous,
    ),
  ]),
  id0F("0F", [
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t1",
      icon: Icons.thermostat,
      description: "measured temperature",
      unit: "°C",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t2",
      icon: Icons.thermostat,
      description: "measured temperature of the cable sensor",
      unit: "°C",
      dataType: DataType.continuous,
    ),
  ]),
  id10("10", [
    MeasurementProperty(
      formatter: MeasurementProperty.openClosedFormatter,
      key: "w",
      icon: Icons.window,
      description: "is window open",
      unit: "",
      dataType: DataType.nominal,
    ),
  ]),
  id11("11", [
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t1",
      icon: Icons.thermostat,
      description: "measured temperature",
      unit: "°C",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t2",
      icon: Icons.thermostat,
      description: "measured temperature of temperature sensor 2",
      unit: "°C",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t3",
      icon: Icons.thermostat,
      description: "measured temperature of temperature sensor 3",
      unit: "°C",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t4",
      icon: Icons.thermostat,
      description: "measured temperature of temperature sensor 4",
      unit: "°C",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "h1",
      icon: Icons.water_drop,
      description: "measured humidity",
      unit: "%",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "h2",
      icon: Icons.water_drop,
      description: "measured humidity of humidity sensor 2",
      unit: "%",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "h3",
      icon: Icons.water_drop,
      description: "measured humidity of humidity sensor 3",
      unit: "%",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "h4",
      icon: Icons.water_drop,
      description: "measured humidity of humidity sensor 4",
      unit: "%",
      dataType: DataType.continuous,
    ),
  ]),
  id12("12", [
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t1",
      icon: Icons.thermostat,
      description: "measured temperature",
      unit: "°C",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "h",
      icon: Icons.water_drop,
      description: "measured humidity",
      unit: "%",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "h3havg",
      icon: Icons.water_drop,
      description: "measured average humidity of the last 3 hours",
      unit: "%",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "h24havg",
      icon: Icons.water_drop,
      description: "measured average humidity of the last 24 hours",
      unit: "%",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "h7davg",
      icon: Icons.water_drop,
      description: "measured average humidity of the last 7 days",
      unit: "%",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "h30davg",
      icon: Icons.water_drop,
      description: "measured average humidity of the last 30 days",
      unit: "%",
      dataType: DataType.continuous,
    ),
  ]),
  id15("15", [
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "kp1t",
      icon: Icons.touch_app,
      description: "measured key press type",
      unit: "",
      dataType: DataType.continuous,
    ),
  ]),
  id17("17", [
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t1",
      icon: Icons.thermostat,
      description: "measured temperature",
      unit: "°C",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t2",
      icon: Icons.thermostat,
      description: "measured AC status",
      unit: "",
      dataType: DataType.continuous,
    ),
  ]),
  id18("18", [
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t1",
      icon: Icons.thermostat,
      description: "measured temperature",
      unit: "°C",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "h",
      icon: Icons.water_drop,
      description: "measured humidity",
      unit: "%",
      dataType: DataType.continuous,
    ),
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "ap",
      icon: Icons.av_timer,
      description: "measured air pressure",
      unit: "hPa",
      dataType: DataType.continuous,
    ),
  ]),
  id20("20", [
    MeasurementProperty(
      formatter: MeasurementProperty.defaultFormatter,
      key: "t1",
      icon: Icons.thermostat,
      description: "measured temperature",
      unit: "°C",
      dataType: DataType.continuous,
    ),
  ]);

  final String identifier;
  final List<MeasurementProperty> measurementProperties;

  const DeviceType(this.identifier, this.measurementProperties);

  factory DeviceType.fromId(String id) {
    return values.firstWhere(
        (element) => element.identifier == id.toUpperCase().substring(0, 2));
  }
}

class MeasurementProperty {
  final String key;
  final IconData icon;
  final String description;
  final String unit;
  final String Function(String value) formatter;
  final DataType dataType;

  const MeasurementProperty(
      {required this.formatter,
      required this.key,
      required this.icon,
      required this.description,
      required this.unit,
      required this.dataType});

  static String defaultFormatter(String value) {
    num? converted = num.tryParse(value);
    if (converted == null) {
      return value;
    }

    return ((converted * 100).round() / 100).toString();
  }

  static String keyPressFormatter(String value) {
    throw UnimplementedError();
  }

  static String windDirectionFormatter(String value) {
    num? converted = num.tryParse(value);
    if (converted == null) return value;

    return WindDirections.fromCode(converted.toInt()).representation;
  }

  static String openClosedFormatter(String value) {
    if (value == "true" || num.tryParse(value) == 1) {
      return "opened";
    }
    if (value == "false" || num.tryParse(value) == 0) {
      return "closed";
    }
    return value;
  }
}
