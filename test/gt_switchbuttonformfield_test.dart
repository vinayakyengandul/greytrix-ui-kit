import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

void main() {

  testWidgets('GtSwitchButtonFormField Widget', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: GtAppBar(
          title: GtText(text: "app",),
        ),
        body: Container(
          child: GtSwitchButtonFormField(
                     label: "Demo",
                     isRequired: false,
                     switchValue: true,
                     switchactiveColor: Colors.blue,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     onChangedHandler: (chk){}
                  )
        )
        ),
      ),
  );

    final titleFinder = find.text('Demo');
    expect(titleFinder, findsOneWidget);

  });
}