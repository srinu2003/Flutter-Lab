// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:exp_10_a/main.dart';

void main() {
  testWidgets('CustomButton displays and triggers onPressed',
      (WidgetTester tester) async {
    // Define a flag to check if the button is pressed.
    bool isPressed = false;

    // Build the widget tree with the CustomButton.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(
            label: 'Designed Button',
            onPressed: () {
              isPressed = true;
              print('Button was pressed!');
            },
          ),
        ),
      ),
    );

    // Verify that the button is displayed with the correct label.
    expect(find.text('Designed Button'), findsOneWidget);

    // Tap the button and trigger a frame.
    await tester.tap(find.text('Designed Button'));
    await tester.pump();

    // Verify that the onPressed callback is triggered.
    expect(isPressed, isTrue);

    // Print output after test
    print('Test completed. isPressed: $isPressed');
  });
}
