import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

void main() {

  testWidgets('User Menu Bar Widget', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: GtAppBar(
          title: GtText(text: "app",),
        ),
        body: Container(
          child: GtUserMenuBar(
               userName: "Sara",
               leadingAvatar: false,
                  userNameTextStyle: TextStyle(
               color: Color.fromRGBO(152, 156, 173, 1),
            fontWeight: FontWeight.bold),
            iconWidgets: [
            IconButton(
            icon: Icon(Icons.notifications_rounded), onPressed: () => {})
            ],
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