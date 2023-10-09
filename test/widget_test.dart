import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rosseti_second/constants/constants.dart';
import 'package:rosseti_second/ui/pages/pages.dart';

void main() {
  group("Sing in widgets test", () {
    testWidgets("PhonePage test", (widgetTester) async {
      var textField = find.byType(TextField);
      var continueButoon = find.byType(continueButton as Type);
      var text = find.text("Далее");

      await widgetTester.pumpWidget(const MaterialApp(
        home: PhonePage(),
      ));

      await widgetTester.enterText(textField, "+7 (999) 234 34 54");
      await widgetTester.pump();

      await widgetTester.tap(find.byType(continueButton as Type));
      await widgetTester.pump();

      expect(textField, findsOneWidget);
      expect(continueButoon, findsOneWidget);
      expect(find.text("+7 (999) 234 34 54"), findsOneWidget);
    });
  });
}
