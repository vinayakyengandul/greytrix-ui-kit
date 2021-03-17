import 'package:flutter/material.dart';
import 'package:greytrix_ui_kit/src/models/enums.dart';

class GtText extends StatelessWidget {
  GtText({
    @required this.text,
    this.texttype = TextformatType.bodytext,
    this.textOverflow,
    this.textStyle,
    this.fontFamily,
  });

  final String text;
  final TextformatType texttype;
  final TextOverflow textOverflow;
  final TextStyle textStyle;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle == null ? TextStyle(fontFamily: fontFamily) : textStyle,
      overflow: textOverflow,
    );
  }
}
