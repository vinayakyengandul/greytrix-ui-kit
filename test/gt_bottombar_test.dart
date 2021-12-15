import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

void main() {

  testWidgets('Bottom Bar Widget', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        bottomNavigationBar: GtBottomBar(
           bottombarItems: [
             BottomNavigationBarItem(
                 icon: Icon(Icons.home_filled), label: "Home"),
             BottomNavigationBarItem(icon: Icon(Icons.person), label: "Me"),
             BottomNavigationBarItem(
                 icon: Icon(Icons.directions_walk_outlined), label: "Leave"),
             BottomNavigationBarItem(
               icon: Icon(Icons.calendar_today),
               label: "Calendar",
             ),
             BottomNavigationBarItem(
                 icon: Icon(Icons.format_align_right_sharp), label: ""),
             //
           ],
        ),
        key: scaffoldKey,
        appBar: GtAppBar(
          title: GtText(text: "app",),
        ),
        body: Container(
          child: GtIcon(icondata: Icons.tab_outlined,color: Colors.red,size: 23,)
          ),
        ),
      ),
  );

    final titleFinder = find.text('app');
    final messageFinder = find.text('Home');
    await tester.pump();
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);

  });
}