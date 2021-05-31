import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GtActionSheet extends StatelessWidget {
  GtActionSheet(
      {@required this.actionScrollController,
      @required this.actions,
      this.message,
      this.title,
      this.cancelButton,
      this.messageScrollController});

  final List<Widget> actions;
  final ScrollController actionScrollController;
  final Widget title;
  final Widget message;
  final Widget cancelButton;
  final ScrollController messageScrollController;

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: actions,
      actionScrollController: actionScrollController,
      message: message,
      title: title,
      cancelButton: cancelButton,
      messageScrollController: messageScrollController,
    );
  }
}
