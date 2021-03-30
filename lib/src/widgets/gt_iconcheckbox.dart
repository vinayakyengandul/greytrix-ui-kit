import 'package:flutter/material.dart';

import '../../greytrix_ui_kit.dart';

class GtIconCheckbox extends StatelessWidget {
  GtIconCheckbox({
    @required this.icon,
    this.selected = false,
    @required this.onchanged,
    @required this.backgroundColor,
    this.checkboxcheckColor,
    this.checkboxactiveColor,
    this.checkboxfocusColor,
    this.iconcolor,
    this.iconfocuscolor,
  });

  final IconData icon;
  final bool selected;
  final Function onchanged;

  // NEW PARAMETERS FOR WIDGET UI
  final Color checkboxcheckColor;
  final Color checkboxactiveColor;
  final Color checkboxfocusColor;
  final Color backgroundColor;
  final Color iconfocuscolor;
  final Color iconcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: selected
          ? CircleAvatar(
              radius: 16,
              backgroundColor: backgroundColor,
              child: Checkbox(
                value: selected,
                onChanged: (value) => {onchanged(value)},
                checkColor: checkboxcheckColor,
                activeColor: checkboxactiveColor,
                focusColor: checkboxfocusColor,
              ))
          : InkWell(
              focusColor: iconfocuscolor,
              child: CircleAvatar(
                  radius: 16,
                  backgroundColor: backgroundColor,
                  child: GtIcon(
                    icondata: icon,
                    color: iconcolor,
                  )),
              onTap: () => {onchanged(true)},
            ),
    );
  }
}
