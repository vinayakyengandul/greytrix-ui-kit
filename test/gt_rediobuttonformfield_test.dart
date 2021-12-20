import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

void main() {

  testWidgets('GtRadioButtonFormField Widget', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: GtAppBar(
          title: GtText(text: "app",),
        ),
        body: Container(
          child: GtRadioButtonFormField(
                  label: "Demo",
                  isRequired: false,
                  selectedRadioButtonVal: "User1",
                  displayMapFields: {"User1" : "User1", "User2": "User2"},
                  onChangedHandler: (chk, data) {}
              )
        )
        ),
      ),
  );

    final titleFinder = find.text('Demo');
    await tester.pump();
    expect(titleFinder, findsOneWidget);

  });
}