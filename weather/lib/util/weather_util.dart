import 'package:intl/intl.dart';

class Util {
  static String appId = 'd4e84847de77c55c1a6dc17addc81ba4';

  static String getFormattedDate(DateTime datetime) {
    return new DateFormat("EEE, MMM d, y").add_jm().format(datetime);
  }
}