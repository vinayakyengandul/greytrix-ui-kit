import 'package:flutter/material.dart';
import 'enums.dart';

class GtTabField {
  GtTabField({
    this.row,
    this.mobileRow,
    this.value,
    this.iconData,
    this.flex = 1,
    this.mobileFlex = 1,
    this.textOverFlow,
    this.displayKey = false,
    this.type = GtFieldType.STRING,
    this.webTextFormatType = TextformatType.caption,
    this.mobileTextFormatType = TextformatType.caption,
    this.keyTextFormatType = TextformatType.caption,
    this.isCardTitle = false,
    this.isCardSubTitle = false,
    this.isBannerField = false,
    this.cardRow,
    this.filterType,
    this.filterItems,
    this.valuePath,
    this.filterValue,
    this.filterLabel,
    this.rangeStart,
    this.rangeEnd,
    this.bannerItems,
    this.pathNavigation,
    this.filterNodeValue,
    this.lookUpDisplayNode,
    this.lookUpFilterNode,
    this.fieldTextColor,
    this.fieldTextBackgroundColor,
    this.navigationNode,
    this.textStyle,
  });
  final dynamic value;
  final GtFieldType type;
  final IconData iconData;
  final TextformatType webTextFormatType;
  final TextformatType mobileTextFormatType;
  final TextformatType keyTextFormatType;
  final TextStyle textStyle;
  final TextOverflow textOverFlow;
  final int flex;
  final int mobileFlex;
  final bool displayKey;
  final int row;
  final int mobileRow;
  final int cardRow;
  final bool isCardTitle;
  final bool isCardSubTitle;
  final bool isBannerField;
  final GtFilterType filterType;
  final Map<String, dynamic> filterItems;
  final Map<String, dynamic> bannerItems;
  final String valuePath;
  final String filterValue;
  final String filterLabel;
  final String rangeStart;
  final String rangeEnd;
  final String pathNavigation;
  final String navigationNode;
  final String filterNodeValue;
  final String lookUpDisplayNode;
  final String lookUpFilterNode;
  final Color fieldTextColor;
  final Color fieldTextBackgroundColor;
}
