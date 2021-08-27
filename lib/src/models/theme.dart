

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppFlexTheme {
  static FlexScheme defaultFlexTheme = FlexScheme.bigStone;
  bool isDarkTheme = false;
  Color colorRail;
  FlexScheme flexScheme = FlexScheme.bigStone;
  ThemeData themeData = new ThemeData();
  AppFlexTheme({this.isDarkTheme = false}) {
    colorRail = isDarkTheme ? Color(0xFF161719) : Color(0xFFF4F4F5);
  }
  factory AppFlexTheme.fromType(FlexScheme t, {bool isDark = false}) {
    switch (t) {
        case FlexScheme.amber:
          return AppFlexTheme()..flexSchemeData(FlexScheme.amber, isDark);
        case FlexScheme.aquaBlue:
          return AppFlexTheme()..flexSchemeData(FlexScheme.aquaBlue, isDark);
        case FlexScheme.bahamaBlue:
          return AppFlexTheme()..flexSchemeData(FlexScheme.bahamaBlue, isDark);
        case FlexScheme.barossa:
          return AppFlexTheme()..flexSchemeData(FlexScheme.barossa, isDark);
        case FlexScheme.bigStone:
          return AppFlexTheme()..flexSchemeData(FlexScheme.bigStone, isDark);
        case FlexScheme.material:
          return AppFlexTheme()..flexSchemeData(FlexScheme.material, isDark);
        case FlexScheme.materialHc:
          return AppFlexTheme()..flexSchemeData(FlexScheme.materialHc, isDark);
        case FlexScheme.blue:
          return AppFlexTheme()..flexSchemeData(FlexScheme.blue, isDark);
        case FlexScheme.indigo:
          return AppFlexTheme()..flexSchemeData(FlexScheme.indigo, isDark);
        case FlexScheme.hippieBlue:
          return AppFlexTheme()..flexSchemeData(FlexScheme.hippieBlue, isDark);
        case FlexScheme.brandBlue:
          return AppFlexTheme()..flexSchemeData(FlexScheme.brandBlue, isDark);
        case FlexScheme.deepBlue:
          return AppFlexTheme()..flexSchemeData(FlexScheme.deepBlue, isDark);
        case FlexScheme.sakura:
          return AppFlexTheme()..flexSchemeData(FlexScheme.sakura, isDark);
        case FlexScheme.mandyRed:
          return AppFlexTheme()..flexSchemeData(FlexScheme.mandyRed, isDark);
        case FlexScheme.redWine:
          return AppFlexTheme()..flexSchemeData(FlexScheme.redWine, isDark);
        case FlexScheme.red:
          return AppFlexTheme()..flexSchemeData(FlexScheme.red, isDark);
        case FlexScheme.purpleBrown:
          return AppFlexTheme()..flexSchemeData(FlexScheme.purpleBrown, isDark);
        case FlexScheme.green:
          return AppFlexTheme()..flexSchemeData(FlexScheme.green, isDark);
        case FlexScheme.money:
          return AppFlexTheme()..flexSchemeData(FlexScheme.money, isDark);
        case FlexScheme.jungle:
          return AppFlexTheme()..flexSchemeData(FlexScheme.jungle, isDark);
        case FlexScheme.wasabi:
          return AppFlexTheme()..flexSchemeData(FlexScheme.wasabi, isDark);
        case FlexScheme.greyLaw:
          return AppFlexTheme()..flexSchemeData(FlexScheme.greyLaw, isDark);
        case FlexScheme.gold:
          return AppFlexTheme()..flexSchemeData(FlexScheme.gold, isDark);
        case FlexScheme.mango:
          return AppFlexTheme()..flexSchemeData(FlexScheme.mango, isDark);
        case FlexScheme.vesuviusBurn:
          return AppFlexTheme()..flexSchemeData(FlexScheme.vesuviusBurn, isDark);
        case FlexScheme.deepPurple:
          return AppFlexTheme()..flexSchemeData(FlexScheme.deepPurple, isDark);
        case FlexScheme.ebonyClay:
          return AppFlexTheme()..flexSchemeData(FlexScheme.ebonyClay, isDark);
        case FlexScheme.shark:
          return AppFlexTheme()..flexSchemeData(FlexScheme.shark, isDark);
        case FlexScheme.damask:
          return AppFlexTheme()..flexSchemeData(FlexScheme.damask, isDark);
        case FlexScheme.mallardGreen:
          return AppFlexTheme()..flexSchemeData(FlexScheme.mallardGreen, isDark);
        case FlexScheme.espresso:
          return AppFlexTheme()..flexSchemeData(FlexScheme.espresso, isDark);
        case FlexScheme.outerSpace:
          return AppFlexTheme()..flexSchemeData(FlexScheme.outerSpace, isDark);
        case FlexScheme.custom:
          return AppFlexTheme()..flexSchemeData(FlexScheme.custom, isDark);
          
      }
      return AppFlexTheme.fromType(defaultFlexTheme);
  }
  ThemeData get themeFlexData {
    return themeData;
  }
  
  flexSchemeData(FlexScheme scheme, bool dark){
    if(dark == false){
      themeData = FlexColorScheme.light(
          scheme: scheme,
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
        ).toTheme.copyWith(navigationRailTheme: NavigationRailThemeData(
          selectedIconTheme: IconThemeData(color: FlexColorScheme.light(scheme: scheme).toTheme.colorScheme.primary),
          backgroundColor: Color(0xFFF4F4F5),
          unselectedIconTheme: IconThemeData(color: FlexColorScheme.light(scheme: scheme).toTheme.unselectedWidgetColor )
        ),);
    }
    else{
      themeData = FlexColorScheme.dark(
          scheme: scheme,
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
        ).toTheme.copyWith(navigationRailTheme: NavigationRailThemeData(
          selectedIconTheme: IconThemeData(color: FlexColorScheme.light(scheme: scheme).toTheme.colorScheme.primary),
          backgroundColor: Color(0xFF161719),
          unselectedIconTheme: IconThemeData(color: FlexColorScheme.light(scheme: scheme).toTheme.unselectedWidgetColor )
        ),);
    }
  }
} 