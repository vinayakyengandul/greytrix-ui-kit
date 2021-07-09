import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class GtBottomSheet extends StatelessWidget {
  GtBottomSheet({
    @required this.builder,
    this.elevation = 0,
    this.backgroundColor,
    this.onClosing,
    @required this.actionScrollController,
    @required this.actions,
    this.cancelButton,
    this.title,
  })  : assert(builder != null),
        assert(actions != null && cancelButton != null && title != null);

  final Color backgroundColor;
  final double elevation;
  final Function onClosing;
  final Function(BuildContext context) builder;
  final Widget title;
  final Widget cancelButton;
  final List<Widget> actions;
  final ScrollController actionScrollController;

  @override
  Widget build(BuildContext context) {
    return !kIsWeb
        ? Platform.isIOS
            ? CupertinoActionSheet(
                title: title,
                actions: actions,
                actionScrollController: actionScrollController,
                cancelButton: cancelButton,
              )
            : BottomSheet(
                onClosing: onClosing ?? () => {},
                backgroundColor: backgroundColor,
                builder: builder,
                elevation: elevation,
              )
        : BottomSheet(
            onClosing: onClosing ?? () => {},
            backgroundColor: backgroundColor,
            builder: builder,
            elevation: elevation,
          );
  }
}
