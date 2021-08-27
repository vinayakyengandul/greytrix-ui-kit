import 'package:flutter/material.dart';

class GtProgressBar extends StatelessWidget {
  GtProgressBar({
    this.backgroundColor,
    this.value,
    this.valueColor,
    this.circularProgress = false,
    this.minHeight,
    this.strokeWidth,
  });

  final double value;
  final Color valueColor;
  final Color backgroundColor;
  final bool circularProgress;
  final double strokeWidth;
  final double minHeight;

  @override
  Widget build(BuildContext context) {
    return circularProgress
        ? CircularProgressIndicator(
            backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
            value: value ?? 10,
            valueColor: AlwaysStoppedAnimation(Colors.green),
            strokeWidth: strokeWidth ?? 10,
          )
        : LinearProgressIndicator(
            backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
            value: value,
            minHeight: minHeight,
            valueColor: AlwaysStoppedAnimation(Colors.grey),
          );
  }
}
