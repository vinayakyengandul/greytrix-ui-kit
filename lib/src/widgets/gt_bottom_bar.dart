import 'package:flutter/material.dart';

class GtBottomBar extends StatelessWidget {
  GtBottomBar(
      {this.bottombarItems,
      this.selectedIconThemedata,
      this.unselectedIconThemedata});

  final List<BottomNavigationBarItem> bottombarItems;
  final IconThemeData selectedIconThemedata;
  final IconThemeData unselectedIconThemedata;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedIconTheme: unselectedIconThemedata == null
          ? IconThemeData(
              color: Color.fromRGBO(202, 205, 219, 1),
            )
          : unselectedIconThemedata,
      selectedIconTheme: unselectedIconThemedata == null
          ? IconThemeData(
              color: Colors.blueGrey,
            )
          : selectedIconThemedata,
      items: bottombarItems,
    );
  }
}
