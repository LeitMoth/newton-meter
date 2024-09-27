import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:newton_meter/Calculator/calculator_main.dart';

void main() {
  testWidgets('Has correct buttons', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: CalculatorMain()));

    expect(find.byKey(const Key('gfv')), findsOneWidget);
    expect(find.byKey(const Key('fv')), findsOneWidget);
    expect(find.byKey(const Key('mv')), findsOneWidget);
    expect(find.byKey(const Key('avv')), findsOneWidget);
    expect(find.byKey(const Key('mag')), findsOneWidget);
    expect(find.byKey(const Key('pu1')), findsOneWidget);
    expect(find.byKey(const Key('pu2')), findsOneWidget);
  });

  testWidgets('force dialog gives the right answer', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: CalculatorMain()));

    await tester.tap(find.byKey(const Key('fv')));
    await tester.pump();
    await tester.enterText(find.byKey(const Key('ax')), '1');
    await tester.pump();
    await tester.enterText(find.byKey(const Key('m')), '1');
    await tester.pump();
    await tester.tap(find.byKey(const Key('calc')));
    await tester.pump();
    
    expect(find.text('Force = [1.0,0.0,0.0]'), findsOneWidget);
  });

  testWidgets('magnitude dialog gives the right answer', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home:CalculatorMain()));

    await tester.tap(find.byKey(const Key('mag')));
    await tester.pump();
    await tester.enterText(find.byKey(const Key('vx')), '2');
    await tester.pump();
    await tester.enterText(find.byKey(const Key('vy')), '2');
    await tester.pump();
    await tester.enterText(find.byKey(const Key('vz')), '1');
    await tester.pump();
    await tester.tap(find.byKey(const Key('calc')));
    await tester.pump();

    expect(find.text('Magnitude = 3.0'), findsOneWidget);
  });

  testWidgets('momentum dialog gives the right answer', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: CalculatorMain()));

    await tester.tap(find.byKey(const Key('mv')));
    await tester.pump();
    await tester.enterText(find.byKey(const Key('vx')), '2');
    await tester.pump();
    await tester.enterText(find.byKey(const Key('m')), '5');
    await tester.pump();
    await tester.tap(find.byKey(const Key('calc')));
    await tester.pump();

    expect(find.text('Momentum = [10.0,0.0,0.0]'), findsOneWidget);
  });
}