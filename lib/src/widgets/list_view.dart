import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../greytrix_ui_kit.dart';
import '../models/common.dart';
import 'gt_list_tile.dart';

class GtListView extends StatelessWidget {
  GtListView({
    Key key,
    this.listItems,
    this.selectAllcheckbox,
    this.gtTileRowCrossAxisAlignment,
    this.gtTileRowMainAxisAlignment,
    this.onDetailsNavigateHandler,
    this.toMapjson,
    this.rowsCount = 1,
    this.onHoverHandler,
    this.pathNavigation,
    this.getLeadingWidget,
    this.isSpaceInRecords = false,
    this.trailingIcon,
    this.getTrailingWidget,
    this.quantityInitialValue,
    this.incrementHandler,
    this.decrementHandler,
    this.isleadingIconPosition = true,
  })  : assert(listItems != null),
        assert(rowsCount != null),
        super(key: key);

  final int rowsCount;
  final Map<String, dynamic> toMapjson;
  final List<dynamic> listItems;
  final Function selectAllcheckbox;
  final CrossAxisAlignment gtTileRowCrossAxisAlignment;
  final MainAxisAlignment gtTileRowMainAxisAlignment;
  final Function(dynamic item, String path, {GtTileField getTileField})
      onDetailsNavigateHandler;
  final Function(int index, bool isImage, String valuePath) getLeadingWidget;
  final Function(bool isSelected, dynamic item) onHoverHandler;
  final String pathNavigation;
  final bool isSpaceInRecords;
  final Function(int index) getTrailingWidget;
// FOR CART FUNCTIONALITY
  final int quantityInitialValue;
  final Function(int index) incrementHandler;
  final Function(int index) decrementHandler;
  final Widget trailingIcon;
  final bool isleadingIconPosition;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: listItems.length,
      itemBuilder: (context, index) {
        ///HOLDS THE MOBILE_PORTRAIT VIEW IDENTIFICATION
        bool isMobilePortrait = SizeConfig.isMobilePortrait;
        String bannerText;
        String chipcheck = "";

        ///HOLDS THE ROWS DATA WIDGETS LIST AS PROVIDED IN THE GT_FIELD
        dynamic rowsData = {};
        for (var i = 0; i < rowsCount; i++) {
          rowsData[i + 1] = List<Widget>.empty(growable: true);
        }
        bool isImage = false;
        String valuePath = "";
        bool statusType = false;
        toMapjson.forEach((key, value) {
          if (value.type == GtFieldType.IMAGE) {
            isImage = true;
            valuePath = value.valuePath;
          }
        });

        /// PREPARES THE LEADING ICON WITH EITHER SELECTION OR WITHOUT SELECTION
        Widget leadingWidget = getLeadingWidget(index, isImage, valuePath);
        /// PREPARES THE TRAILING ICON WITH EITHER SELECTION OR WITHOUT SELECTION
        Widget trailingWidget = getTrailingWidget(index);

        //HERE PREPARING THE SINGLE GT_FIELD_WIDGET FOR THE SINGLE ITEM FIELD WHICH NEEDS TO BE DISPLAYED

        toMapjson.forEach((key, value) {
          if (value.valuePath != null) {
            int row = isMobilePortrait ? value.mobileRow : value.row;
            if (value.type == GtFieldType.CHIP)
              chipcheck = (row + 1).toString();
            dynamic nodeValue =
                Common.getValue(listItems[index], value.valuePath);
            if (rowsData[row] == null && value.isActiveInactiveField == false) {
              rowsData[row] = List<Widget>.empty(growable: true);
            } else if (value.valueType != GtValueType.LIST &&
                value.isActiveInactiveField == true &&
                nodeValue != null) {
              statusType = true;
              bannerText = value.activeInactiveItems.keys.firstWhere(
                  (k) => value.activeInactiveItems[k] == nodeValue,
                  orElse: () => '');

              // bannerText = '$nodeValue';
            }

            ///IF ROW INFORMATION IS NOT PROVIDED THEN THAT FIELD WILL NOT BE DISPLAYED IN THE LIST_TILE
            if (row != null && nodeValue != null) {
              rowsData[row].add(
                Common.getListWidget(
                    value,
                    key,
                    nodeValue,
                    () => {
                          if (onDetailsNavigateHandler != null)
                            {
                              onDetailsNavigateHandler(
                                  listItems[index], pathNavigation,
                                  getTileField: value)
                            }
                        },
                    gtValueType: value.valueType,
                    isMobileScreen: isMobilePortrait,
                    quantityInitialValue: quantityInitialValue,
                    incrementHandler: () => incrementHandler(index),
                    decrementHandler: () => decrementHandler(index)),
              );
            }
          }
        });

        int currentCount = 0;
        int rowMaxCount = 0;
        if (size.width < 450) {
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
        EdgeInsets _rowPadding = EdgeInsets.only(top: 10.0, bottom: 0.0);

        ///HERE PREPARING THE EACH ROWS DATA WITH RESPECTIVE CHILDREN WIDGETS DATA
        ///ALSO IF MOBILE VIEW IS PRESENT THEN ADDING THE LEADING ICON IN THE FIRST ROW
        rowsData.forEach(
          (k, v) => {
            if ((isMobilePortrait == true ||  !isleadingIconPosition  )&&
                rowIndex == 0 &&
                leadingWidget != null)
              {
                rowsWidgets.add(
                  Padding(
                    padding: chipcheck == (rowIndex + 1).toString()
                        ? EdgeInsets.only(top: 0.0, bottom: 0.0)
                        : _rowPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (leadingWidget != null && isImage) ...[
                          Expanded(
                            flex: 2,
                            child: leadingWidget,
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                        if (isImage) ...[
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: v,
                              ),
                            ),
                          ),
                        ] else ...[
                          Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: v,
                            ),
                          ),
                        ],
                        if (leadingWidget != null && !isImage) ...[
                         !isleadingIconPosition ?
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                leadingWidget,
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            )
                          :  Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                leadingWidget,
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          )
                        ]
                      ],
                    ),
                  ),
                ),
              }
            else
              {
                rowsWidgets.add(
                  Padding(
                    padding: chipcheck == (rowIndex + 1).toString()
                        ? EdgeInsets.only(top: 0.0, bottom: 0.0)
                        : _rowPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: v,
                    ),
                  ),
                ),
              },
            rowIndex++,
          },
        );

        return GtListTile(
          columnWidget: Column(children: rowsWidgets),
          leadingWidget: (isMobilePortrait || !isleadingIconPosition) ? null : leadingWidget,
          isSelected: selectAllcheckbox != null
              ? listItems[index]['IsSelected']
              : false,
          gtTileRowCrossAxisAlignment: gtTileRowCrossAxisAlignment,
          gtTileRowMainAxisAlignment: gtTileRowMainAxisAlignment,
          onTap: () {
            if (onDetailsNavigateHandler != null) {
              onDetailsNavigateHandler(listItems[index], pathNavigation);
            }
          },
          bannerText: bannerText,
          onHover: listItems[index]['IsHovered'] != null
              ? listItems[index]['IsHovered']
              : false,
          onHoverHandler: (isHovered) {
            if (onHoverHandler != null)
              onHoverHandler(isHovered, listItems[index]);
          },
          isImage: isImage,
          isSpaceInRecords: isSpaceInRecords,
          statusType: statusType,
          trailingWidget: trailingWidget
        );
      },
    );
  }
}
