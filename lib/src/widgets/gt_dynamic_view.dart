import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../greytrix_ui_kit.dart';
import '../models/common.dart';
import 'gt_list_tile.dart';

class GtDynamicView extends StatelessWidget {
  GtDynamicView(
      {Key key,
      this.listItems,
      this.title,
      this.gtTileRowCrossAxisAlignment,
      this.gtTileRowMainAxisAlignment,
      this.toMapjson,
      this.rowsCount = 1,
      this.headertextStyle,
      this.datatextStyle})
      : assert(listItems != null),
        assert(rowsCount != null),
        super(key: key);

  final int rowsCount;
  final Map<String, dynamic> toMapjson;
  final dynamic listItems;

  final CrossAxisAlignment gtTileRowCrossAxisAlignment;
  final MainAxisAlignment gtTileRowMainAxisAlignment;
  final String title;
  final TextStyle headertextStyle;
  final TextStyle datatextStyle;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget buildView() {
      dynamic rowsData = {};

      ///PREPARING SPECIFIED ROWS WITH THE EMPTY LIST TO ADD THE FORM WIDGETS TO
      ///THEIR SPECIFIED ROWS FOR BOTH WEB AND MOBILE VIEW
      for (var i = 0; i < rowsCount; i++) {
        rowsData[i + 1] = List<Widget>.empty(growable: true);
      }

      ///GETTING THE FORM WIDGET BASED ON THE FROM_MAP_JSON MAP PASSED FOR THE VIEW
      toMapjson.forEach((key, value) {
        bool isMobilePortrait = size.width > 450 ? false : true;
        int row = isMobilePortrait ? value.mobileRow : value.row;

        if (row != null) {
          rowsData[row].add(Expanded(
            flex: value.flex,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Common.getdynamicGtText(
                  value, key, Common.getValue(listItems, value.valuePath),
                  labeltextStyle: headertextStyle ??
                      TextStyle(
                        color: Color(0xff5a5278).withOpacity(1.0),
                        fontFamily: 'Montserrat-Light',
                        fontSize: 13,
                      ),
                  datatextStyle: datatextStyle ??
                      TextStyle(
                          fontFamily: 'Montserrat-Light',
                          fontWeight: FontWeight.w600)),
            ),
          ));
        }
      });

      // TO ADJUST ALIGNMENT IF LESSER FIELD
      int currentCount = 0;
      int rowMaxCount = 0;
      if (true) {
        rowsData.forEach((k, v) => {
              if (v.length > rowMaxCount)
                {
                  rowMaxCount = v.length,
                }
            });
        rowsData.forEach((k, v) => {
              if (v.length < rowMaxCount && k != null)
                {
                  currentCount = rowMaxCount - v.length,
                  rowsData[k].addAll(
                    List<Widget>.generate(
                        currentCount,
                        (i) => Expanded(
                              child: Container(),
                            )),
                  ),
                }
            });
      }

      List<Widget> rowsWidgets = List<Widget>.empty(growable: true);
      int rowIndex = 0;
      EdgeInsets _rowPadding = EdgeInsets.all(5.0);

      ///HERE PREPARING THE EACH ROWS DATA WITH RESPECTIVE CHILDREN WIDGETS DATA
      ///ALSO IF MOBILE VIEW IS PRESENT THEN ADDING THE LEADING ICON IN THE FIRST ROW
      rowsData.forEach(
        (k, v) => {
          rowsWidgets.add(
            Padding(
              padding: _rowPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: v,
              ),
            ),
          ),
          rowIndex++,
        },
      );

      return Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: GtText(
                text: title,
                textStyle: TextStyle(
                    color: Color(0xff5a5278).withOpacity(0.9),
                    fontFamily: 'Montserrat-Light',
                    fontSize: 16),
              ),
            ),
            ...rowsWidgets
          ],
        ),
      );
    }

    return Container(
        color: Color(0xfff1f1f1),
        //width: double.infinity,
        // height: double.infinity,
        padding: EdgeInsets.all(15.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [buildView()]));
  }
}
