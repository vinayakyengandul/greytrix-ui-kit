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
}
