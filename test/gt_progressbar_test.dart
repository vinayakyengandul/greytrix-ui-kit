import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

void main() {

  testWidgets('Progress Bar Widget', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: GtAppBar(
          title: GtText(text: "app",),
        ),
        body: Container(
          child: GtProgressBar(
            circularProgress: true,
            strokeWidth: 12,
            minHeight: 1,
            valueColor: Colors.white12,
          )
        )
        ),
      ),
  );

    final titleFinder = find.text('app');
    await tester.pump();
    expect(titleFinder, findsOneWidget);

  });
}