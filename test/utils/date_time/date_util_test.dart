import 'package:flutter_test/flutter_test.dart';
import 'package:movies_test/core/utils/utils.dart';

void main() {
  group('Test convert string (format:yyyy-MM-dd) to datetime', () {
    test(
      'should throw FormatException when input is in wrong format',
      () {
        expect(
          () => DateUtil.getDate('01'),
          throwsA(isA<FormatException>()),
        );
      },
    );

    test(
      'should return null when input is null or empty',
      () {
        expect(DateUtil.getDate(null), isNull);
        expect(DateUtil.getDate(''), isNull);
      },
    );

    test(
      'should correctly parse a valid date string',
      () {
        final result = DateUtil.getDate('2024-01-01');
        //utc+7
        expect(result, DateTime(2024, 1, 1, 7, 00, 00, 000));
      },
    );
  });
}
