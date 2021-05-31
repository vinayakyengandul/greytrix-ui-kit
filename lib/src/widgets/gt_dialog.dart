import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

class GtDialog extends StatelessWidget {
  GtDialog(
      {@required this.buildContent,
      @required this.clipBehavior,
      this.backgroundColor,
      this.elevation,
      this.insetAnimationCurve,
      this.insetAnimationDuration,
      this.shape});

  final Widget Function(BuildContext context) buildContent;
  final Color backgroundColor;
  final Clip clipBehavior;
  double elevation;
  Curve insetAnimationCurve;
  Duration insetAnimationDuration;
  ShapeBorder shape;
  EdgeInsets insetPadding;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: backgroundColor,
        clipBehavior: clipBehavior ?? Clip.none,
        elevation: elevation,
        insetAnimationCurve: insetAnimationCurve,
        insetAnimationDuration: insetAnimationDuration,
        insetPadding: insetPadding,
        shape: shape,
        child: buildContent(context));
  }
}
