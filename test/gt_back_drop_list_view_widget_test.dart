import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

void main() {
  testWidgets('GtBackDropListView Widget', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
            body: Container(
                child: GtBackDropListView(
              scaffoldKey: scaffoldKey,
              actionwidgets: [],
              frontLayer: GtText(
                text: "FRONT LAYER",
                textStyle: TextStyle(fontSize: 30),
              ),
              backLayer: GtText(
                text: "BACK LAYER",
                textStyle: TextStyle(fontSize: 30),
              ),
              backdropAppBar: BackdropAppBar(
                title: GtText(text: "BACKDROP WIDGET"),
              ),
            ))),
      ),
    );
    await tester.pump();
  });
}
