import 'package:flutter/material.dart';
import './enums.dart';

class GtFormField {
  GtFormField({
    this.row,
    this.mobileRow,
    this.value,
    this.iconData,
    this.flex = 1,
    this.mobileFlex = 1,
    this.type = GtFormFieldType.INPUT,
    this.valuePath,
    this.isRequired = false,
    this.isreadOnly = false,
    this.isMultiselect = false,
    this.textEditingController,
    this.fieldKey,
    this.dropdownItems,
    this.lookupIcon,
    this.lookupFields,
    this.looupKeyVisibile = false,
    this.nodeKey,
    this.dateTextEditingController,
    this.timeTextEditingController,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.dateTimeType = GtDateTimeType.DATE,
    this.lookupAddNodeKey,
    this.focusNode,
    this.lookupAddFormFields,
    this.displayMapFields,
    this.switchDefaultVal = false,
    this.displayInFieldLabel = false,
    this.panelName = "",
    this.prefixDateIcon,
    this.prefixTimeIcon,
    this.suffixDateIcon,
    this.suffixTimeIcon,
    this.dateFieldText = "",
    this.timeFieldText = "",
    this.textInputType = TextInputType.text,
    this.dropDownBackgroundColor = Colors.grey,
    this.dateFormat = "yyyy-MM-dd",
    this.inputDecoration,
    this.boxDecoration
  });

  final Map<String, String> lookupFields;
  final bool looupKeyVisibile;
  final bool isMultiselect;
  final dynamic value;
  final GtFormFieldType type;
  final Map<String, dynamic> dropdownItems;
  final IconData iconData;
  final Icon lookupIcon;
  final int flex;
  final int mobileFlex;
  final int row;
  final int mobileRow;
  final String valuePath;
  final bool isRequired;
  final bool isreadOnly;
  final TextEditingController textEditingController;
  final String fieldKey;
  final String nodeKey;
  final DateTime initialDate;
  final TextEditingController dateTextEditingController;
  final TextEditingController timeTextEditingController;
  final DateTime firstDate;
  final DateTime lastDate;
  final GtDateTimeType dateTimeType;
  final String lookupAddNodeKey;
  final FocusNode focusNode;
  final Map<String, GtFormField> lookupAddFormFields;
  final Map<String, dynamic> displayMapFields;
  final bool switchDefaultVal;
  final bool displayInFieldLabel;
  final String panelName;
  final Icon prefixDateIcon;
  final Icon prefixTimeIcon;
  final Icon suffixDateIcon;
  final Icon suffixTimeIcon;
  final String dateFieldText;
  final String timeFieldText;
  final TextInputType textInputType;
  final Color dropDownBackgroundColor;
  final String dateFormat;
  final InputDecoration inputDecoration;
  final BoxDecoration boxDecoration;
}
