import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

void main() {

 testWidgets('GtAvatar Widget', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        body: Container(
          child: GtAvatar(
            listOfImg: ["",
            "",
            ""],
            withFactor: 0.4,
            isMultiple: true,
            imgShowCount: 2,
            radius: 21,
            textStyle: TextStyle(fontSize: 20),
          )
          ),
        ),
      ),
  );

  await tester.pump();
  });
}