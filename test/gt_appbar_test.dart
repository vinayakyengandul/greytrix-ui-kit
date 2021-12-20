import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

void main() {

  testWidgets('App Bar Widget', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: GtAppBar(
          title: GtText(text: "app",),
          leading: Container(
            child: GtIcon(icondata: Icons.person)
            ),
            automaticallyImplyLeading: true,
            elevation: 2.0,
            flexibleSpace: Container(child: GtText(text: "vv",),),
            primary: true,
            actions: [
              ElevatedButton(onPressed: (){},
              child: GtText(text: "button",),)
            ],
        ),
        body: Container(
          child: GtIcon(icondata: Icons.tab_outlined,color: Colors.red,size: 23,)
          ),
        ),
      ),
  );

    final titleFinder = find.text('app');
    final messageFinder = find.text('button');
    await tester.pump();
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);

  });

  testWidgets('App Bar with bottom bar', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: GtAppBar(
          title: GtText(text: "app",),
          leading: Container(
            child: GtIcon(icondata: Icons.person)
            ),
            automaticallyImplyLeading: true,
            elevation: 2.0,
            flexibleSpace: Container(child: GtText(text: "vv",),),
            primary: true,
            bottom: GtAppBar(title: GtText(text: "ROCK",),),
            actions: [
              ElevatedButton(onPressed: (){},
              child: GtText(text: "button",),)
            ],
        ),
        body: Container(
          child: GtIcon(icondata: Icons.tab_outlined,color: Colors.red,size: 23,)
          ),
        ),
      ),
  );

    final titleFinder = find.text('app');
    final messageFinder = find.text('button');
    await tester.pump();
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);

  });

}