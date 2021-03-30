import 'package:flutter/material.dart';

import './gt_text.dart';

class GTChip extends StatelessWidget {
  GTChip({
    this.label,
    this.backgroundColor,
    this.textStyle,
    //this.textFormatType = TextformatType.subtitle2,
    this.avatar,
    this.shapeBorder,
  });

  final String label;
  final Color backgroundColor;
  //final TextformatType textFormatType;
  final TextStyle textStyle;
  final Widget avatar;

  ///SHAPE BORDER EXAMPLE
  // shape: RoundedRectangleBorder(
  //   borderRadius: BorderRadius.only(
  //       topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
  // ),
  final ShapeBorder shapeBorder;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()..scale(0.8),
      child: Chip(
          avatar: avatar,
          shape: shapeBorder,
          label: GtText(
              text: label,
              //texttype: textFormatType,
              textStyle: textStyle),
          backgroundColor:
              backgroundColor != null ? backgroundColor : Colors.white),
    );
  }
}
