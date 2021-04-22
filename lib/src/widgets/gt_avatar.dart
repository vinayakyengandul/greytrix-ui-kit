import 'package:flutter/material.dart';

class GtAvatar extends StatelessWidget {
  GtAvatar({
    this.radius = 15,
    this.backgroundColor = Colors.blue,
    this.childWidget,
    this.backGroundImage,
  });

  final double radius;
  final Color backgroundColor;
  final Widget childWidget;
  final ImageProvider backGroundImage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      backgroundImage: backGroundImage,
      radius: radius,
      child: childWidget,
    );
  }
}
