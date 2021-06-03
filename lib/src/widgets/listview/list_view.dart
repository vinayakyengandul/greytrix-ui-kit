import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../greytrix_ui_kit.dart';
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
    this.listViewTableType = GTListViewTableType.Normal,
    this.selectedRowColor = Colors.grey,
    this.rowColors = Colors.white,
    this.isLeadingShow = true,
    this.swipeToOption,
    this.swipeIcon = Icons.delete,
    this.swipeBackgroundColor = Colors.red,
    this.swipeIconColor = Colors.white,
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

  //PARAMTERS FOR LISTVIEW TYPE
  final GTListViewTableType listViewTableType;
  final Color selectedRowColor;
  final Color rowColors;
  final bool isLeadingShow;
  // SWIPE TO OPTIONS
  final Function(dynamic,int) swipeToOption;
  final IconData swipeIcon;
  final Color swipeBackgroundColor;
  final Color swipeIconColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      padding: EdgeInsets.all(
          listViewTableType == GTListViewTableType.Normal ? 0.0 : 20),
      itemCount: listItems.length,
      itemBuilder: (context, index) {
        final item = listItems[index];
        Color color = listViewTableType == GTListViewTableType.Normal
            ? Colors.white
            : index.isOdd
                ? rowColors
                : rowColors.withOpacity(0.5);

        ///HOLDS THE MOBILE_PORTRAIT VIEW IDENTIFICATION
        bool isMobilePortrait = size.width < 450 ? true : false;
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
        Widget trailingWidget =
            trailingIcon != null ? getTrailingWidget(index) : null;

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
            //if (row != null && nodeValue != null) {
            if (row != null) {
              if (nodeValue == null) {
                rowsData[row].add(Expanded(
                  flex: isMobilePortrait ? value.mobileFlex : value.flex,
                  child: Container(),
                ));
              } else {
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
          }
        });

        int currentCount = 0;
        int rowMaxCount = 0;
        if (!isMobilePortrait) {
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
        EdgeInsets _rowPadding = EdgeInsets.only(top: 0.0, bottom: 0.0);

        ///HERE PREPARING THE EACH ROWS DATA WITH RESPECTIVE CHILDREN WIDGETS DATA
        ///ALSO IF MOBILE VIEW IS PRESENT THEN ADDING THE LEADING ICON IN THE FIRST ROW
        rowsData.forEach(
          (k, v) => {
            if ((isMobilePortrait == true) &&
                rowIndex == 0 &&
                leadingWidget != null && isLeadingShow)
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
                        if (leadingWidget != null &&
                            (isImage ||
                                listViewTableType ==
                                    GTListViewTableType.STRIPED)) ...[
                          listViewTableType == GTListViewTableType.STRIPED
                              ? Container(
                                  child: leadingWidget,
                                )
                              : Expanded(
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
                        if (leadingWidget != null &&
                            !isImage &&
                            listViewTableType !=
                                GTListViewTableType.STRIPED) ...[
                          Expanded(
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

         Widget listTile = GtListTile(
          columnWidget: Column(children: rowsWidgets),
          leadingWidget: (isMobilePortrait || !isLeadingShow) ? null : leadingWidget,
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
          trailingWidget: trailingWidget,
          isleadingIconPosition: isleadingIconPosition,
          rowColor: color,
          listViewTableType: listViewTableType,
          selectedRowColor: selectedRowColor,
        );
         return swipeToOption != null ? Dismissible(
              key: Key(item.toString()),

              confirmDismiss: (DismissDirection direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: GtText(text:"Confirm"),
                      content: GtText(text:"Are you sure you wish to delete this item?"),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: GtText(text:"DELETE")
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: GtText(text:"CANCEL"),
                        ),
                      ],
                    );
                  },
                );
              },
              onDismissed: (direction) {
                if(swipeToOption != null){
                swipeToOption(listItems,index);
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('1 dismissed')));
                }
              },
              secondaryBackground: swipeIconWidget("END"),
              background: swipeIconWidget("START"),
              child: listTile,
            ) : listTile ;
      },
    );
  }
  Widget swipeIconWidget(String strData){
    return Container(
          color: swipeBackgroundColor,
          child: Align(
            child: Row(
              mainAxisAlignment: strData == "END" ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: strData == "END" ? 0 : 20,
                ),
                Icon(
                  swipeIcon,
                  color: swipeIconColor,
                ),
                SizedBox(
                  width: strData == "END" ? 20 : 0,
                ),
              ],
            ),
            alignment:  strData == "END"  ? Alignment.centerRight : Alignment.centerLeft,
          ),
    );
  }
}