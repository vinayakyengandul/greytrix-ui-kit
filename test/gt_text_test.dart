import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

void main() {

  testWidgets('GtText Widget', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    const displayText = "Text Value";
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        body: Container(
          child: GtText(text: displayText,
            textStyle: TextStyle(fontSize: 50),
          ),
        ),
      ),
    )
  );

  await tester.pump();
  expect(find.text(displayText), findsOneWidget);

  });

   testWidgets('All parameters passed', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    const displayText = "Text Value";
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        drawer: Container(
          child: GtText(text: displayText,
            iconColor: Colors.red,
            iconData: Icons.tab,
            iconSize: 20.1,
            maxLines: 2,
            position: GtPosition.POSTFIX,
            textAlign: TextAlign.center,
            textOverflow: TextOverflow.ellipsis,
            textStyle: TextStyle(fontSize: 50),
          ),
        ),
      ),
    )
  );

  scaffoldKey.currentState.openDrawer();
  await tester.pump();

  expect(find.text(displayText), findsOneWidget);

  });

}