import 'package:flutter/material.dart';
import '../../greytrix_ui_kit.dart';
import '../models/common.dart';

import 'gt_list_card.dart';

class GtGridView extends StatelessWidget {
  GtGridView(
      {this.cardAspectRatio = 1.5,
      this.cardCrossAxisSpacing = 8,
      this.cardMainAxisSpacing = 12,
      this.listItems,
      this.rowsCount = 2,
      this.toMapjson,
      this.onSelectionHandler,
      this.onDetailsNavigateHandler,
      this.onHoverHandler,
      this.pathNavigation,
      this.getLeadingWidget})
      : assert(listItems != null);

  final Function(bool isSelected, dynamic item) onSelectionHandler;
  final List<dynamic> listItems;
  final double cardAspectRatio;
  final double cardCrossAxisSpacing;
  final double cardMainAxisSpacing;
  final Map<String, dynamic> toMapjson;
  final int rowsCount;
  final Function(dynamic item, String path, {GtTileField getTileField})
      onDetailsNavigateHandler;
  final Function(int index, bool isImage, String valuePath) getLeadingWidget;
  final Function(bool isSelected, dynamic item) onHoverHandler;
  final String pathNavigation;

  @override
  Widget build(BuildContext context) {
    int _crossAxisCount = SizeConfig.isMobilePortrait ? 1 : 4;
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(10.0),

      ///GRID_VIEW_BUILDER_IMPLEMENTATION
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _crossAxisCount,
          crossAxisSpacing: cardCrossAxisSpacing,
          mainAxisSpacing: cardMainAxisSpacing,
          childAspectRatio: cardAspectRatio,
        ),
        itemCount: listItems.length,
        itemBuilder: (context, index) {
          return buildSingleCard(
            listItems[index],
            fromGridViewBuilder: true,
          );
        },
      ),
    );
  }

  ///BUILDS THE GRID VIEW IF REQUESTED
  Widget buildSingleCard(
    dynamic item, {
    bool fromGridViewBuilder = false,
    double cardHeight,
    double cardWidth,
  }) {
    int index = listItems.indexOf(item);
    Widget _cardTitleWidget, _cardSubTitleWidget;
    List<Widget> _subTitleChildren = List<Widget>.empty(growable: true);
    List<Widget> _bodyWidgets = List<Widget>.empty(growable: true);

    ///HOLDS THE MOBILE_PORTRAIT VIEW IDENTIFICATION
    bool isMobilePortrait = SizeConfig.isMobilePortrait;
    String _bannerText;

    ///HOLDS THE ROWS DATA WIDGETS LIST AS PROVIDED IN THE GT_FIELD
    dynamic rowsData = {};
    for (var i = 0; i < rowsCount; i++) {
      rowsData[i + 1] = List<Widget>.empty(growable: true);
    }

    bool isImage = false;
    String valuePath = "";
    toMapjson.forEach((key, value) {
      if (value.type == GtFieldType.IMAGE) {
        isImage = true;
        valuePath = value.valuePath;
      }
    });

    /// PREPARES THE LEADING ICON WITH EITHER SELECTION OR WITHOUT SELECTION
    Widget leadingWidget = getLeadingWidget(index, isImage, valuePath);

    // ///HERE PREPARING THE SINGLE GT_FIELD_WIDGET FOR THE SINGLE ITEM FIELD WHICH NEEDS TO BE DISPLAYED

    toMapjson.forEach((key, value) {
      int row = value.cardRow;
      String _type = 'default';

      if (value.valuePath != null) {
        dynamic nodeValue = Common.getValue(listItems[index], value.valuePath);

        ///SETTING CARD TITLE AND SUB_TITLE_WIDGET
        if (value.isCardTitle == true)
          _type = 'TITLE';
        else if (value.isCardSubTitle == true) _type = 'SUB_TITLE';

        switch (_type) {
          case "TITLE":
            if (nodeValue != null)
              _cardTitleWidget = Common.getListWidget(
                value,
                key,
                nodeValue,
                () => {
                  if (onDetailsNavigateHandler != null)
                    {
                      onDetailsNavigateHandler(listItems[index], pathNavigation,
                          getTileField: value)
                    }
                },
                gtValueType: value.valueType,
              );
            break;
          case "SUB_TITLE":
            if (nodeValue != null)
              _subTitleChildren.add(Row(
                children: [
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
                  ),
                ],
              ));
            break;
          default:
            if (rowsData[row] == null && value.isBannerField == false) {
              rowsData[row] = List<Widget>.empty(growable: true);
            } else if (value.valueType != GtValueType.LIST &&
                value.isBannerField == true &&
                nodeValue != null &&
                value.bannerItems != null) {
              _bannerText = value.bannerItems.keys.firstWhere(
                  (k) => value.bannerItems[k] == nodeValue,
                  orElse: () => '');

              //_bannerText = '$nodeValue';
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
                ),
              );
            }
            break;
        }
      }
    });

    ///PREPARING THE CARD_SUB_TITLE WIDGET
    if (_subTitleChildren.length > 0) {
      _cardSubTitleWidget = Expanded(
        child: Column(
          children: [..._subTitleChildren],
        ),
      );
    }

    ///HERE PREPARING THE EACH ROWS DATA WITH RESPECTIVE CHILDREN WIDGETS DATA
    ///ALSO IF MOBILE VIEW IS PRESENT THEN ADDING THE LEADING ICON IN THE FIRST ROW
    rowsData.forEach(
      (k, v) => {
        _bodyWidgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: v,
            ),
          ),
        ),
      },
    );

    return GtListCard(
      fromGridViewBuilder: fromGridViewBuilder,
      leadingWidget: leadingWidget,
      titleWidget: _cardTitleWidget,
      subTitleWidget: _cardSubTitleWidget,
      bodyWidgets: _bodyWidgets,
      isSelected:
          onSelectionHandler != null ? listItems[index]['IsSelected'] : false,
      onTap: () {
        if (onDetailsNavigateHandler != null) {
          onDetailsNavigateHandler(listItems[index], pathNavigation);
        }
      },
      cardHeight: cardHeight,
      cardWidth: cardWidth,
      bannerText: _bannerText,
      onHover: listItems[index]['IsHovered'] != null
          ? listItems[index]['IsHovered']
          : false,
      onHoverHandler: (isHovered) {
        if (onHoverHandler != null) onHoverHandler(isHovered, listItems[index]);
      },
      IsImage: isImage,
    );
  }
}
