import 'package:flutter/material.dart';
import './gt_icon.dart';
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
    this.textAlign = TextAlign.start,
    this.maxLines,
  });

  final String text;
  final TextOverflow textOverflow;
  final TextStyle textStyle;
  final String fontFamily;
  final IconData iconData;
  final double iconSize;
  final Color iconColor;
  final GtPosition position;
  final TextAlign textAlign;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return (iconData != null)
        ? Container(
            padding: EdgeInsets.all(2.0),
            child: Row(
              children: [
                if (position == GtPosition.PREFIX && iconData != null)
                  Padding(
                    child: GtIcon(
                      icondata: iconData,
                      color: iconColor,
                      size: iconSize,
                    ),
                    padding: EdgeInsets.all(2.0),
                  ),
                maxLines != null
                    ? Text(
                        text != null ? text : "",
                        style: textStyle == null
                            ? TextStyle(fontFamily: fontFamily)
                            : textStyle,
                        overflow: textOverflow,
                        textAlign: textAlign,
                        maxLines: maxLines,
                      )
                    : Text(
                        text != null ? text : "",
                        style: textStyle == null
                            ? TextStyle(fontFamily: fontFamily)
                            : textStyle,
                        overflow: textOverflow,
                        textAlign: textAlign,
                      ),
                if (position == GtPosition.POSTFIX && iconData != null)
                  Padding(
                    child: GtIcon(
                      icondata: iconData,
                      color: iconColor,
                      size: iconSize,
                    ),
                    padding: EdgeInsets.all(2.0),
                  )
              ],
            ),
          )
        : maxLines != null
            ? Text(
                text != null ? text : "",
                style: textStyle == null
                    ? TextStyle(fontFamily: fontFamily)
                    : textStyle,
                overflow: textOverflow,
                textAlign: textAlign,
                maxLines: maxLines,
              )
            : Text(
                text != null ? text : "",
                style: textStyle == null
                    ? TextStyle(fontFamily: fontFamily)
                    : textStyle,
                overflow: textOverflow,
                textAlign: textAlign,
              );
  }
}
