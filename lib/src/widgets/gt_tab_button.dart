import 'package:flutter/material.dart';

import 'gt_text.dart';

class GtTabButton extends StatelessWidget {
  GtTabButton(
      {@required this.text,
      @required this.selectedPage,
      @required this.pageNumber,
      this.onPressed,
      this.selectedColor,
      this.unselectedColor,
      this.selectedTextStyle,
      this.unselectedTextStyle,
      this.isTophighlighted = false});

  final String text;
  final int selectedPage;
  final int pageNumber;
  final Function onPressed;
  final Color selectedColor;
  final Color unselectedColor;
  final TextStyle unselectedTextStyle;
  final TextStyle selectedTextStyle;
  final bool isTophighlighted;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ?? () => {},
      child: Container(
        decoration: BoxDecoration(
          border: isTophighlighted
              ? Border(
                  top: BorderSide(
                      color: selectedPage == pageNumber
                          ? selectedColor ?? Theme.of(context).primaryColor
                      : unselectedColor ?? Theme.of(context).backgroundColor,
                      width: 5.0))
              : Border(
                  bottom: BorderSide(
                      color: selectedPage == pageNumber
                         ? selectedColor ?? Theme.of(context).primaryColor
                      : unselectedColor ?? Theme.of(context).backgroundColor,
                      width: 5.0)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
        child: GtText(
          text: text,
          textStyle: selectedPage == pageNumber
              ? selectedTextStyle
              : unselectedTextStyle,
        ),
      ),
    );
  }
}
