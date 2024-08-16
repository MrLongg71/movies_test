import 'package:intl/intl.dart';

class NumberUtil {
  static final formatter = NumberFormat('#.#');

  static String convertVote(num? vote, {NumberFormat? numberFormat}) {
    if (vote == null) return '';
    return (numberFormat ?? formatter).format(vote);
  }
}
