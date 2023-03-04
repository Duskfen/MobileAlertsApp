import 'package:flutter/material.dart';
import 'package:mobile_alerts_client/Model/device/measurements/wind_directions.dart';

enum DeviceType {
  id01("01", [
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t2",
        icon: Icons.thermostat,
        description: "measured temperature of the cable sensor",
        unit: "°C"),
  ]),
  id02("02", [
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
  ]),
  id03("03", [
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "h",
        icon: Icons.water_drop,
        description: "measured humidity",
        unit: "%"),
  ]),
  id04("04", [
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t2",
        icon: Icons.thermostat,
        description: "measured temperature of the cable sensor",
        unit: "°C"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "h",
        icon: Icons.water_drop,
        description: "measured humidity",
        unit: "%"),
  ]),
  id05("05", [
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t2",
        icon: Icons.thermostat,
        description: "measured temperature of the cable sensor",
        unit: "°C"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "h",
        icon: Icons.water_drop,
        description: "measured humidity",
        unit: "%"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "ppm",
        icon: Icons.thermostat,
        description: "measured air quality",
        unit: "ppm"),
  ]),
  id06("06", [
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t2",
        icon: Icons.thermostat,
        description: "measured temperature of the cable sensor",
        unit: "°C"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "h",
        icon: Icons.water_drop,
        description: "measured humidity",
        unit: "%"),
  ]),
  id07("07", [
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t2",
        icon: Icons.thermostat,
        description: "measured temperature of the cable sensor",
        unit: "°C"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "h",
        icon: Icons.water_drop,
        description: "measured humidity",
        unit: "%"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "h2",
        icon: Icons.water_drop,
        description: "measured humidity of the external sensor",
        unit: "%"),
  ]),
  id08("08", [
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "r",
        icon: Icons.water,
        description: "measured rain",
        unit: "mm"),
  ]),
  id09("09", [
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t2",
        icon: Icons.thermostat,
        description: "measured temperature of the cable sensor",
        unit: "°C"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "h",
        icon: Icons.water_drop,
        description: "measured humidity",
        unit: "%"),
  ]),
  id0A("0A", [
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
  ]),
  id0B("0B", [
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "ws",
        icon: Icons.wind_power,
        description: "measured windspeed",
        unit: "m/s"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "wg",
        icon: Icons.air,
        description: "measured gust",
        unit: "m/s"),
    MeasurementProperty(
        formatter: MeasurementProperty.windDirectionFormatter,
        key: "wd",
        icon: Icons.navigation,
        description: "measured wind direction",
        unit: ""),
  ]),
  id0E("0E", [
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "h",
        icon: Icons.water_drop,
        description: "measured humidity",
        unit: "%"),
  ]),
  id0F("0F", [
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t2",
        icon: Icons.thermostat,
        description: "measured temperature of the cable sensor",
        unit: "°C"),
  ]),
  id10("10", [
    MeasurementProperty(
        formatter: MeasurementProperty.openClosedFormatter,
        key: "w",
        icon: Icons.window,
        description: "is window open",
        unit: ""),
  ]),
  id11("11", [
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t2",
        icon: Icons.thermostat,
        description: "measured temperature of temperature sensor 2",
        unit: "°C"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t3",
        icon: Icons.thermostat,
        description: "measured temperature of temperature sensor 3",
        unit: "°C"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t4",
        icon: Icons.thermostat,
        description: "measured temperature of temperature sensor 4",
        unit: "°C"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "h1",
        icon: Icons.water_drop,
        description: "measured humidity",
        unit: "%"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "h2",
        icon: Icons.water_drop,
        description: "measured humidity of humidity sensor 2",
        unit: "%"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "h3",
        icon: Icons.water_drop,
        description: "measured humidity of humidity sensor 3",
        unit: "%"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "h4",
        icon: Icons.water_drop,
        description: "measured humidity of humidity sensor 4",
        unit: "%"),
  ]),
  id12("12", [
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "h",
        icon: Icons.water_drop,
        description: "measured humidity",
        unit: "%"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "h3havg",
        icon: Icons.water_drop,
        description: "measured average humidity of the last 3 hours",
        unit: "%"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "h24havg",
        icon: Icons.water_drop,
        description: "measured average humidity of the last 24 hours",
        unit: "%"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "h7davg",
        icon: Icons.water_drop,
        description: "measured average humidity of the last 7 days",
        unit: "%"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "h30davg",
        icon: Icons.water_drop,
        description: "measured average humidity of the last 30 days",
        unit: "%"),
  ]),
  id15("15", [
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "kp1t",
        icon: Icons.touch_app,
        description: "measured key press type",
        unit: ""),
  ]),
  id17("17", [
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t2",
        icon: Icons.thermostat,
        description: "measured AC status",
        unit: ""),
  ]),
  id18("18", [
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "h",
        icon: Icons.water_drop,
        description: "measured humidity",
        unit: "%"),
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "ap",
        icon: Icons.av_timer,
        description: "measured air pressure",
        unit: "hPa"),
  ]),
  id20("20", [
    MeasurementProperty(
        formatter: MeasurementProperty.defaultFormatter,
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
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

  const MeasurementProperty(
      {required this.formatter,
      required this.key,
      required this.icon,
      required this.description,
      required this.unit});

  static String defaultFormatter(String value) {
    return value;
  }

  static String keyPressFormatter(String value) {
    throw UnimplementedError();
  }

  static String windDirectionFormatter(String value) {
    int? converted = int.tryParse(value);
    if (converted == null) return value;

    return WindDirections.fromCode(converted).representation;
  }

  static String openClosedFormatter(String value) {
    if (value == "true") {
      return "opened";
    }
    if (value == "false") {
      return "closed";
    }
    return value;
  }
}
