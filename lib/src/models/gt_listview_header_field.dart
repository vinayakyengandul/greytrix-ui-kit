import 'package:flutter/material.dart';
import 'enums.dart';

class GtListViewHeaderField {
  GtListViewHeaderField({
    this.iconData,
    this.textValue = "",
    this.type = GtListViewHeaderFieldType.STRING,
    this.flex = 1,
    this.textColor = Colors.grey,
    this.buttonColor = Colors.blue,
    this.iconColor = Colors.blue,
  });
  final IconData iconData;
  final String textValue;
  final GtListViewHeaderFieldType type;
  final int flex;
  final Color textColor;
  final Color buttonColor;
  final Color iconColor;
}