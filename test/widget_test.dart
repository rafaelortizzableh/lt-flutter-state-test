import 'package:flutter/material.dart';
import 'package:flutter_state_test/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments Number', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('28'), findsOneWidget);
    expect(find.text('29'), findsNothing);

    await tester.tap(find.byIcon(Icons.plus_one));
    await tester.pump();

    expect(find.text('28'), findsNothing);
    expect(find.text('29'), findsOneWidget);
  });
}
