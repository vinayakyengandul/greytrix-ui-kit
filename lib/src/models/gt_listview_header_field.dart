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
    this.buttonHovorColor = Colors.blueAccent,
    this.iconColor = Colors.blue,
    this.buttonText = "",
    this.textAlign = TextAlign.center,
    this.textStyle,
    this.buttonOnPressed,
    this.mobileFlex,
  });
  final IconData iconData;
  final String textValue;
  final GtListViewHeaderFieldType type;
  final int flex;
  final Color textColor;
  final Color buttonColor;
  // Button Hover color
  final Color buttonHovorColor;
  final Color iconColor;
  final String buttonText;
  // HEADER TEXT ALIGN
  final TextAlign textAlign;
  final TextStyle textStyle;
  // BUTTON ON Preesed Function
  final Function buttonOnPressed;
  final int mobileFlex;
}