import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

void main() {

  testWidgets('GtDynamicView Widget', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: GtAppBar(
          title: GtText(text: "app",),
        ),
        body: Container(
          child:GtDynamicView(
                   rowsCount: 11,
                   title: 'PERSONAL DETAILS',
                   toMapjson: {
                      'Personal Email Id': GtTileField(
                           displayKey: true,
                           row: 1,
                           valuePath: 'email',
                           flex: 1,
                           mobileRow: 1,
                       ),
                      'Blood Group': GtTileField(
                          displayKey: true,
                          row: 1,
                          valuePath: 'bloodgroup',
                          flex: 1,
                          mobileRow: 2,
                       ),
                      'Address1': GtTileField(
                          displayKey: true,
                          row: 2,
                          valuePath: 'address1',
                          flex: 1,
                          mobileRow: 3,
                       ),
                      'Address2': GtTileField(
                          displayKey: true,
                          row: 2,
                          valuePath: 'address2',
                          flex: 1,
                          mobileRow: 4,
                       ),
                      'Place ': GtTileField(
                          displayKey: true,
                          row: 3,
                          valuePath: 'place',
                          flex: 1,
                          mobileRow: 5,
                       ),
                      'City': GtTileField(
                          displayKey: true,
                          row: 3,
                          valuePath: 'city',
                          flex: 1,
                          mobileRow: 6,
                       ),
                      'Pin Code': GtTileField(
                          displayKey: true,
                          row: 4,
                          valuePath: 'pincode',
                          flex: 1,
                          mobileRow: 7,
                       ),
                      'Email Id': GtTileField(
                          displayKey: true,
                          row: 4,
                          valuePath: 'emailid',
                          flex: 1,
                          mobileRow: 8,
                       ),
                      'Bank Branch Code': GtTileField(
                          displayKey: true,
                          row: 5,
                          valuePath: 'bankbranchcode',
                          flex: 1,
                          mobileRow: 9,
                       ),
                      'Bank Name': GtTileField(
                          displayKey: true,
                          row: 5,
                          valuePath: 'bankname',
                          flex: 1,
                          mobileRow: 10,
                       ),
                      'Personal Mobile No': GtTileField(
                          displayKey: false,
                          row: 6,
                          valuePath: 'mobileno',
                          flex: 1,
                          mobileRow: 10,
                       ),
                  },
                  listItems: {
                       'email': 'manish98@gmail.com',
                       'bloodgroup': 'O+',
                       'address1': 'Khamothe',
                       'address2': 'Belpada',
                       'place': '121212434',
                       'city': 'KHARGHAR',
                       'pincode': '410210',
                       'emailid': 'manish98@gmail.com',
                       'bankbranchcode': '000291',
                       'bankname': 'HDFC Bank',
                       'mobileno': '9082948703'
                  },
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