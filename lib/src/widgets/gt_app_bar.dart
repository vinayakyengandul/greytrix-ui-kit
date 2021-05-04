import 'package:flutter/material.dart';

class GtAppBar extends StatelessWidget implements PreferredSizeWidget {
  GtAppBar({
    Key key,
    this.primary = true,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.bottom,
    this.elevation: 0.0,
    this.backgroundColor = Colors.grey,
    this.flexibleSpace,
  })  : assert(automaticallyImplyLeading != null),
        assert(primary != null),
        preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  final Widget leading;
  final Widget title;
  final List<Widget> actions;
  final PreferredSizeWidget bottom;
  final bool primary;
  final bool automaticallyImplyLeading;
  final Color backgroundColor;
  final double elevation;
  final Widget flexibleSpace;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      backgroundColor: backgroundColor,
      title: this.title,
      leading: leading,
      bottom: bottom,
      actions: [
        if (actions != null) ...actions,
      ],
      flexibleSpace: flexibleSpace ?? Container(),
    );
  }
}
