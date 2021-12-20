import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

void main() {

  testWidgets('GtTestFormField Widget', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
     final TextEditingController usernameTextController = TextEditingController();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: GtAppBar(
          title: GtText(text: "app",),
        ),
        body: Container(
          child: GtTextFormField(
                fieldLabel: 'Username',
                textEditingController: usernameTextController,
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                isRequired: true,
                isReadOnly: true,
             )
        )
        ),
      ),
  );

    final titleFinder = find.text('app');
    await tester.pump();
    expect(titleFinder, findsOneWidget);

  });
}