import 'package:flutter/material.dart';

class GtIcon extends StatelessWidget {
  GtIcon({@required this.icondata, this.size, this.color});

  final IconData icondata;
  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Icon(icondata, color: color ?? Colors.blue, size: size ?? 25);
  }
}
