import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

void main() {

  testWidgets('GtDropdownFormField Widget', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: GtAppBar(
          title: GtText(text: "app",),
        ),
        body: Container(
          child: GtDropdownFormField(
                    iconData: Icons.arrow_circle_down,
                    label: "Demo",
                    dropdownValue: "User1",
                    isRequired: false,
                    items: {"User1" : "User1", "User2": "User2"},
                    onChangedhandler: (data) {}
                )
        )
        ),
      ),
  );

    final titleFinder = find.text('Demo');
    await tester.pump();
    expect(titleFinder, findsOneWidget);

  });

   testWidgets('GtDropdownFormField Widget With List type', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    List<dynamic> data =  [{"Name" : "Pravin", "Code" : "123"}, {"Name": "Raj", "Code": "456"}];
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: GtAppBar(
          title: GtText(text: "app",),
        ),
        body: Container(
          child: GtDropdownFormField(
                    iconData: Icons.arrow_circle_down,
                    label: "Demo",
                    dropdownValue: data[0],
                    isRequired: false,
                    items: data,
                    itemType: GtDropDownFormFieldItemType.LIST,
                    listLookupField: const {
                      "NAME" : "Name", "CODE" : "Code"
                    },
                    onChangedhandler: (data) {}
                )
        )
        ),
      ),
  );

    final titleFinder = find.text('Demo');
    await tester.pump();
    expect(titleFinder, findsOneWidget);

  });

   testWidgets('GtDropdownFormField Widget Map type with custom', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    dynamic data =  {"Name" : "Pravin", "Code" : "123"};
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: GtAppBar(
          title: GtText(text: "app",),
        ),
        body: Container(
          child: GtDropdownFormField(
                    iconData: Icons.arrow_circle_down,
                    label: "Demo",
                    dropdownValue: "Pravin",
                    isRequired: false,
                    items: data,
                    itemCustomWidget: (value){
                      return DropdownMenuItem(
                         value: value.value,
                        child: GtText(text: value.key)
                      );
                    },
                    dropDownFormFieldIsCustom: GtDropDownFormFieldIsCustom.CUSTOM,
                    itemType: GtDropDownFormFieldItemType.MAP,
                    onChangedhandler: (data) {}
                )
        )
        ),
      ),
  );

    final titleFinder = find.text('Demo');
    await tester.pump();
    expect(titleFinder, findsOneWidget);

  });

  testWidgets('GtDropdownFormField Widget List type With custom', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    List<dynamic> data =  [{"Name" : "Pravin", "Code" : "123"}, {"Name": "Raj", "Code": "456"}];
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: GtAppBar(
          title: GtText(text: "app",),
        ),
        body: Container(
          child: GtDropdownFormField(
                    iconData: Icons.arrow_circle_down,
                    label: "Demo",
                    dropdownValue: data[0],
                    isRequired: false,
                    items: data,
                    itemType: GtDropDownFormFieldItemType.LIST,
                     itemCustomWidget: (value){
                      return DropdownMenuItem(
                         value: value,
                        child: GtText(text:  value.entries.first.value,)
                      );
                    },
                    dropDownFormFieldIsCustom: GtDropDownFormFieldIsCustom.CUSTOM,
                    listLookupField: const {
                      "NAME" : "Name", "CODE" : "Code"
                    },
                    onChangedhandler: (data) {}
                )
        )
        ),
      ),
  );

    final titleFinder = find.text('Demo');
    await tester.pump();
    expect(titleFinder, findsOneWidget);

  });

}