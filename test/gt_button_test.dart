import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

void main() {

 testWidgets('GtButton Widget', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        body: Container(
          child: GtButton(
            text: "Click Me",
            icondata: Icons.add,
            buttonType: GtButtonType.BUTTON,
            toggleable: true,
            onPressed: (){

            },
          )
          ),
        ),
      ),
  );

  await tester.tap(find.byIcon(Icons.add));
  await tester.pump();
  });
}