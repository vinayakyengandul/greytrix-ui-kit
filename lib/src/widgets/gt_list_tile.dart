import 'package:flutter/material.dart';
import '../models/index.dart';

class GtListTile extends StatelessWidget {
  final Column columnWidget;
  final Widget leadingWidget;
  final Widget trailingWidget;
  final bool isSelected;
  final EdgeInsets cardMarginEdgeInsets;
  final CrossAxisAlignment gtTileRowCrossAxisAlignment;
  final MainAxisAlignment gtTileRowMainAxisAlignment;
  final double cardElevation;
  final Function onTap;
  final String bannerText;
  final bool onHover;
  final Function(bool value) onHoverHandler;
  final bool isImage;
  final bool isSpaceInRecords;
  final bool statusType;
  final Function(String key, dynamic object) onDeleteHandler;
  final bool isleadingIconPosition;
  final Color rowColor;
  final GTListViewTableType listViewTableType;
  final Color selectedRowColor;
  GtListTile({
    @required this.onTap,
    @required this.columnWidget,
    this.leadingWidget,
    this.trailingWidget,
    this.cardElevation = 3.0,
    this.isSelected = false,
    this.bannerText,
    this.cardMarginEdgeInsets = const EdgeInsets.all(8.0),
    this.gtTileRowCrossAxisAlignment = CrossAxisAlignment.start,
    this.gtTileRowMainAxisAlignment = MainAxisAlignment.start,
    this.onHover = false,
    this.onHoverHandler,
    this.isImage = false,
    this.isSpaceInRecords = false,
    this.statusType = false,
    this.onDeleteHandler,
    this.isleadingIconPosition = true,
    this.rowColor = Colors.white,
    this.listViewTableType = GTListViewTableType.Normal,
    this.selectedRowColor = Colors.grey,
  }) : assert(columnWidget != null);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        if (onHoverHandler != null) onHoverHandler(value);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              listViewTableType == GTListViewTableType.Normal ? 10.0 : 0.0),
          side: BorderSide(
              color: onHover
                  ? listViewTableType == GTListViewTableType.Normal
                      ? Colors.blueAccent
                      : rowColor
                  : isSelected
                      ? listViewTableType == GTListViewTableType.Normal
                          ? selectedRowColor
                          : rowColor
                      : rowColor),
        ),
        //elevation: onHover ? 15.0 : 3.0,
        margin: isSpaceInRecords
            ? EdgeInsets.only(
                right:
                    listViewTableType == GTListViewTableType.Normal ? 8.0 : 0.0,
                left:
                    listViewTableType == GTListViewTableType.Normal ? 8.0 : 0.0,
                top:
                    listViewTableType == GTListViewTableType.Normal ? 1.0 : 0.0,
                bottom: 0.0)
            : cardMarginEdgeInsets,
        color: onHover
            ? listViewTableType == GTListViewTableType.Normal
                ? Colors.blueGrey[100]
                : rowColor
            : rowColor,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
              listViewTableType == GTListViewTableType.Normal ? 10 : 0.0),
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? listViewTableType == GTListViewTableType.Normal
                      ? selectedRowColor
                      : null
                  : null,
              border: statusType
                  ? Border(
                      right: BorderSide(
                      width: 5,
                      color: bannerText == "Active"
                          ? Colors.green[300]
                          : Colors.red[300],
                    ))
                  : null,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
              child: bannerText != null
                  ? Container(
                      child: Row(
                        crossAxisAlignment: gtTileRowCrossAxisAlignment,
                        mainAxisAlignment: gtTileRowMainAxisAlignment,
                        children: [
                          ///LEADING WIDGET
                          if (leadingWidget != null) ...[
                            isImage
                                ? SizedBox(width: 140, child: leadingWidget)
                                : SizedBox(width: 60, child: leadingWidget)
                          ],

                          ///COLUMN WIDGET WHICH CONTAINS ALL ROWS DATA
                          Expanded(flex: isImage ? 6 : 4, child: columnWidget),

                          /////TRAILING WIDGET
                          if (trailingWidget != null) ...[
                            SizedBox(width: 60, child: trailingWidget)
                          ],
                        ],
                      ),
                    )
                  : Row(
                      crossAxisAlignment: gtTileRowCrossAxisAlignment,
                      mainAxisAlignment: gtTileRowMainAxisAlignment,
                      children: [
                        ///LEADING WIDGET
                        if (leadingWidget != null) ...[
                          isImage
                              ? Expanded(
                                  flex: 1,
                                  child: leadingWidget,
                                )
                              : SizedBox(width: 60, child: leadingWidget)
                        ],

                        ///COLUMN WIDGET WHICH CONTAINS ALL ROWS DATA
                        Expanded(flex: isImage ? 6 : 4, child: columnWidget),

                        /////TRAILING WIDGET
                        if (trailingWidget != null) ...[
                          //SizedBox(width: 60, child: trailingWidget)
                          Expanded(
                            flex: 1,
                            child: trailingWidget,
                          )
                        ],
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
