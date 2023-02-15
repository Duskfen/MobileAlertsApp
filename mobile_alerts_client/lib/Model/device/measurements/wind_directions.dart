enum WindDirections {
  north(code: 0, representation: "N"),
  northNorthEast(code: 1, representation: "NNE"),
  northEast(code: 2, representation: "NE"),
  eastNorthEast(code: 3, representation: "ENE"),
  east(code: 4, representation: "E"),
  eastSouthEast(code: 5, representation: "ESE"),
  southEast(code: 6, representation: "SE"),
  southSouthEast(code: 7, representation: "SSE"),
  south(code: 8, representation: "S"),
  southSouthWest(code: 9, representation: "SSW"),
  southWest(code: 10, representation: "SW"),
  westSouthWest(code: 11, representation: "WSW"),
  west(code: 12, representation: "W"),
  westNorthWest(code: 13, representation: "WNW"),
  northwest(code: 14, representation: "NW"),
  northNorthWest(code: 15, representation: "NNW");

  final int code;
  final String representation;

  const WindDirections({required this.code, required this.representation});

  static WindDirections fromCode(int code) {
    return WindDirections.values.where((element) => element.code == code).first;
  }
}
