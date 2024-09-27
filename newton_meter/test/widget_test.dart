// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:newton_meter/graphMain.dart';

import 'package:newton_meter/main.dart';
import 'package:newton_meter/dataDisplay.dart';

void main() {

 // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
   // await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    //expect(find.text('0'), findsOneWidget);
   // expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
   // await tester.tap(find.byIcon(Icons.add));
   // await tester.pump();

    // Verify that our counter has incremented.
  //  expect(find.text('0'), findsNothing);
   // expect(find.text('1'), findsOneWidget);
  //});
  testWidgets('data is displayed properly', (WidgetTester tester) async{
    await tester.pumpWidget(const MyGraph());

    expect(find.text('Average Velocity = 0.0'), findsOne);
    expect(find.text('Net Force = 1.0'), findsOne);
    expect(find.text('Average Momentum = 2.0'), findsOne);
    expect(find.text('Time = 3.0'), findsOne);
    expect(find.text('Position Change = 4.0'), findsOne);
    expect(find.text('Vector 3 = 5.0'), findsOne);
    expect(find.text('Vector 4 = 6.0'), findsOne);
  });

}
