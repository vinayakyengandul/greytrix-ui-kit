
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greytrix_ui_kit/src/models/theme.dart';
import '../../greytrix_ui_kit.dart';

class ThemeFlexController extends GetxController {
  static ThemeFlexController get to => Get.find();

  ThemeMode _themeMode = ThemeMode.system;
  ThemeData _themeData = AppFlexTheme.fromType(AppFlexTheme.defaultFlexTheme).themeData;
  ThemeData _themeDataDark = AppFlexTheme.fromType(AppFlexTheme.defaultFlexTheme, isDark: true).themeData;
  FlexScheme _flexScheme = AppFlexTheme.defaultFlexTheme;
  bool _darkMode = false;
  ThemeData get themeData => _themeData;
  ThemeData get themeDataDark => _themeDataDark;
  ThemeMode get themeMode => _themeMode;
  FlexScheme get flexScheme => _flexScheme;
  bool get isDarkMode => _darkMode;

  ///SETS THE CHANGED THEME
  Future<void> setTheme(FlexScheme flexScheme)async {
    _themeData = AppFlexTheme.fromType(flexScheme).themeFlexData;
    _themeDataDark = AppFlexTheme.fromType(flexScheme,isDark: true).themeFlexData;
    _flexScheme = flexScheme;
     Get.changeTheme(_darkMode ? _themeDataDark : _themeData);
     update();
  }
  Future<void> changeThemeMode(ThemeMode themeModechange){
    _themeMode = themeModechange;
     Get.changeTheme(_darkMode ? _themeDataDark : _themeData);
     update();
    // Get.changeThemeMode(themeModechange);
    // update();
  }
}
