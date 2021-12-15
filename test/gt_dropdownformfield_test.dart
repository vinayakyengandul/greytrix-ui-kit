import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

void main() {

  testWidgets('GtDropdownFormField Widget', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: GtAppBar(
          title: GtText(text: "app",),
        ),
        body: Container(
          child: GtDropdownFormField(
                    iconData: Icons.arrow_circle_down,
                    label: "Demo",
                    dropdownValue: "User1",
                    isRequired: false,
                    items: {"User1" : "User1", "User2": "User2"},
                    onChangedhandler: (data) {}
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