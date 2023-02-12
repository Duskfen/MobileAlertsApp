enum DeviceType {
  id01("01"),
  id02("02"),
  id03("03"),
  id04("04"),
  id05("05"),
  id06("06"),
  id07("07"),
  id08("08"),
  id09("09"),
  id0A("0A"),
  id0B("0B"),
  id0E("0E"),
  id0F("0F"),
  id10("10"),
  id11("11"),
  id12("12"),
  id15("15"),
  id17("17"),
  id18("18"),
  id20("20");

  final String identifier;

  const DeviceType(this.identifier);

  factory DeviceType.fromId(String id) {
    return values
        .firstWhere((element) => element.identifier == id.substring(0, 2));
  }
}
