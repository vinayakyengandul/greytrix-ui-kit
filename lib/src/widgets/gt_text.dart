import 'package:flutter/material.dart';

class GtText extends StatelessWidget {
  GtText({
    @required this.text,
    this.textOverflow,
    this.textStyle,
    this.fontFamily,
  });

  final String text;

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
