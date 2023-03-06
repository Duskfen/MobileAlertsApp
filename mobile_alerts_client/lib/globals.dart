import 'package:intl/intl.dart';

class Globals {
  static String? dateFormat(DateTime? date) {
    if (date == null) {
      return null;
    }
    final now = DateTime.now();
    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      return DateFormat("HH:mm").format(date);
    }
    return DateFormat("dd.MM.yyyy HH:mm").format(date);
  }

  static String onlyDate(DateTime date) {
    return DateFormat("dd.MM.yyyy").format(date);
  }

  static String onlyTime(DateTime date) {
    return DateFormat("HH:mm").format(date);
  }
}
