import 'package:flutter/material.dart';

//TODO beim hinzufügen von an sensor (id03) hob i an fehler griagt
enum DeviceType {
  id01("01", [
    MeasurementProperties(
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperties(
        key: "t2",
        icon: Icons.thermostat,
        description: "measured temperature of the cable sensor",
        unit: "°C"),
  ]),
  id02("02", [
    MeasurementProperties(
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
  ]),
  id03("03", [
    MeasurementProperties(
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperties(
        key: "h",
        icon: Icons.water_drop,
        description: "measured humidity",
        unit: "%"),
  ]),
  id04("04", [
    MeasurementProperties(
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperties(
        key: "t2",
        icon: Icons.thermostat,
        description: "measured temperature of the cable sensor",
        unit: "°C"),
    MeasurementProperties(
        key: "h",
        icon: Icons.water_drop,
        description: "measured humidity",
        unit: "%"),
  ]),
  id05("05", [
    MeasurementProperties(
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperties(
        key: "t2",
        icon: Icons.thermostat,
        description: "measured temperature of the cable sensor",
        unit: "°C"),
    MeasurementProperties(
        key: "h",
        icon: Icons.water_drop,
        description: "measured humidity",
        unit: "%"),
    MeasurementProperties(
        key: "ppm",
        icon: Icons.thermostat,
        description: "measured air quality",
        unit: "ppm"),
  ]),
  id06("06", [
    MeasurementProperties(
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperties(
        key: "t2",
        icon: Icons.thermostat,
        description: "measured temperature of the cable sensor",
        unit: "°C"),
    MeasurementProperties(
        key: "h",
        icon: Icons.water_drop,
        description: "measured humidity",
        unit: "%"),
  ]),
  id07("07", [
    MeasurementProperties(
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperties(
        key: "t2",
        icon: Icons.thermostat,
        description: "measured temperature of the cable sensor",
        unit: "°C"),
    MeasurementProperties(
        key: "h",
        icon: Icons.water_drop,
        description: "measured humidity",
        unit: "%"),
    MeasurementProperties(
        key: "h2",
        icon: Icons.water_drop,
        description: "measured humidity of the external sensor",
        unit: "%"),
  ]),
  id08("08", [
    MeasurementProperties(
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperties(
        key: "r", icon: Icons.water, description: "measured rain", unit: "mm"),
  ]),
  id09("09", [
    MeasurementProperties(
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperties(
        key: "t2",
        icon: Icons.thermostat,
        description: "measured temperature of the cable sensor",
        unit: "°C"),
    MeasurementProperties(
        key: "h",
        icon: Icons.water_drop,
        description: "measured humidity",
        unit: "%"),
  ]),
  id0A("0A", [
    MeasurementProperties(
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
  ]),
  id0B("0B", [
    MeasurementProperties(
        key: "ws",
        icon: Icons.wind_power,
        description: "measured windspeed",
        unit: "m/s"),
    MeasurementProperties(
        key: "wg", icon: Icons.air, description: "measured gust", unit: "m/s"),
    MeasurementProperties(
        key: "wd",
        icon: Icons.navigation,
        description: "measured wind direction",
        unit: ""),
  ]),
  id0E("0E", [
    MeasurementProperties(
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperties(
        key: "h",
        icon: Icons.water_drop,
        description: "measured humidity",
        unit: "%"),
  ]),
  id0F("0F", [
    MeasurementProperties(
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperties(
        key: "t2",
        icon: Icons.thermostat,
        description: "measured temperature of the cable sensor",
        unit: "°C"),
  ]),
  id10("10", [
    MeasurementProperties(
        key: "w", icon: Icons.window, description: "is window open", unit: ""),
  ]),
  id11("11", [
    MeasurementProperties(
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperties(
        key: "t2",
        icon: Icons.thermostat,
        description: "measured temperature of temperature sensor 2",
        unit: "°C"),
    MeasurementProperties(
        key: "t3",
        icon: Icons.thermostat,
        description: "measured temperature of temperature sensor 3",
        unit: "°C"),
    MeasurementProperties(
        key: "t4",
        icon: Icons.thermostat,
        description: "measured temperature of temperature sensor 4",
        unit: "°C"),
    MeasurementProperties(
        key: "h1",
        icon: Icons.water_drop,
        description: "measured humidity",
        unit: "%"),
    MeasurementProperties(
        key: "h2",
        icon: Icons.water_drop,
        description: "measured humidity of humidity sensor 2",
        unit: "%"),
    MeasurementProperties(
        key: "h3",
        icon: Icons.water_drop,
        description: "measured humidity of humidity sensor 3",
        unit: "%"),
    MeasurementProperties(
        key: "h4",
        icon: Icons.water_drop,
        description: "measured humidity of humidity sensor 4",
        unit: "%"),
  ]),
  id12("12", [
    MeasurementProperties(
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperties(
        key: "h",
        icon: Icons.water_drop,
        description: "measured humidity",
        unit: "%"),
    MeasurementProperties(
        key: "h3havg",
        icon: Icons.water_drop,
        description: "measured average humidity of the last 3 hours",
        unit: "%"),
    MeasurementProperties(
        key: "h23havg",
        icon: Icons.water_drop,
        description: "measured average humidity of the last 24 hours",
        unit: "%"),
    MeasurementProperties(
        key: "h7davg",
        icon: Icons.water_drop,
        description: "measured average humidity of the last 7 days",
        unit: "%"),
    MeasurementProperties(
        key: "h30davg",
        icon: Icons.water_drop,
        description: "measured average humidity of the last 30 days",
        unit: "%"),
  ]),
  id15("15", [
    MeasurementProperties(
        key: "kp1t",
        icon: Icons.touch_app,
        description: "measured key press type",
        unit: ""),
  ]),
  id17("17", [
    MeasurementProperties(
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperties(
        key: "t2",
        icon: Icons.thermostat,
        description: "measured AC status",
        unit: ""),
  ]),
  id18("18", [
    MeasurementProperties(
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
    MeasurementProperties(
        key: "h",
        icon: Icons.water_drop,
        description: "measured humidity",
        unit: "%"),
    MeasurementProperties(
        key: "ap",
        icon: Icons.av_timer,
        description: "measured air pressure",
        unit: "hPa"),
  ]),
  id20("20", [
    MeasurementProperties(
        key: "t1",
        icon: Icons.thermostat,
        description: "measured temperature",
        unit: "°C"),
  ]);

  final String identifier;
  final List<MeasurementProperties> keyIcons;

  const DeviceType(this.identifier, this.keyIcons);

  factory DeviceType.fromId(String id) {
    return values
        .firstWhere((element) => element.identifier == id.substring(0, 2));
  }
}

class MeasurementProperties {
  final String key;
  final IconData icon;
  final String description;
  final String unit;

  const MeasurementProperties(
      {required this.key,
      required this.icon,
      required this.description,
      required this.unit});
}
