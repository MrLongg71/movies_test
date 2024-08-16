import 'package:intl/intl.dart';

class DateUtil {
  static DateTime? getDate(String? date, {DateFormat? format}) {
    try {
      if (date == null) return null;
      DateFormat dateFormat = format ?? DateFormat('yyyy-MM-dd');
      return dateFormat.parseUTC(date).toLocal();
    } catch (e) {
      throw FormatException('Characters remaining after date parsing in $date');
    }
  }

  static String? formatTime(int? totalMinutes) {
    if(totalMinutes == null) return null;
    int hours = totalMinutes ~/ 60;
    int minutes = totalMinutes % 60;
    return '${hours}h ${minutes}m';
  }

}
