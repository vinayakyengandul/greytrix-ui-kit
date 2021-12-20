import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

void main() {

  testWidgets('GtCheckboxFormField Widget', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: GtAppBar(
          title: GtText(text: "app",),
        ),
        body: Container(
          child: GtCheckboxFormField(
                     displayMapFields: {"data" : "true","Data1": "false"},
                     selectedCheckboxValues: ["true"],
                     label: "Demo",
                     onChangedHandler: (val,data) => {}
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