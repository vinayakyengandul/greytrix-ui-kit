import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

void main() {

 testWidgets('GtIcon Widget', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        body: Container(
          child: GtIcon(icondata: Icons.tab_outlined,color: Colors.red,size: 23,)
          ),
        ),
      ),
  );

  await tester.pump();
  });

  testWidgets('Widget passed in drawer', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        drawer: Container(
          child: GtIcon(icondata: Icons.tab_outlined,color: Colors.red,size: 23,)
          ),
        ),
      ),
  );

  scaffoldKey.currentState.openDrawer();
  await tester.pump();
  });

}