// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// ignore_for_file: prefer_void_to_null, prefer_typing_uninitialized_variables, duplicate_ignore

import 'package:flutter/material.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp());

    // Verify that our counter starts at 0.
    // ignore: prefer_typing_uninitialized_variables
    var findsOneWidget;
    var findsNothing;
    var find;
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    // ignore: prefer_typing_uninitialized_variables, unused_local_variable
    var tap = find;
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

void testWidgets(String s, Future<Null> Function(WidgetTester tester) param1) {}

class WidgetTester {
  pumpWidget(MaterialApp materialApp) {}

  tap(byIcon) {}

  pump() {}
}

void expect(text, findsNothing) {}
