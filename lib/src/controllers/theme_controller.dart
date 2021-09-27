import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../src/models/theme.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();

  ThemeMode _themeMode;
  ThemeData _themeData = (AppTheme.fromType(ThemeType.EpicTheme)).themeData;
  ThemeData get themeData => _themeData;
  ThemeMode get themeMode => _themeMode;

  ///SETS THE CHANGED THEME
  Future<void> setTheme(ThemeData themeData) async {
    Get.changeTheme(themeData);
    _themeData = themeData;

    update();
  }

  ///SETS THE INITIAL THEME MODE
  getThemeModeFromPreferences() async {
    ///SETTING INITIAL THEME DATA
    setTheme((new AppTheme.fromType(ThemeType.EpicTheme)).themeData);
  }
}
