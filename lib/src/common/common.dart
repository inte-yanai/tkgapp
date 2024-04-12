import 'package:intl/intl.dart';

class Common {
  static String getNumberFormat(dynamic number) {
    if (number is int) {
      return NumberFormat("#,##0").format(number);
    }

    return NumberFormat("#,##0.#").format(number);
  }
}
