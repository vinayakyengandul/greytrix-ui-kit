import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
import 'package:greytrix_ui_kit/src/views/index.dart';


void main() {

   testWidgets('appside and navigation not passed', (WidgetTester tester) async {
    await tester.pumpWidget(AppShellView(       
          appBar: GtAppBar(
            title: GtText(
              text: "TEST APP SHELL WIDGET",
            ),
          ),   
          child: Container(child:Text("check"))
        )
    );

    final titleFinder = find.text('TEST APP SHELL WIDGET');
    await tester.pump();
    expect(titleFinder, findsOneWidget);
  });
    testWidgets('appSidebar and navigation passed elevatedButton', (WidgetTester tester) async {
     await tester.pumpWidget(AppShellView(
          appSidebar: ElevatedButton(onPressed: (){},child: Icon(Icons.add),),
          navigationDrawer: ElevatedButton(onPressed: (){},child: Icon(Icons.remove),),
          child: Container(child:Text("check"))
        ));
       // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
   });
  
}

