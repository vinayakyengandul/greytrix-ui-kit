import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

void main() {

  testWidgets('Custom CheckBox Widget', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: GtAppBar(
          title: GtText(text: "app",),
        ),
        body: Container(
          child: GtCustomCheckbox(
            iconSize: 20,
            isChecked: true,
            onchanged: (){},
            selectedIconColor: Colors.white10,
            selectedColor: Colors.red,
            size: 10,
          ),
         )
        ),
      ),
  );

    final titleFinder = find.text('app');
    await tester.pump();
    expect(titleFinder, findsOneWidget);

  });
}