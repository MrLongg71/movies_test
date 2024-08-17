import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_test/core/constants/constants.dart';
import 'package:movies_test/main.dart';

class MoviesIntegrationTest {
  void searchMovies() {
    testWidgets('Search movies test', (tester) async {
      // Load app widget.
      await tester.pumpWidget(const MyApp());
      //delay load splash screen
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Verify exits widget (text field)
      expect(
        find.byKey(const Key(IntegrationTestKeyConst.searchMoviesOnTap)),
        findsOneWidget,
      );

      // Tap the search text field widget to navigate to the Search movies page
      await tester.tap(
        find.byKey(
          const Key(IntegrationTestKeyConst.searchMoviesOnTap),
        ),
      );

      await tester.pumpAndSettle();

      // Verify exits widget (search text field)
      final searchTextField = find
          .byKey(const Key(IntegrationTestKeyConst.searchMoviesInputKeyword));
      expect(searchTextField, findsOneWidget);

      //tap text field to show keyboard
      await tester.tap(searchTextField);
      await tester.pump();
      await tester.showKeyboard(searchTextField);

      //enter keyword search //
      await tester.enterText(searchTextField, 'Jack');

      await tester.pumpAndSettle(const Duration(seconds: 3));
    });
  }
}
