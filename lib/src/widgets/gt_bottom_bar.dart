import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

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
    this.iconsSize,
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
  final double iconsSize;

  @override
  Widget build(BuildContext context) {
    return !kIsWeb
        ? Platform.isIOS
            ? CupertinoTabBar(
                activeColor: selectedItemColor ?? Theme.of(context).primaryColor,
                backgroundColor: backgroundColor,
                items: bottombarItems,
                inactiveColor: unselectedItemColor ?? Theme.of(context).backgroundColor,
                onTap: onTaphandler == null ? (value) => {} : onTaphandler,
                iconSize: iconsSize ?? 30.0,
              )
            : BottomNavigationBar(
                elevation: elevation == null ? 8.0 : elevation,
                onTap: onTaphandler == null ? (value) => {} : onTaphandler,
                type: bartype,
                showSelectedLabels: showSelectedLabels,
                showUnselectedLabels: showUnselectedLabels,
                backgroundColor: backgroundColor,
                unselectedIconTheme: unselectedIconThemedata == null
                    ? IconThemeData(
                        color: Theme.of(context).iconTheme.color,
                      )
                    : unselectedIconThemedata,
                selectedIconTheme: unselectedIconThemedata == null
                    ? IconThemeData(
                        color: Theme.of(context).iconTheme.color,
                      )
                    : selectedIconThemedata,
                items: bottombarItems,
                unselectedItemColor: unselectedItemColor ?? Theme.of(context).backgroundColor,
                selectedItemColor: selectedItemColor ?? Theme.of(context).primaryColor,
              )
        : BottomNavigationBar(
            elevation: elevation == null ? 8.0 : elevation,
            onTap: onTaphandler == null ? (value) => {} : onTaphandler,
            type: bartype,
            showSelectedLabels: showSelectedLabels,
            showUnselectedLabels: showUnselectedLabels,
            backgroundColor:  backgroundColor,
            unselectedIconTheme: unselectedIconThemedata == null
                ? IconThemeData(
                    color: Theme.of(context).iconTheme.color,
                  )
                : unselectedIconThemedata,
            selectedIconTheme: unselectedIconThemedata == null
                ? IconThemeData(
                    color:Theme.of(context).iconTheme.color,
                  )
                : selectedIconThemedata,
            items: bottombarItems,
            unselectedItemColor: unselectedItemColor ?? Theme.of(context).backgroundColor,
            selectedItemColor: selectedItemColor ?? Theme.of(context).primaryColor,
          );
  }
}
