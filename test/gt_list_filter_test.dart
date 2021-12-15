import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

void main() {
  testWidgets('GtListFilter Widget', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    const displayText = "FName";
    await tester.pumpWidget(MaterialApp(
      theme: AppFlexTheme.fromType(FlexScheme.bigStone).themeData,
      home: Scaffold(
        key: scaffoldKey,
        body: Container(
            child: GtListFilter(
          isBackDrop: true,
          isFilterProcessing: true,
          filterHandler: (data, filteadv) {},
          onFilterClearHandler: (data, filteadv) {},
          toMapjson: {
            "Code": GtTileField(
                valuePath: "Code",
                type: GtFieldType.FILTER,
                filterType: GtFilterType.TEXT_FILTER,
                filterValue: 'Code',
                filterLabel: 'Customer Code',
                textEditingController: new TextEditingController()),
            "FName": GtTileField(
                valuePath: "FName",
                type: GtFieldType.FILTER,
                filterType: GtFilterType.TEXT_FILTER,
                filterValue: 'Name',
                filterLabel: 'Customer Name',
                textEditingController: new TextEditingController()),
          } as Map<String, GtTileField>,
          changeBackDrop: (s) {},
          isBackDropController: true,
          advanceFilterFields: [
            GtAdvanceFilterField(
                label: "FName",
                value: "FName",
                type: GtAdvanceFilterFieldOperatorType.STRING),
            GtAdvanceFilterField(
                label: "code",
                value: "Code",
                type: GtAdvanceFilterFieldOperatorType.STRING),
            GtAdvanceFilterField(
                label: "Id",
                value: "Id",
                type: GtAdvanceFilterFieldOperatorType.NUMERIC),
          ],
          isAdvanceFilterEnable: true,
          operatorString: [
            GtAdvanceFilterOperator(
                label: "LIKE",
                value: "_like",
                type: GtAdvanceFilterOperatorType.STRING),
            GtAdvanceFilterOperator(
                label: "ILIKE",
                value: "_ilike",
                type: GtAdvanceFilterOperatorType.STRING)
          ],
          operatorNumeric: [
            GtAdvanceFilterOperator(
                label: "GTE",
                value: "_gte",
                type: GtAdvanceFilterOperatorType.NUMERIC),
            GtAdvanceFilterOperator(
                label: "LTE",
                value: "_lte",
                type: GtAdvanceFilterOperatorType.NUMERIC)
          ],
          operatorCommon: [
            GtAdvanceFilterOperator(
                label: "EQUAL",
                value: "_eq",
                type: GtAdvanceFilterOperatorType.COMMON),
            GtAdvanceFilterOperator(
                label: "NEQ",
                value: "_neq",
                type: GtAdvanceFilterOperatorType.COMMON)
          ],
          keyLabel: "CustomerFilter",
        )),
      ),
    ));

    await tester.pump();
    expect(find.text(displayText), findsOneWidget);
  });

  testWidgets('GtListFilter Widget with idAdvanceFilterEnable false',
      (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    const displayText = "FName";
    await tester.pumpWidget(MaterialApp(
      theme: AppFlexTheme.fromType(FlexScheme.bigStone).themeData,
      home: Scaffold(
        key: scaffoldKey,
        body: Container(
            child: GtListFilter(
          isBackDrop: true,
          isFilterProcessing: true,
          filterHandler: (data, filteadv) {},
          onFilterClearHandler: (data, filteadv) {},
          toMapjson: {
            "Code": GtTileField(
                valuePath: "Code",
                type: GtFieldType.FILTER,
                filterType: GtFilterType.TEXT_FILTER,
                filterValue: 'Code',
                filterLabel: 'Customer Code',
                textEditingController: new TextEditingController()),
            "FName": GtTileField(
                valuePath: "FName",
                type: GtFieldType.FILTER,
                filterType: GtFilterType.TEXT_FILTER,
                filterValue: 'Name',
                filterLabel: 'Customer Name',
                textEditingController: new TextEditingController()),
          } as Map<String, GtTileField>,
          changeBackDrop: (s) {},
          isBackDropController: true,
          advanceFilterFields: [
            GtAdvanceFilterField(
                label: "FName",
                value: "FName",
                type: GtAdvanceFilterFieldOperatorType.STRING),
            GtAdvanceFilterField(
                label: "code",
                value: "Code",
                type: GtAdvanceFilterFieldOperatorType.STRING),
            GtAdvanceFilterField(
                label: "Id",
                value: "Id",
                type: GtAdvanceFilterFieldOperatorType.NUMERIC),
          ],
          isAdvanceFilterEnable: false,
          operatorString: [
            GtAdvanceFilterOperator(
                label: "LIKE",
                value: "_like",
                type: GtAdvanceFilterOperatorType.STRING),
            GtAdvanceFilterOperator(
                label: "ILIKE",
                value: "_ilike",
                type: GtAdvanceFilterOperatorType.STRING)
          ],
          operatorNumeric: [
            GtAdvanceFilterOperator(
                label: "GTE",
                value: "_gte",
                type: GtAdvanceFilterOperatorType.NUMERIC),
            GtAdvanceFilterOperator(
                label: "LTE",
                value: "_lte",
                type: GtAdvanceFilterOperatorType.NUMERIC)
          ],
          operatorCommon: [
            GtAdvanceFilterOperator(
                label: "EQUAL",
                value: "_eq",
                type: GtAdvanceFilterOperatorType.COMMON),
            GtAdvanceFilterOperator(
                label: "NEQ",
                value: "_neq",
                type: GtAdvanceFilterOperatorType.COMMON)
          ],
          keyLabel: "CustomerFilter",
        )),
      ),
    ));

    await tester.pump();
  });

  testWidgets('GtListFilter Widget without Advance filter toMapJson',
      (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    const displayText = "FName";
    await tester.pumpWidget(MaterialApp(
      theme: AppFlexTheme.fromType(FlexScheme.bigStone).themeData,
      home: Scaffold(
        key: scaffoldKey,
        body: Container(
            child: GtListFilter(
          isBackDrop: true,
          isFilterProcessing: true,
          filterHandler: (data, filteadv) {},
          onFilterClearHandler: (data, filteadv) {},
          toMapjson: {
            "Code": GtTileField(
                valuePath: "Code",
                type: GtFieldType.FILTER,
                filterType: GtFilterType.TEXT_FILTER,
                filterValue: 'Code',
                filterLabel: 'Customer Code',
                textEditingController: new TextEditingController()),
            "FName": GtTileField(
                valuePath: "FName",
                type: GtFieldType.FILTER,
                filterType: GtFilterType.TEXT_FILTER,
                filterValue: 'Name',
                filterLabel: 'Customer Name',
                textEditingController: new TextEditingController()),
          } as Map<String, GtTileField>,
          changeBackDrop: (s) {},
          isBackDropController: false,
          isAdvanceFilterEnable: false,
          operatorString: [
            GtAdvanceFilterOperator(
                label: "LIKE",
                value: "_like",
                type: GtAdvanceFilterOperatorType.STRING),
            GtAdvanceFilterOperator(
                label: "ILIKE",
                value: "_ilike",
                type: GtAdvanceFilterOperatorType.STRING)
          ],
          operatorNumeric: [
            GtAdvanceFilterOperator(
                label: "GTE",
                value: "_gte",
                type: GtAdvanceFilterOperatorType.NUMERIC),
            GtAdvanceFilterOperator(
                label: "LTE",
                value: "_lte",
                type: GtAdvanceFilterOperatorType.NUMERIC)
          ],
          operatorCommon: [
            GtAdvanceFilterOperator(
                label: "EQUAL",
                value: "_eq",
                type: GtAdvanceFilterOperatorType.COMMON),
            GtAdvanceFilterOperator(
                label: "NEQ",
                value: "_neq",
                type: GtAdvanceFilterOperatorType.COMMON)
          ],
          keyLabel: "CustomerFilter",
        )),
      ),
    ));

    await tester.pump();
  });
}
