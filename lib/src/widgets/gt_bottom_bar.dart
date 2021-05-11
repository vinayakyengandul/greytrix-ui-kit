import 'package:flutter/material.dart';

class GtBottomBar extends StatelessWidget {
  GtBottomBar({
    @required this.bottombarItems,
    this.selectedIconThemedata,
    this.unselectedIconThemedata,
    this.backgroundColor,
    this.showSelectedLabels = false,
    this.showUnselectedLabels = false,
    this.bartype = BottomNavigationBarType.fixed,
    this.onTaphandler,
    this.elevation,
    this.selectedItemColor,
    this.unselectedItemColor,
  });

  final List<BottomNavigationBarItem> bottombarItems;
  final IconThemeData selectedIconThemedata;
  final IconThemeData unselectedIconThemedata;
  final bool showSelectedLabels;
  final bool showUnselectedLabels;
  final Color backgroundColor;
  final BottomNavigationBarType bartype;
  final Function(int) onTaphandler;
  final double elevation;
  final Color unselectedItemColor;
  final Color selectedItemColor;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: elevation == null ? 8.0 : elevation,
      onTap: onTaphandler == null ? (value) => {} : onTaphandler,
      type: bartype,
      showSelectedLabels: showSelectedLabels,
      showUnselectedLabels: showUnselectedLabels,
      backgroundColor:
          backgroundColor == null ? Color(0xfff1f1f1) : backgroundColor,
      unselectedIconTheme: unselectedIconThemedata == null
          ? IconThemeData(
              color: Color(0xff5a5278),
            )
          : unselectedIconThemedata,
      selectedIconTheme: unselectedIconThemedata == null
          ? IconThemeData(
              color: Color(0xff5a5278),
            )
          : selectedIconThemedata,
      items: bottombarItems,
      unselectedItemColor: unselectedItemColor ?? Colors.white,
      selectedItemColor: selectedItemColor ?? Colors.blueAccent,
    );
  }
}
