import 'package:flutter/material.dart';

class GtCustomCheckbox extends StatelessWidget {
  final bool isChecked;
  final double size;
  final double iconSize;
  final Color selectedColor;
  final Color selectedIconColor;
  final Function onchanged;

  GtCustomCheckbox({this.isChecked, this.size, this.iconSize, this.selectedColor, this.selectedIconColor,this.onchanged});

 @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onchanged(!isChecked);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 50),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          color: isChecked ? selectedColor ?? Theme.of(context).toggleableActiveColor : Colors.transparent,
          borderRadius: BorderRadius.circular(5.0),
          border: isChecked ? null : Border.all(
            color: Colors.grey,
            width: 0.8,
          )
        ),
        width: size ?? 30,
        height: size ?? 30,
        child: isChecked ? Icon(
          Icons.check,
          color: selectedIconColor,
          size: iconSize ?? 12,
        ) : null,
      ),
    );
  }
  
}