import 'package:flutter/material.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
import '../models/enums.dart';

class GtText extends StatelessWidget {
  GtText({
    @required this.text,
    this.textOverflow,
    this.textStyle,
    this.fontFamily,
    this.iconData,
    this.iconSize,
    this.iconColor,
    this.position = GtPosition.PREFIX,
  });

  final String text;
  final TextOverflow textOverflow;
  final TextStyle textStyle;
  final String fontFamily;
  final IconData iconData;
  final double iconSize;
  final Color iconColor;
  final GtPosition position;

  @override
  Widget build(BuildContext context) {
    return (iconData != null)
        ? Container(
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: [
                if (position == GtPosition.PREFIX && iconData != null)
                  Padding(
                    child: GtIcon(
                      icondata: iconData,
                      color: iconColor,
                      size: iconSize,
                    ),
                    padding: EdgeInsets.all(5.0),
                  ),
                Text(
                  text != null ? text : "",
                  style: textStyle == null
                      ? TextStyle(fontFamily: fontFamily)
                      : textStyle,
                  overflow: textOverflow,
                  textAlign: TextAlign.center,
                ),
                if (position == GtPosition.POSTFIX && iconData != null)
                  Padding(
                    child: GtIcon(
                      icondata: iconData,
                      color: iconColor,
                      size: iconSize,
                    ),
                    padding: EdgeInsets.all(5.0),
                  )
              ],
            ),
          )
        : Text(
            text != null ? text : "",
            style: textStyle == null
                ? TextStyle(fontFamily: fontFamily)
                : textStyle,
            overflow: textOverflow,
            textAlign: TextAlign.center,
          );
  }
}
