import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

void main() {

  testWidgets('GtListPage Widget', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: GtAppBar(
          title: GtText(text: "app",),
        ),
        body: Container(
          child: GtListPage(
              rowsCount: 2,
              title: GtText(
              textStyle: TextStyle(
                color: Colors.black,
              ),
                text: "Task"
              ),
              leadingIcon: GtIcon(
              icondata: Icons.account_circle_rounded,
              ),
              isLeadingShow: false,
              listItems: [{"Id": 2093,"CompanyId": 0,"Code": "GT0521","FName": "DEMO USER",},
              {"Id": 2093,"CompanyId": 0,"Code": "GT011","FName": "DEMO MANAGER",}],
              viewtype: ViewType.list,
              spaceBetweenKeyValue: false,
              toMapjson: {
              'Name': GtTileField(
                valuePath: 'FName',
                row: 1,
                flex: 4,
                mobileRow: 1,
                mobileFlex: 3,
                cardRow: 1,
                type: GtFieldType.STRING,
                keyTextStyle: TextStyle(color: Colors.black,fontSize: 15),
                valueTextStyle: TextStyle(color: Colors.black,fontSize: 16),
                keyTextAlign: TextAlign.start,
                valueTextAlign: TextAlign.end,
                displayKey: true,
                keyValueBetween: " : ",
                webTextFormatType: TextformatType.textwithopacity,
              ),
              'Code': GtTileField(
                valuePath: 'Code',
                row: 1,
                flex: 4,
                mobileRow: 2,
                mobileFlex: 3,
                cardRow: 1,
                type: GtFieldType.STRING,
                keyTextStyle: TextStyle(color: Colors.black,fontSize: 15),
                valueTextStyle: TextStyle(color: Colors.black,fontSize: 16),
                keyTextAlign: TextAlign.start,
                valueTextAlign: TextAlign.end,
                displayKey: true,
                keyValueBetween: " : ",
                webTextFormatType: TextformatType.textwithopacity,
              ),
              },
              tag: "Task",
              gtTileRowMainAxisAlignment: MainAxisAlignment.center,
              gtTileRowCrossAxisAlignment: CrossAxisAlignment.center,
              isSpaceInRecords: true,
              isleadingIconPosition: false,
              size: Get.size,
              listViewTableType: GTListViewTableType.Normal,
              cardColor: Colors.blueGrey[200],
              enablefilter: false,
              backgroundcolor: Colors.white10,
              cardMarginEdgeInsets: const EdgeInsets.all(5),
              listItemPadding: const EdgeInsets.only(left: 15,right: 30, top: 8,bottom: 8),
              backNavigation: true,
              horizinalScrollable: false,
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