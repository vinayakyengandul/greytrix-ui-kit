import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void main() {

  testWidgets('GtPdfWidget Widget', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        body: GtPdfWidget(
            initialPageFormat: PdfPageFormat.a4,
            maxPageWidth: 900,
            canChangeOrientation: false,
            pdfFileName: "samplePDF.pdf",
            pdfData: PdfData(
              pageMargin: const pw.EdgeInsets.only(left: 60, right: 60,top: 20,bottom: 20),
              baseColor: PdfColors.black,
              accentColor: PdfColors.blueGrey900,
              data: {
                "FOOTER1" : "PLEASE RETURN PALLET TO US.",
                "Logo" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTiUcsj-qK63qtTWHVLjtPS_85rVsIOvI8Jg&usqp=CAU",
                "Logo1" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkIqTOPtGnf2bb2ZUnFIx9umgPhUM4qaYqog&usqp=CAU",
                "Status" : "CHECKING ACCOUNT STATEMENT",
                "Title" : "MY FIRST BANK LTD",
                "Address": "WEI-CHUAN U.S.A., INC 955 Norcross Industrial Ct STE A Norcross, GA 30071 TEL: (770) 840-668",
                "Name": "Rahul K.",
                "billto" : "ASIAN MARKET \nASHEVILLE 22 NEW LEICESTER HWY Asheville, NC  28806 TEL: (828) 785-1653 FAX:",
                "tableHeaderDatabank" : [{
                  "statementperiod" : "2003-10-19 to 2003-11-08",
                  "accountno" : 1234566665654654,
                }],
              "tableBodyDatabank" : [{
                  "date" : "2003-10-08",
                  "desc" : "Prevoius balance",
                  "ref" : "",
                  "with" : "",
                  "dep" : "",
                  "bal" : "0.55",
                },{
                  "date" : "2003-10-14",
                  "desc" : "Payroll Deposit - HOTEL",
                  "ref" : "",
                  "with" : "",
                  "dep" : "694.30",
                  "bal" : "694.85",
                },{
                  "date" : "2003-10-14",
                  "desc" : "Payroll Deposit - HOTEL",
                  "ref" : "",
                  "with" : "",
                  "dep" : "694.30",
                  "bal" : "694.85",
                },{
                  "date" : "2003-10-14",
                  "desc" : "Payroll Deposit - HOTEL",
                  "ref" : "",
                  "with" : "",
                  "dep" : "694.30",
                  "bal" : "694.85",
                },{
                  "date" : "2003-10-14",
                  "desc" : "Payroll Deposit - HOTEL",
                  "ref" : "",
                  "with" : "",
                  "dep" : "694.30",
                  "bal" : "694.85",
                },
                ],
              },
              pdfFooter: PdfFooter(
                  maxColumn: 1,
                  maxRow: 7,
                  pdfFooterFields: [
                    PdfFooterField(
                    column: 1,
                    row: 1,
                    defaultValue: "",
                    valuePath: "FOOTER1",
                    height: 12,
                    valueTextStyle: pw.TextStyle(fontSize: 8,color: PdfColors.black, fontWeight: pw.FontWeight.bold ),
                    alignment: pw.Alignment.centerLeft,
                    // fieldType: GTHeaderFieldType.IMAGE,
                  ),
                  ]
              ),
              pdfBody: PdfBody(
                maxColumn: 1,
                maxRow: 1,
                pdfBodyFields: [
                  PdfBodyField(
                    column: 1,
                    row: 1,
                    defaultValue: "",
                    valuePath: "tableBodyDatabank",
                    fieldType: GTBodyFieldType.TABLE,
                    tableBodyDecoration: const pw.BoxDecoration(
                      borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
                      color:  PdfColors.blueGrey200
                    ),
                    pdfTable: {
                      "Date" : PdfTable(
                        valuePath: "date",
                      ),
                      "Description" : PdfTable(
                        valuePath: "desc",
                      ),
                      "Ref." : PdfTable(
                        valuePath: "ref",
                      ),
                      "Withdrawals" : PdfTable(
                        valuePath: "with",
                      ),
                      "Deposits" : PdfTable(
                        valuePath: "dep",
                      ),
                      "Balance" : PdfTable(
                        valuePath: "bal",
                      )
                    }
                  ),
                  PdfBodyField(
                    column: 1,
                    row: 1,
                    defaultValue: "",
                    valuePath: "billto",
                    fieldType: GTBodyFieldType.SUBTITLE,
                    padding: pw.EdgeInsets.all(20)
                  
                  ),
                ]
              ),
              pdfHeader: PdfHeader(
                maxColumn: 2,
                maxRow: 4,
                pdfHeaderFields: [
                  PdfHeaderField(
                    column: 2,
                    row: 1,
                    defaultValue: "",
                    valuePath: "Title",
                    alignment: pw.Alignment.centerLeft,
                  ),
                  PdfHeaderField(
                    column: 1,
                    row: 2,
                    defaultValue: "",
                    valuePath: "Address",
                    fieldType: GTHeaderFieldType.SUBTITLE,
                    padding: const pw.EdgeInsets.only(right: 40),
                    alignment: pw.Alignment.centerLeft,
                    valueTextStyle: const pw.TextStyle(color: PdfColors.black, fontSize: 10,)
                  ),
                  PdfHeaderField(
                    column: 2,
                    row: 2,
                    defaultValue: "",
                    valuePath: "Status",
                    fieldType: GTHeaderFieldType.SUBTITLE,
                    alignment: pw.Alignment.centerRight,
                    valueTextStyle: const pw.TextStyle(color: PdfColors.black, fontSize: 10)
                  ),
                  PdfHeaderField(
                    column: 1,
                    row: 3,
                    defaultValue: "",
                    valuePath: "billto",
                    height: 100,
                    fieldType: GTHeaderFieldType.SUBTITLE,
                    padding: const pw.EdgeInsets.only(right: 70,top: 20,bottom: 20),
                    alignment: pw.Alignment.centerLeft,
                    keyTextStyle: const pw.TextStyle(color: PdfColors.red300, fontSize: 12),
                    valueTextStyle: const pw.TextStyle(color: PdfColors.black, fontSize: 12)
                  ),
                  PdfHeaderField(
                    column: 2,
                    row: 3,
                    defaultValue: "",
                    tableHeaderDecoration: const pw.BoxDecoration(
                      borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
                      color:  PdfColors.blueGrey200
                    ),
                    valuePath: "tableHeaderDatabank",
                    fieldType: GTHeaderFieldType.TABLE,
                    height: 100,
                    pdfTable: {
                      "Statement period" : PdfTable(
                        valuePath: "statementperiod",
                      ),
                      "Account No" : PdfTable(
                        valuePath: "accountno",
                      ),
                    }
                  ),
                  PdfHeaderField(
                    column: 1,
                    row: 1,
                    defaultValue: "",
                    valuePath: "Logo",
                    height: 50,
                    alignment: pw.Alignment.topRight,
                    fieldType: GTHeaderFieldType.IMAGE,
                  ),
                  PdfHeaderField(
                    column: 2,
                    row: 4,
                    defaultValue: "",
                    valuePath: "Logo1",
                    height: 50,
                    alignment: pw.Alignment.centerLeft,
                    fieldType: GTHeaderFieldType.IMAGE,
                  ),
                ]
              )
          ),
        ),
      ),
    ),
  );

  await tester.pump();
  });

  testWidgets('GtPdfWidget Widget without body class', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        body: GtPdfWidget(
            initialPageFormat: PdfPageFormat.a4,
            maxPageWidth: 900,
            canChangeOrientation: false,
            pdfFileName: "samplePDF.pdf",
            pdfData: PdfData(
              pageMargin: const pw.EdgeInsets.only(left: 60, right: 60,top: 20,bottom: 20),
              baseColor: PdfColors.black,
              accentColor: PdfColors.blueGrey900,
              data: {
                "FOOTER1" : "PLEASE RETURN PALLET TO US.",
                "Logo" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTiUcsj-qK63qtTWHVLjtPS_85rVsIOvI8Jg&usqp=CAU",
                "Logo1" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkIqTOPtGnf2bb2ZUnFIx9umgPhUM4qaYqog&usqp=CAU",
                "Status" : "CHECKING ACCOUNT STATEMENT",
                "Title" : "MY FIRST BANK LTD",
                "Address": "WEI-CHUAN U.S.A., INC 955 Norcross Industrial Ct STE A Norcross, GA 30071 TEL: (770) 840-668",
                "Name": "Rahul K.",
                "billto" : "ASIAN MARKET \nASHEVILLE 22 NEW LEICESTER HWY Asheville, NC  28806 TEL: (828) 785-1653 FAX:",
                "tableHeaderDatabank" : [{
                  "statementperiod" : "2003-10-19 to 2003-11-08",
                  "accountno" : 1234566665654654,
                }],
              "tableBodyDatabank" : [{
                  "date" : "2003-10-08",
                  "desc" : "Prevoius balance",
                  "ref" : "",
                  "with" : "",
                  "dep" : "",
                  "bal" : "0.55",
                },{
                  "date" : "2003-10-14",
                  "desc" : "Payroll Deposit - HOTEL",
                  "ref" : "",
                  "with" : "",
                  "dep" : "694.30",
                  "bal" : "694.85",
                },{
                  "date" : "2003-10-14",
                  "desc" : "Payroll Deposit - HOTEL",
                  "ref" : "",
                  "with" : "",
                  "dep" : "694.30",
                  "bal" : "694.85",
                },{
                  "date" : "2003-10-14",
                  "desc" : "Payroll Deposit - HOTEL",
                  "ref" : "",
                  "with" : "",
                  "dep" : "694.30",
                  "bal" : "694.85",
                },{
                  "date" : "2003-10-14",
                  "desc" : "Payroll Deposit - HOTEL",
                  "ref" : "",
                  "with" : "",
                  "dep" : "694.30",
                  "bal" : "694.85",
                },
                ],
              },
              pdfFooter: PdfFooter(
                  maxColumn: 1,
                  maxRow: 7,
                  pdfFooterFields: [
                    PdfFooterField(
                    column: 1,
                    row: 1,
                    defaultValue: "",
                    valuePath: "FOOTER1",
                    height: 12,
                    valueTextStyle: pw.TextStyle(fontSize: 8,color: PdfColors.black, fontWeight: pw.FontWeight.bold ),
                    alignment: pw.Alignment.centerLeft,
                    // fieldType: GTHeaderFieldType.IMAGE,
                  ),
                  ]
              ),
              // pdfBody: PdfBody(
              //   maxColumn: 1,
              //   maxRow: 1,
              //   pdfBodyFields: [
              //     PdfBodyField(
              //       column: 1,
              //       row: 1,
              //       defaultValue: "",
              //       valuePath: "tableBodyDatabank",
              //       fieldType: GTBodyFieldType.TABLE,
              //       tableBodyDecoration: const pw.BoxDecoration(
              //         borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
              //         color:  PdfColors.blueGrey200
              //       ),
              //       pdfTable: {
              //         "Date" : PdfTable(
              //           valuePath: "date",
              //         ),
              //         "Description" : PdfTable(
              //           valuePath: "desc",
              //         ),
              //         "Ref." : PdfTable(
              //           valuePath: "ref",
              //         ),
              //         "Withdrawals" : PdfTable(
              //           valuePath: "with",
              //         ),
              //         "Deposits" : PdfTable(
              //           valuePath: "dep",
              //         ),
              //         "Balance" : PdfTable(
              //           valuePath: "bal",
              //         )
              //       }
              //     ),
              //     PdfBodyField(
              //       column: 1,
              //       row: 1,
              //       defaultValue: "",
              //       valuePath: "billto",
              //       fieldType: GTBodyFieldType.SUBTITLE,
              //       padding: pw.EdgeInsets.all(20)
                  
              //     ),
              //   ]
              // ),
              pdfHeader: PdfHeader(
                maxColumn: 2,
                maxRow: 4,
                pdfHeaderFields: [
                  PdfHeaderField(
                    column: 2,
                    row: 1,
                    defaultValue: "",
                    valuePath: "Title",
                    alignment: pw.Alignment.centerLeft,
                  ),
                  PdfHeaderField(
                    column: 1,
                    row: 2,
                    defaultValue: "",
                    valuePath: "Address",
                    fieldType: GTHeaderFieldType.SUBTITLE,
                    padding: const pw.EdgeInsets.only(right: 40),
                    alignment: pw.Alignment.centerLeft,
                    valueTextStyle: const pw.TextStyle(color: PdfColors.black, fontSize: 10,)
                  ),
                  PdfHeaderField(
                    column: 2,
                    row: 2,
                    defaultValue: "",
                    valuePath: "Status",
                    fieldType: GTHeaderFieldType.SUBTITLE,
                    alignment: pw.Alignment.centerRight,
                    valueTextStyle: const pw.TextStyle(color: PdfColors.black, fontSize: 10)
                  ),
                  PdfHeaderField(
                    column: 1,
                    row: 3,
                    defaultValue: "",
                    valuePath: "billto",
                    height: 100,
                    fieldType: GTHeaderFieldType.SUBTITLE,
                    padding: const pw.EdgeInsets.only(right: 70,top: 20,bottom: 20),
                    alignment: pw.Alignment.centerLeft,
                    keyTextStyle: const pw.TextStyle(color: PdfColors.red300, fontSize: 12),
                    valueTextStyle: const pw.TextStyle(color: PdfColors.black, fontSize: 12)
                  ),
                  PdfHeaderField(
                    column: 2,
                    row: 3,
                    defaultValue: "",
                    tableHeaderDecoration: const pw.BoxDecoration(
                      borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
                      color:  PdfColors.blueGrey200
                    ),
                    valuePath: "tableHeaderDatabank",
                    fieldType: GTHeaderFieldType.TABLE,
                    height: 100,
                    pdfTable: {
                      "Statement period" : PdfTable(
                        valuePath: "statementperiod",
                      ),
                      "Account No" : PdfTable(
                        valuePath: "accountno",
                      ),
                    }
                  ),
                  PdfHeaderField(
                    column: 1,
                    row: 1,
                    defaultValue: "",
                    valuePath: "Logo",
                    height: 50,
                    alignment: pw.Alignment.topRight,
                    fieldType: GTHeaderFieldType.IMAGE,
                  ),
                  PdfHeaderField(
                    column: 2,
                    row: 4,
                    defaultValue: "",
                    valuePath: "Logo1",
                    height: 50,
                    alignment: pw.Alignment.centerLeft,
                    fieldType: GTHeaderFieldType.IMAGE,
                  ),
                ]
              )
          ),
        ),
      ),
    ),
  );

  await tester.pump();
  });

   testWidgets('GtPdfWidget Widget Without Header class', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        body: GtPdfWidget(
            initialPageFormat: PdfPageFormat.a4,
            maxPageWidth: 900,
            canChangeOrientation: false,
            pdfFileName: "samplePDF.pdf",
            pdfData: PdfData(
              pageMargin: const pw.EdgeInsets.only(left: 60, right: 60,top: 20,bottom: 20),
              baseColor: PdfColors.black,
              accentColor: PdfColors.blueGrey900,
              data: {
                "FOOTER1" : "PLEASE RETURN PALLET TO US.",
                "Logo" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTiUcsj-qK63qtTWHVLjtPS_85rVsIOvI8Jg&usqp=CAU",
                "Logo1" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkIqTOPtGnf2bb2ZUnFIx9umgPhUM4qaYqog&usqp=CAU",
                "Status" : "CHECKING ACCOUNT STATEMENT",
                "Title" : "MY FIRST BANK LTD",
                "Address": "WEI-CHUAN U.S.A., INC 955 Norcross Industrial Ct STE A Norcross, GA 30071 TEL: (770) 840-668",
                "Name": "Rahul K.",
                "billto" : "ASIAN MARKET \nASHEVILLE 22 NEW LEICESTER HWY Asheville, NC  28806 TEL: (828) 785-1653 FAX:",
                "tableHeaderDatabank" : [{
                  "statementperiod" : "2003-10-19 to 2003-11-08",
                  "accountno" : 1234566665654654,
                }],
              "tableBodyDatabank" : [{
                  "date" : "2003-10-08",
                  "desc" : "Prevoius balance",
                  "ref" : "",
                  "with" : "",
                  "dep" : "",
                  "bal" : "0.55",
                },{
                  "date" : "2003-10-14",
                  "desc" : "Payroll Deposit - HOTEL",
                  "ref" : "",
                  "with" : "",
                  "dep" : "694.30",
                  "bal" : "694.85",
                },{
                  "date" : "2003-10-14",
                  "desc" : "Payroll Deposit - HOTEL",
                  "ref" : "",
                  "with" : "",
                  "dep" : "694.30",
                  "bal" : "694.85",
                },{
                  "date" : "2003-10-14",
                  "desc" : "Payroll Deposit - HOTEL",
                  "ref" : "",
                  "with" : "",
                  "dep" : "694.30",
                  "bal" : "694.85",
                },{
                  "date" : "2003-10-14",
                  "desc" : "Payroll Deposit - HOTEL",
                  "ref" : "",
                  "with" : "",
                  "dep" : "694.30",
                  "bal" : "694.85",
                },
                ],
              },
              pdfFooter: PdfFooter(
                  maxColumn: 1,
                  maxRow: 7,
                  pdfFooterFields: [
                    PdfFooterField(
                    column: 1,
                    row: 1,
                    defaultValue: "",
                    valuePath: "FOOTER1",
                    height: 12,
                    valueTextStyle: pw.TextStyle(fontSize: 8,color: PdfColors.black, fontWeight: pw.FontWeight.bold ),
                    alignment: pw.Alignment.centerLeft,
                    // fieldType: GTHeaderFieldType.IMAGE,
                  ),
                  ]
              ),
              pdfBody: PdfBody(
                maxColumn: 1,
                maxRow: 1,
                pdfBodyFields: [
                  PdfBodyField(
                    column: 1,
                    row: 1,
                    defaultValue: "",
                    valuePath: "tableBodyDatabank",
                    fieldType: GTBodyFieldType.TABLE,
                    tableBodyDecoration: const pw.BoxDecoration(
                      borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
                      color:  PdfColors.blueGrey200
                    ),
                    pdfTable: {
                      "Date" : PdfTable(
                        valuePath: "date",
                      ),
                      "Description" : PdfTable(
                        valuePath: "desc",
                      ),
                      "Ref." : PdfTable(
                        valuePath: "ref",
                      ),
                      "Withdrawals" : PdfTable(
                        valuePath: "with",
                      ),
                      "Deposits" : PdfTable(
                        valuePath: "dep",
                      ),
                      "Balance" : PdfTable(
                        valuePath: "bal",
                      )
                    }
                  ),
                  PdfBodyField(
                    column: 1,
                    row: 1,
                    defaultValue: "",
                    valuePath: "billto",
                    fieldType: GTBodyFieldType.SUBTITLE,
                    padding: pw.EdgeInsets.all(20)
                  
                  ),
                ]
              ),
          ),
        ),
      ),
    ),
  );

  await tester.pump();
  });

  testWidgets('GtPdfWidget Widget without Footer class', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        body: GtPdfWidget(
            initialPageFormat: PdfPageFormat.a4,
            maxPageWidth: 900,
            canChangeOrientation: false,
            pdfFileName: "samplePDF.pdf",
            pdfData: PdfData(
              pageMargin: const pw.EdgeInsets.only(left: 60, right: 60,top: 20,bottom: 20),
              baseColor: PdfColors.black,
              accentColor: PdfColors.blueGrey900,
              data: {
                "FOOTER1" : "PLEASE RETURN PALLET TO US.",
                "Logo" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTiUcsj-qK63qtTWHVLjtPS_85rVsIOvI8Jg&usqp=CAU",
                "Logo1" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkIqTOPtGnf2bb2ZUnFIx9umgPhUM4qaYqog&usqp=CAU",
                "Status" : "CHECKING ACCOUNT STATEMENT",
                "Title" : "MY FIRST BANK LTD",
                "Address": "WEI-CHUAN U.S.A., INC 955 Norcross Industrial Ct STE A Norcross, GA 30071 TEL: (770) 840-668",
                "Name": "Rahul K.",
                "billto" : "ASIAN MARKET \nASHEVILLE 22 NEW LEICESTER HWY Asheville, NC  28806 TEL: (828) 785-1653 FAX:",
                "tableHeaderDatabank" : [{
                  "statementperiod" : "2003-10-19 to 2003-11-08",
                  "accountno" : 1234566665654654,
                }],
              "tableBodyDatabank" : [{
                  "date" : "2003-10-08",
                  "desc" : "Prevoius balance",
                  "ref" : "",
                  "with" : "",
                  "dep" : "",
                  "bal" : "0.55",
                },{
                  "date" : "2003-10-14",
                  "desc" : "Payroll Deposit - HOTEL",
                  "ref" : "",
                  "with" : "",
                  "dep" : "694.30",
                  "bal" : "694.85",
                },{
                  "date" : "2003-10-14",
                  "desc" : "Payroll Deposit - HOTEL",
                  "ref" : "",
                  "with" : "",
                  "dep" : "694.30",
                  "bal" : "694.85",
                },{
                  "date" : "2003-10-14",
                  "desc" : "Payroll Deposit - HOTEL",
                  "ref" : "",
                  "with" : "",
                  "dep" : "694.30",
                  "bal" : "694.85",
                },{
                  "date" : "2003-10-14",
                  "desc" : "Payroll Deposit - HOTEL",
                  "ref" : "",
                  "with" : "",
                  "dep" : "694.30",
                  "bal" : "694.85",
                },
                ],
              },
              pdfBody: PdfBody(
                maxColumn: 1,
                maxRow: 1,
                pdfBodyFields: [
                  PdfBodyField(
                    column: 1,
                    row: 1,
                    defaultValue: "",
                    valuePath: "tableBodyDatabank",
                    fieldType: GTBodyFieldType.TABLE,
                    tableBodyDecoration: const pw.BoxDecoration(
                      borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
                      color:  PdfColors.blueGrey200
                    ),
                    pdfTable: {
                      "Date" : PdfTable(
                        valuePath: "date",
                      ),
                      "Description" : PdfTable(
                        valuePath: "desc",
                      ),
                      "Ref." : PdfTable(
                        valuePath: "ref",
                      ),
                      "Withdrawals" : PdfTable(
                        valuePath: "with",
                      ),
                      "Deposits" : PdfTable(
                        valuePath: "dep",
                      ),
                      "Balance" : PdfTable(
                        valuePath: "bal",
                      )
                    }
                  ),
                  PdfBodyField(
                    column: 1,
                    row: 1,
                    defaultValue: "",
                    valuePath: "billto",
                    fieldType: GTBodyFieldType.SUBTITLE,
                    padding: pw.EdgeInsets.all(20)
                  
                  ),
                ]
              ),
              pdfHeader: PdfHeader(
                maxColumn: 2,
                maxRow: 4,
                pdfHeaderFields: [
                  PdfHeaderField(
                    column: 2,
                    row: 1,
                    defaultValue: "",
                    valuePath: "Title",
                    alignment: pw.Alignment.centerLeft,
                  ),
                  PdfHeaderField(
                    column: 1,
                    row: 2,
                    defaultValue: "",
                    valuePath: "Address",
                    fieldType: GTHeaderFieldType.SUBTITLE,
                    padding: const pw.EdgeInsets.only(right: 40),
                    alignment: pw.Alignment.centerLeft,
                    valueTextStyle: const pw.TextStyle(color: PdfColors.black, fontSize: 10,)
                  ),
                  PdfHeaderField(
                    column: 2,
                    row: 2,
                    defaultValue: "",
                    valuePath: "Status",
                    fieldType: GTHeaderFieldType.SUBTITLE,
                    alignment: pw.Alignment.centerRight,
                    valueTextStyle: const pw.TextStyle(color: PdfColors.black, fontSize: 10)
                  ),
                  PdfHeaderField(
                    column: 1,
                    row: 3,
                    defaultValue: "",
                    valuePath: "billto",
                    height: 100,
                    fieldType: GTHeaderFieldType.SUBTITLE,
                    padding: const pw.EdgeInsets.only(right: 70,top: 20,bottom: 20),
                    alignment: pw.Alignment.centerLeft,
                    keyTextStyle: const pw.TextStyle(color: PdfColors.red300, fontSize: 12),
                    valueTextStyle: const pw.TextStyle(color: PdfColors.black, fontSize: 12)
                  ),
                  PdfHeaderField(
                    column: 2,
                    row: 3,
                    defaultValue: "",
                    tableHeaderDecoration: const pw.BoxDecoration(
                      borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
                      color:  PdfColors.blueGrey200
                    ),
                    valuePath: "tableHeaderDatabank",
                    fieldType: GTHeaderFieldType.TABLE,
                    height: 100,
                    pdfTable: {
                      "Statement period" : PdfTable(
                        valuePath: "statementperiod",
                      ),
                      "Account No" : PdfTable(
                        valuePath: "accountno",
                      ),
                    }
                  ),
                  PdfHeaderField(
                    column: 1,
                    row: 1,
                    defaultValue: "",
                    valuePath: "Logo",
                    height: 50,
                    alignment: pw.Alignment.topRight,
                    fieldType: GTHeaderFieldType.IMAGE,
                  ),
                  PdfHeaderField(
                    column: 2,
                    row: 4,
                    defaultValue: "",
                    valuePath: "Logo1",
                    height: 50,
                    alignment: pw.Alignment.centerLeft,
                    fieldType: GTHeaderFieldType.IMAGE,
                  ),
                ]
              )
          ),
        ),
      ),
    ),
  );

  await tester.pump();
  });
}