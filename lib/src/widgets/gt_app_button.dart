import 'package:flutter/material.dart';

import '../models/enums.dart';

class AppButton extends StatelessWidget {
  final ButtonType type;
  final VoidCallback onPressed;
  final String text;
  final Color primaryColor;
  final TextStyle textStyle;

  AppButton(
      {@required this.type,
      this.onPressed,
      @required this.text,
      @required this.primaryColor,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPressed,
      child: Container(
        width: double.infinity,
        height: 48.0, //ScreenUtil().setHeight(48.0),
        decoration: BoxDecoration(
          color: getButtonColor(type, primaryColor),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(169, 176, 185, 0.42),
              spreadRadius: 0,
              blurRadius: 8.0,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Center(
          child: Text(this.text,
              style: textStyle == null ? TextStyle() : textStyle),
        ),
      ),
    );
  }
}

Color getButtonColor(ButtonType type, Color primaryColor) {
  switch (type) {
    case ButtonType.PRIMARY:
      return primaryColor;
    case ButtonType.PLAIN:
      return Colors.white;
    default:
      return primaryColor;
  }
}

Color getTextColor(ButtonType type, Color primaryColor) {
  switch (type) {
    case ButtonType.PLAIN:
      return primaryColor;
    case ButtonType.PRIMARY:
      return Colors.white;
    default:
      return Colors.white;
  }
}
