import 'package:flutter/material.dart';
import 'enums.dart';

class GtCartField {
  GtCartField({
    this.value,
    this.iconData,
    this.textOverFlow,
    this.displayKey = false,
    this.type = GtCartFieldType.TITLE,
    this.valuePath,
    this.textStyle,
    this.valueType = GtValueType.STRING,
    this.fontFamily,
  });
  final dynamic value;
  final GtCartFieldType type;
  final IconData iconData;
  final TextStyle textStyle;
  final TextOverflow textOverFlow;
  final bool displayKey;
  final String valuePath;
  final GtValueType valueType;
  final String fontFamily;
}
