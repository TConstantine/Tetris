import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tetris/tetris_application.dart';

void main() {
  testWidgets('Start a new single player game',
      (WidgetTester tester) async {
    await tester.pumpWidget(TetrisApplication());
    await tester.tap(find.widgetWithText(FlatButton, 'Single Player'));
    await tester.pump();
    await tester.pump();
    expect(find.text('Touch to start'), findsOneWidget);
  });
}
