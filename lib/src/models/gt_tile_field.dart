import 'package:flutter/material.dart';
import 'enums.dart';

class GtTileField {
  GtTileField({
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

    /// ADDED FOR LOOKUP FORM FIELD
    this.lookupAddNodeKey,
    this.lookupAddVariableKey,
    this.focusNode,
    this.textEditingController,
    this.lookupFields,
    this.looupKeyVisibile,
    this.nodeKey,
    this.fieldKey,
    this.isRequired = false,
    this.isMultiselect = false,
    this.valueType = GtValueType.STRING,
    this.listFieldValuePath,
    this.isActiveInactiveField = false,
    this.activeInactiveItems,
    this.statusField,
    this.fontFamily,
    this.tileDateFormat,
    this.defaultStatusColor = Colors.blue,
    this.chipFieldShape,
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
  // FOR LOOKUP WIDGETS
  final bool isMultiselect;
  final String lookupAddNodeKey;
  final String lookupAddVariableKey;
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final Map<String, String> lookupFields;
  final bool looupKeyVisibile;
  final bool isRequired;
  final String fieldKey;
  final String nodeKey;
  final GtValueType valueType;
  final String listFieldValuePath;
  final bool isActiveInactiveField;
  final Map<String, dynamic> activeInactiveItems;
  final Map<String, dynamic> statusField;
  final String fontFamily;
  final GtTileDateFormat tileDateFormat;
  final Color defaultStatusColor;
  final RoundedRectangleBorder chipFieldShape;
}
