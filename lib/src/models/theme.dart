import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../src/utils/color_utils.dart';
import '../../src/utils/styled_text_input.dart';

enum ThemeType {
  // WhiteBlack,
  // BlueWhite,
  // FlockGreen,
  // WhiteBlackCombo,
  // CyanWhiteCombo,
  // BlueWhiteCombo,
  EpicTheme,
  EpicThemeDark
}

class AppTheme {
  // static ThemeType defaultTheme = ThemeType.FlockGreen;
  static ThemeType defaultTheme = ThemeType.EpicTheme;
  static String defaultFontFamily = 'OpenSans'; //'Segoe UI';

  bool isDark;
  Color bg1; //
  Color surface; //
  Color bg2;
  Color railsbg;
  Color accent1;
  Color accent1Dark;
  Color accent1Darker;
  Color accent2;
  Color accent3;
  Color grey;
  Color greyStrong;
  Color greyWeak;
  Color error;
  Color focus;
  Color prime;

  Color txt;
  Color accentTxt;
  Color drawericon;
  Color selectedColor;
  Color unselectedColor;
  TextTheme textThemeTitle;
  TextStyle texttotal;
  IconThemeData iconTheme;
  IconThemeData primaryIconTheme;
  IconThemeData accentIconTheme;
  NavigationRailThemeData navigationRailThemeData;
  FloatingActionButtonThemeData floatingActionButtonThemeData;
  ChipThemeData chipTheme;
  CardTheme cardTheme;
  ButtonThemeData buttonTheme;
  AppBarTheme appBarTheme;

  /// Default constructor
  AppTheme({@required this.isDark}) {
    txt = isDark ? Colors.white : Colors.black;
    accentTxt = accentTxt ?? isDark ? Colors.black : Colors.white;
  }

  /// fromType factory constructor
  factory AppTheme.fromType(ThemeType t) {
    Color c(String value) => ColorUtils.parseHex(value);
    switch (t) {
      // case ThemeType.FlockGreen:
      //   return AppTheme(isDark: false)
      //     ..bg1 = Color(0xfff1f7f0)
      //     ..bg2 = Color(0xffc1dcbc)
      //     ..surface = Colors.white
      //     ..accent1 = Color(0xff00a086)
      //     ..accent1Dark = Color(0xff00856f)
      //     ..accent1Darker = Color(0xff006b5a)
      //     ..accent2 = Color(0xfff09433)
      //     ..accent3 = Color(0xff5bc91a)
      //     ..greyWeak = Color(0xff909f9c)
      //     ..grey = Color(0xff515d5a)
      //     ..greyStrong = Color(0xff151918)
      //     ..error = Colors.red.shade900
      //     ..focus = Color(0xFF0ee2b1)
      //     ..txt = Colors.black
      //     ..accentTxt = Colors.white
      //     ..texttotal = TextStyle(
      //         fontWeight: FontWeight.bold,
      //         color: Color(0xffB9B9B9),
      //         fontSize: 14)
      //     ..textThemeTitle = TextTheme(
      //       headline1: TextStyle(
      //           fontSize: 1.5 * SizeConfig.textMultiplier,
      //           fontWeight: FontWeight.bold,
      //           color: Color(0xffB9B9B9)),
      //       headline2: TextStyle(
      //           fontSize: 20.0,
      //           fontWeight: FontWeight.bold,
      //           color: Color(0xFF5785f3)),
      //       headline3: TextStyle(
      //           fontFamily: 'Oxygen',
      //           fontSize: 12.0,
      //           fontWeight: FontWeight.bold,
      //           height: 4,
      //           color: Colors.black),
      //       headline4: TextStyle(
      //           fontFamily: 'Poppins',
      //           color: Colors.black,
      //           fontSize: 18.0,
      //           fontWeight: FontWeight.w600),
      //       // headline5: themetextstyle['subTitle'],
      //       // // headline6: _title,
      //       // headline6: themetextstyle['title'],
      //       // button: themetextstyle['button'],
      //       // bodyText1: themetextstyle['greeting'],
      //       // subtitle1: themetextstyle['subTitle'],
      //     )
      //     ..drawericon = Colors.green;

      ///OLD BLUE_WHITE_THEME_DATA
      // case ThemeType.BlueWhite:
      //   return AppTheme(isDark: false)
      //     ..bg1 = Colors.blue[50]
      //     ..bg2 = Color(0xffc1dcbc)
      //     ..surface = Colors.white
      //     ..accent1 = Color(0xFF5785f3)
      //     ..accent1Dark = Color(0xff00856f)
      //     ..accent1Darker = Color(0xff006b5a)
      //     ..accent2 = Color(0xfff09433)
      //     ..accent3 = Color(0xff5bc91a)
      //     ..greyWeak = Color(0xff909f9c)
      //     ..grey = Color(0xff515d5a)
      //     ..greyStrong = Color(0xff151918)
      //     ..error = Colors.red.shade900
      //     ..focus = Color(0xFF0ee2b1)
      //     ..txt = Colors.black
      //     ..accentTxt = Colors.white
      //     ..texttotal = TextStyle(
      //         fontWeight: FontWeight.bold,
      //         color: Color(0xffB9B9B9),
      //         fontSize: 14)
      //     ..textThemeTitle = TextTheme(
      //       headline1: TextStyle(
      //           fontSize: 1.5 * SizeConfig.textMultiplier,
      //           fontWeight: FontWeight.bold,
      //           color: Color(0xffB9B9B9)),
      //       headline2: TextStyle(
      //           fontSize: 20.0,
      //           fontWeight: FontWeight.bold,
      //           color: Color(0xFF5785f3)),
      //       headline3: TextStyle(
      //           fontFamily: 'Oxygen',
      //           fontSize: 12.0,
      //           fontWeight: FontWeight.bold,
      //           height: 4,
      //           color: Colors.black),
      //       headline4: TextStyle(
      //           fontFamily: 'Poppins',
      //           color: Colors.black,
      //           fontSize: 18.0,
      //           fontWeight: FontWeight.w600),
      //       // headline5: themetextstyle['subTitle'],
      //       // //headline6 _title,
      //       // headline6: themetextstyle['title'],
      //       // button: themetextstyle['button'],
      //       // bodyText1: themetextstyle['greeting'],
      //       // subtitle1: themetextstyle['subTitle'],
      //     )
      //     ..drawericon = Color(0xFF5785f3);

      // case ThemeType.FlockGreen:
      //   return AppTheme(isDark: false)
      //     ..bg1 = Color(0xffa5d6a7)
      //     ..prime = Color(0xff4caf50)
      //     ..bg2 = Color(0xff4caf50)
      //     ..surface = Colors.white
      //     ..accent1 = Color(0xff4caf50)
      //     ..accent1Dark = Color(0xff388e3c)
      //     ..accent1Darker = Color(0xff388e3c)
      //     ..accent2 = Color(0xff88cc33)
      //     ..accent3 = Color(0xff388e3c)
      //     ..greyWeak = Color(0xffa5d6a7)
      //     ..error = Color(0xffd32f2f)
      //     ..focus = Color(0x1f000000)
      //     ..txt = Color(0x8a000000)
      //     ..railsbg = Color(0xfff8fcf3)
      //     ..accentTxt = Colors.white
      //     ..selectedColor = Color(0xffa5d6a7)
      //     ..unselectedColor = Color(0x8a000000)
      //     ..appBarTheme = AppBarTheme(
      //       backgroundColor: Color(0xffa5d6a7),
      //       shadowColor: Color(0xff4caf50)
      //     )
      //     ..texttotal = TextStyle(
      //         fontFamily: defaultFontFamily,
      //         fontWeight: FontWeight.bold,
      //         color: Color(0xffB9B9B9),
      //         fontSize: 14)
      //     ..textThemeTitle = TextTheme(
      //       headline1: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         fontSize: 93,
      //         fontWeight: FontWeight.w300,
      //         letterSpacing: -1.5,
      //       ),
      //       headline2: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         fontStyle: FontStyle.normal,
      //         // fontSize: 20.0,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 58,
      //         fontWeight: FontWeight.w300,
      //         letterSpacing: -0.5,
      //       ),
      //       headline3: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         fontStyle: FontStyle.normal,
      //         // fontSize: 12.0,
      //         fontSize: 47,
      //         fontWeight: FontWeight.w400,
      //       ),
      //       headline4: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         // fontSize: 18.0,
      //         fontWeight: FontWeight.w400,
      //         fontSize: 33,
      //         letterSpacing: 0.25,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       headline5: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xdd000000),
      //         // fontSize: null,
      //         fontWeight: FontWeight.w400,
      //         fontSize: 23,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       headline6: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xdd000000),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 19,
      //         fontWeight: FontWeight.w500,
      //         letterSpacing: 0.15,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       subtitle1: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xdd000000),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 16,
      //         fontWeight: FontWeight.w400,
      //         letterSpacing: 0.15,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       bodyText1: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xdd000000),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 16,
      //         fontWeight: FontWeight.w400,
      //         letterSpacing: 0.5,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       bodyText2: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xdd000000),
      //         // fontSize: null,
      //         fontSize: 14,
      //         fontWeight: FontWeight.w400,
      //         letterSpacing: 0.25,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       caption: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         // fontSize: null,
      //         fontSize: 12,
      //         letterSpacing: 0.4,
      //         fontWeight: FontWeight.w400,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       button: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xdd000000),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 14,
      //         fontWeight: FontWeight.w500,
      //         letterSpacing: 1.25,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       subtitle2: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xff000000),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 14,
      //         fontWeight: FontWeight.w500,
      //         letterSpacing: 0.1,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       overline: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xff000000),
      //         // fontSize: null,
      //         fontSize: 10,
      //         fontWeight: FontWeight.w400,
      //         letterSpacing: 1.5,
      //         fontStyle: FontStyle.normal,
      //       ),
      //     )
      //     ..iconTheme = IconThemeData(
      //       color: Color(0xff4caf50),
      //       opacity: 1,
      //       size: 24,
      //     )
      //     ..primaryIconTheme = IconThemeData(
      //       //color: Color(0xff4caf50),
      //       color: Colors.white,
      //       opacity: 1,
      //       size: 24,
      //     )
      //     ..accentIconTheme = IconThemeData(
      //       color: Colors.white,
      //       opacity: 1,
      //       size: 24,
      //     )
      //     ..navigationRailThemeData = NavigationRailThemeData(
      //       backgroundColor: Colors.white,
      //     )
      //     ..floatingActionButtonThemeData =
      //         FloatingActionButtonThemeData(foregroundColor: Colors.white)
      //     ..cardTheme = CardTheme(color: Colors.white)
      //     ..chipTheme = ChipThemeData(
      //       backgroundColor: Color(0x1f000000),
      //       brightness: Brightness.light,
      //       deleteIconColor: Color(0xde000000),
      //       disabledColor: Color(0x0c000000),
      //       labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
      //       labelStyle: TextStyle(
      //         color: Color(0xde000000),
      //         fontSize: null,
      //         fontWeight: FontWeight.w400,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
      //       secondaryLabelStyle: TextStyle(
      //         color: Color(0x3d000000),
      //         fontSize: null,
      //         fontWeight: FontWeight.w400,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       secondarySelectedColor: Color(0x3df8fcf3),
      //       selectedColor: Color(0x3d000000),
      //       shape: StadiumBorder(
      //           side: BorderSide(
      //         color: Color(0xff000000),
      //         width: 0,
      //         style: BorderStyle.none,
      //       )),
      //     );

      // case ThemeType.BlueWhite:
      //   return AppTheme(isDark: false)
      //     ..bg1 = Colors.blue[50]
      //     ..prime = Color(0xff2196f3)
      //     ..bg2 = Color(0xff2196f3)
      //     ..surface = Colors.white
      //     ..accent1 = Color(0xff2196f3)
      //     ..accent1Dark = Color(0xff1976d2)
      //     ..accent1Darker = Color(0xff1976c9)
      //     ..accent2 = Color(0xff4caf50)
      //     ..accent3 = Color(0xff1976d2)
      //     ..greyWeak = Color(0xff90caf9)
      //     ..error = Color(0xffd32f2f)
      //     ..focus = Color(0x1f000000)
      //     ..txt = Color(0x8a000000)
      //     ..railsbg = Color(0xfff8fcf3)
      //     ..accentTxt = Colors.white
      //     ..selectedColor = Color(0xff90caf9)
      //     ..unselectedColor = Color(0x8a000000)
      //     ..appBarTheme = AppBarTheme(
      //       backgroundColor: Color(0xff2196f3),
      //       shadowColor: Colors.blue[50]
      //     )
      //     ..texttotal = TextStyle(
      //         fontFamily: defaultFontFamily,
      //         fontWeight: FontWeight.bold,
      //         color: Color(0xffB9B9B9),
      //         fontSize: 14)
      //     ..textThemeTitle = TextTheme(
      //       headline1: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         fontSize: 93,
      //         fontWeight: FontWeight.w300,
      //         letterSpacing: -1.5,
      //       ),
      //       headline2: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         fontStyle: FontStyle.normal,
      //         // fontSize: 20.0,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 58,
      //         fontWeight: FontWeight.w300,
      //         letterSpacing: -0.5,
      //       ),
      //       headline3: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         fontStyle: FontStyle.normal,
      //         // fontSize: 12.0,
      //         fontSize: 47,
      //         fontWeight: FontWeight.w400,
      //       ),
      //       headline4: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         // fontSize: 18.0,
      //         fontWeight: FontWeight.w400,
      //         fontSize: 33,
      //         letterSpacing: 0.25,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       headline5: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xdd000000),
      //         // fontSize: null,
      //         fontWeight: FontWeight.w400,
      //         fontSize: 23,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       headline6: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xdd000000),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 19,
      //         fontWeight: FontWeight.w500,
      //         letterSpacing: 0.15,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       subtitle1: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xdd000000),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 16,
      //         fontWeight: FontWeight.w400,
      //         letterSpacing: 0.15,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       bodyText1: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xdd000000),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 16,
      //         fontWeight: FontWeight.w400,
      //         letterSpacing: 0.5,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       bodyText2: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xdd000000),
      //         // fontSize: null,
      //         fontSize: 14,
      //         fontWeight: FontWeight.w400,
      //         letterSpacing: 0.25,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       caption: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         // fontSize: null,
      //         fontSize: 12,
      //         letterSpacing: 0.4,
      //         fontWeight: FontWeight.w400,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       button: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xdd000000),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 14,
      //         fontWeight: FontWeight.w500,
      //         letterSpacing: 1.25,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       subtitle2: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xff000000),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 14,
      //         fontWeight: FontWeight.w500,
      //         letterSpacing: 0.1,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       overline: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xff000000),
      //         // fontSize: null,
      //         fontSize: 10,
      //         fontWeight: FontWeight.w400,
      //         letterSpacing: 1.5,
      //         fontStyle: FontStyle.normal,
      //       ),
      //     )
      //     ..iconTheme = IconThemeData(
      //       color: Color(0xff2196f3),
      //       opacity: 1,
      //       size: 24,
      //     )
      //     ..primaryIconTheme = IconThemeData(
      //       //color: Color(0xff2196f3),
      //       color: Colors.white,
      //       opacity: 1,
      //       size: 24,
      //     )
      //     ..accentIconTheme = IconThemeData(
      //       color: Colors.white,
      //       opacity: 1,
      //       size: 24,
      //     )
      //     ..navigationRailThemeData =
      //         NavigationRailThemeData(backgroundColor: Colors.white)
      //     ..floatingActionButtonThemeData =
      //         FloatingActionButtonThemeData(foregroundColor: Colors.white)
      //     ..cardTheme = CardTheme(color: Colors.white)
      //     ..chipTheme = ChipThemeData(
      //       backgroundColor: Color(0x1f000000),
      //       brightness: Brightness.light,
      //       deleteIconColor: Color(0xde000000),
      //       disabledColor: Color(0x0c000000),
      //       labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
      //       labelStyle: TextStyle(
      //         color: Color(0xde000000),
      //         fontSize: null,
      //         fontWeight: FontWeight.w400,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
      //       secondaryLabelStyle: TextStyle(
      //         color: Color(0x3d000000),
      //         fontSize: null,
      //         fontWeight: FontWeight.w400,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       secondarySelectedColor: Color(0x3df8fcf3),
      //       selectedColor: Color(0x3d000000),
      //       shape: StadiumBorder(
      //           side: BorderSide(
      //         color: Color(0xff000000),
      //         width: 0,
      //         style: BorderStyle.none,
      //       )),
      //     );

      // case ThemeType.WhiteBlack:
      //   return AppTheme(isDark: false)
      //     ..bg1 = Colors.white
      //     ..prime = Colors.white
      //     // Selected Color - Color(0x3d000000)
      //     //Unselected color - Colors.White
      //     //Color(0xfff8fcf3) //SET BG COLOR AS A PRIMARY COLOR ONLY //Color(0xffffffff) //Color(0xffcfebad)//BG COLOR SET TO WHITE
      //     ..bg2 = Color(0xff000000)
      //     ..surface = Color(0xffffffff)
      //     ..accent1 = Color(0xfff8fcf3)
      //     ..accent1Dark = Color(0xff00856f)
      //     ..accent1Darker =   Color(0xff000000)
      //     ..accent2 = Color(0xff88cc33)
      //     ..accent3 = Color(0xff5bc91a)
      //     ..greyWeak = Color(0xffcfebad)
      //     ..error = Color(0xffd32f2f)
      //     ..focus = Color(0x1f000000)
      //     ..txt = Color(0xff000000)
      //     ..railsbg = Color(0xfff8fcf3)
      //     ..accentTxt = Color(0xff000000)
      //     ..selectedColor = Color(0x3d000000)
      //     ..unselectedColor = Color(0x8a000000) //Colors.white
      //     ..appBarTheme = AppBarTheme(
      //       backgroundColor:Colors.white,
      //       shadowColor: Color(0xff000000)
      //     )
      //     ..texttotal = TextStyle(
      //         fontFamily: defaultFontFamily,
      //         fontWeight: FontWeight.bold,
      //         color: Color(0xffB9B9B9),
      //         fontSize: 14)
      //     ..textThemeTitle = TextTheme(
      //       headline1: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         fontSize: 93,
      //         fontWeight: FontWeight.w300,
      //         letterSpacing: -1.5,
      //       ),
      //       headline2: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         fontStyle: FontStyle.normal,
      //         // fontSize: 20.0,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 58,
      //         fontWeight: FontWeight.w300,
      //         letterSpacing: -0.5,
      //       ),
      //       headline3: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         fontStyle: FontStyle.normal,
      //         // fontSize: 12.0,
      //         fontSize: 47,
      //         fontWeight: FontWeight.w400,
      //       ),
      //       headline4: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         // fontSize: 18.0,
      //         fontWeight: FontWeight.w400,
      //         fontSize: 33,
      //         letterSpacing: 0.25,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       headline5: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xdd000000),
      //         // fontSize: null,
      //         fontWeight: FontWeight.w400,
      //         fontSize: 23,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       headline6: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xdd000000),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 19,
      //         fontWeight: FontWeight.w500,
      //         letterSpacing: 0.15,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       subtitle1: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xdd000000),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 16,
      //         fontWeight: FontWeight.w400,
      //         letterSpacing: 0.15,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       bodyText1: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xdd000000),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 16,
      //         fontWeight: FontWeight.w400,
      //         letterSpacing: 0.5,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       bodyText2: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xdd000000),
      //         // fontSize: null,
      //         fontSize: 14,
      //         fontWeight: FontWeight.w400,
      //         letterSpacing: 0.25,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       caption: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         // fontSize: null,
      //         fontSize: 12,
      //         letterSpacing: 0.4,
      //         fontWeight: FontWeight.w400,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       button: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xdd000000),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 14,
      //         fontWeight: FontWeight.w500,
      //         letterSpacing: 1.25,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       subtitle2: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xff000000),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 13,
      //         fontWeight: FontWeight.w500,
      //         letterSpacing: 0.1,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       overline: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xff000000),
      //         // fontSize: null,
      //         fontSize: 10,
      //         fontWeight: FontWeight.w400,
      //         letterSpacing: 1.5,
      //         fontStyle: FontStyle.normal,
      //       ),
      //     )
      //     ..iconTheme = IconThemeData(
      //       color: Color(0xdd000000),
      //       opacity: 1,
      //       size: 24,
      //     )
      //     ..primaryIconTheme = IconThemeData(
      //       color: Color(0xff000000),
      //       //color : Colors.white,
      //       opacity: 1,
      //       size: 24,
      //     )
      //     ..accentIconTheme = IconThemeData(
      //       color: Colors.white,
      //       opacity: 1,
      //       size: 24,
      //     )
      //     ..navigationRailThemeData =
      //         NavigationRailThemeData(backgroundColor: Colors.white)
      //     ..floatingActionButtonThemeData =
      //         FloatingActionButtonThemeData(foregroundColor: Colors.white)
      //     ..cardTheme = CardTheme(color: Colors.white)
      //     ..chipTheme = ChipThemeData(
      //       backgroundColor: Color(0x1f000000),
      //       brightness: Brightness.light,
      //       deleteIconColor: Color(0xde000000),
      //       disabledColor: Color(0x0c000000),
      //       labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
      //       labelStyle: TextStyle(
      //         color: Color(0xde000000),
      //         fontSize: null,
      //         fontWeight: FontWeight.w400,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
      //       secondaryLabelStyle: TextStyle(
      //         color: Color(0x3d000000),
      //         fontSize: null,
      //         fontWeight: FontWeight.w400,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       secondarySelectedColor: Color(0x3df8fcf3),
      //       selectedColor: Color(0x3d000000),
      //       shape: StadiumBorder(
      //           side: BorderSide(
      //         color: Color(0xff000000),
      //         width: 0,
      //         style: BorderStyle.none,
      //       )),
      //     )
      //     ..buttonTheme = ButtonThemeData(
      //       textTheme: ButtonTextTheme.normal,
      //       minWidth: 88,
      //       height: 36,
      //       padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
      //       shape: RoundedRectangleBorder(
      //         side: BorderSide(
      //           color: Color(0xff000000),
      //           width: 0,
      //           style: BorderStyle.none,
      //         ),
      //         borderRadius: BorderRadius.all(Radius.circular(2.0)),
      //       ),
      //       alignedDropdown: false,
      //       buttonColor: Color(0xffe0e0e0),
      //       disabledColor: Color(0x61000000),
      //       highlightColor: Color(0x29000000),
      //       splashColor: Color(0x1f000000),
      //       focusColor: Color(0x1f000000),
      //       hoverColor: Color(0x0a000000),
      //       colorScheme: ColorScheme(
      //         primary: Color(0xff000000),
      //         primaryVariant: Color(0xff527a1f),
      //         secondary: Color(0xff88cc33),
      //         secondaryVariant: Color(0xff527a1f),
      //         surface: Color(0xffffffff),
      //         background: Color(0xffcfebad),
      //         error: Color(0xffd32f2f),
      //         onPrimary: Color(0xffffffff),
      //         onSecondary: Color(0xff000000),
      //         onSurface: Color(0xff000000),
      //         onBackground: Color(0xff000000),
      //         onError: Color(0xffffffff),
      //         brightness: Brightness.light,
      //       ),
      //     );
      // //Color(0xfff8fcf3))
      // //..drawericon = Color(0xFF5785f3);

      // case ThemeType.WhiteBlackCombo:
      //   return AppTheme(isDark: false)
      //     ..bg1 = Colors.white
      //     ..prime = Colors.white
      //     ..bg2 = Colors.blue
      //     ..surface = Color(0xffffffff)
      //     ..accent1 = Color(0x1f414141)
      //     //Color(0x1f000000)
      //     ..accent1Dark = Color(0xff00856f)
      //     ..accent1Darker = Color(0xff527a1f)
      //     ..accent2 = Color(0xff4caf50)
      //     ..accent3 = Color(0xff5bc91a)
      //     ..greyWeak = Color(0xffcfebad)
      //     ..error = Color(0xffd32f2f)
      //     ..focus = Color(0x1f000000)
      //     ..txt = Color(0x1f414141)
      //     //Color(0xff000000)
      //     ..railsbg = Color(0xfff8fcf3)
      //     ..accentTxt = Color(0x1f414141)
      //     //Color(0xff000000)
      //     ..selectedColor = Colors.blue[100]
      //     ..unselectedColor = Color(0x1f414141)
      //     //Color(0x8a000000) //Colors.white
      //     ..appBarTheme = AppBarTheme(
      //       backgroundColor: Colors.white,
      //        shadowColor: Color(0xff000000)
      //     )
      //     ..texttotal = TextStyle(
      //         fontFamily: defaultFontFamily,
      //         fontWeight: FontWeight.bold,
      //         color: Color(0x8a000000),
      //         fontSize: 14)
      //     ..textThemeTitle = TextTheme(
      //       headline1: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         //Color(0x8a000000),
      //         fontSize: 93,
      //         fontWeight: FontWeight.w300,
      //         letterSpacing: -1.5,
      //       ),
      //       headline2: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         //Color(0x8a000000),
      //         fontStyle: FontStyle.normal,
      //         // fontSize: 20.0,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 58,
      //         fontWeight: FontWeight.w300,
      //         letterSpacing: -0.5,
      //       ),
      //       headline3: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         //Color(0x8a000000),
      //         fontStyle: FontStyle.normal,
      //         // fontSize: 12.0,
      //         fontSize: 47,
      //         fontWeight: FontWeight.w400,
      //       ),
      //       headline4: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         //Color(0x8a000000),
      //         // fontSize: 18.0,
      //         fontWeight: FontWeight.w400,
      //         fontSize: 33,
      //         letterSpacing: 0.25,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       headline5: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         //Color(0xdd000000),
      //         // fontSize: null,
      //         fontWeight: FontWeight.w400,
      //         fontSize: 23,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       headline6: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         //Color(0xdd000000),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 19,
      //         fontWeight: FontWeight.w500,
      //         letterSpacing: 0.15,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       subtitle1: TextStyle(
      //         fontFamily: "Lekton",
      //         color: Color(0x8a000000),
      //         // Color(0x8a000000),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 16,
      //         fontWeight: FontWeight.bold,
      //         //letterSpacing: 0.15,
      //         //fontStyle: FontStyle.normal,
      //       ),
      //       bodyText1: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         //Color(0xdd000000),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 16,
      //         fontWeight: FontWeight.w400,
      //         letterSpacing: 0.5,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       bodyText2: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         //Color(0xdd000000),
      //         // fontSize: null,
      //         fontSize: 14,
      //         fontWeight: FontWeight.w400,
      //         letterSpacing: 0.25,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       caption: TextStyle(
      //         fontFamily: defaultFontFamily,
      //        color: Color(0x8a000000),
      //         //Color(0x8a000000),
      //         // fontSize: null,
      //         fontSize: 12,
      //         letterSpacing: 0.4,
      //         fontWeight: FontWeight.w400,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       button: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         //Color(0xdd000000),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 14,
      //         fontWeight: FontWeight.w500,
      //         letterSpacing: 1.25,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       subtitle2: TextStyle(
      //         fontFamily: "Lekton",
      //         color: Color(0x8a000000),
      //         //Color(0x8a000000),
      //         fontSize: 12,
      //         fontWeight: FontWeight.w700,
      //         //letterSpacing: 0.1,
      //         //fontStyle: FontStyle.normal,
      //       ),
      //       overline: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         //Color(0xff000000),
      //         // fontSize: null,
      //         fontSize: 10,
      //         fontWeight: FontWeight.w400,
      //         letterSpacing: 1.5,
      //         fontStyle: FontStyle.normal,
      //       ),
      //     )
      //     ..iconTheme = IconThemeData(
      //       color: Colors.black,
      //       opacity: 1,
      //       size: 24,
      //     )
      //     ..primaryIconTheme = IconThemeData(
      //       color: Colors.blue,
      //       //color : Colors.white,
      //       opacity: 1,
      //       size: 24,
      //     )
      //     ..accentIconTheme = IconThemeData(
      //       color: Colors.black,
      //       opacity: 1,
      //       size: 24,
      //     )
      //     ..navigationRailThemeData =
      //         NavigationRailThemeData(backgroundColor: Colors.white)
      //     ..floatingActionButtonThemeData =
      //         FloatingActionButtonThemeData(foregroundColor: Colors.white)
      //     ..cardTheme = CardTheme(color: Colors.white)
      //     ..chipTheme = ChipThemeData(
      //       backgroundColor: Color(0x1f000000),
      //       brightness: Brightness.light,
      //       deleteIconColor: Color(0x1f414141),
      //       //Color(0xde000000),
      //       disabledColor: Color(0x0c000000),
      //       labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
      //       labelStyle: TextStyle(
      //         color: Color(0x1f414141),
      //         //Color(0xde000000),
      //         fontSize: null,
      //         fontWeight: FontWeight.w400,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
      //       secondaryLabelStyle: TextStyle(
      //         color: Color(0x1f414141),
      //         //Color(0x3d000000),
      //         fontSize: null,
      //         fontWeight: FontWeight.w400,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       secondarySelectedColor: Color(0x3df8fcf3),
      //       selectedColor: Color(0x3d000000),
      //       shape: StadiumBorder(
      //           side: BorderSide(
      //         color: Color(0x1f414141),
      //         //Color(0xff000000),
      //         width: 0,
      //         style: BorderStyle.none,
      //       )),
      //     )
      //     ..buttonTheme = ButtonThemeData(
      //       textTheme: ButtonTextTheme.normal,
      //       minWidth: 88,
      //       height: 36,
      //       padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
      //       shape: RoundedRectangleBorder(
      //         side: BorderSide(
      //           color: Color(0x1f414141),
      //           // Color(0xff000000),
      //           width: 0,
      //           style: BorderStyle.none,
      //         ),
      //         borderRadius: BorderRadius.all(Radius.circular(2.0)),
      //       ),
      //       alignedDropdown: false,
      //       buttonColor: Color(0xffe0e0e0),
      //       disabledColor: Color(0x61000000),
      //       highlightColor: Color(0x29000000),
      //       splashColor: Color(0x1f000000),
      //       focusColor: Color(0x1f000000),
      //       hoverColor: Color(0x0a000000),
      //       colorScheme: ColorScheme(
      //         primary: Colors.blue[100],
      //         primaryVariant: Color(0xff527a1f),
      //         secondary: Color(0xff88cc33),
      //         secondaryVariant: Color(0xff527a1f),
      //         surface: Color(0xffffffff),
      //         background: Color(0xffcfebad),
      //         error: Color(0xffd32f2f),
      //         onPrimary: Colors.black,
      //         //Color(0xff000000),
      //         onSecondary: Color(0x1f414141),
      //         //Color(0xff000000),
      //         onSurface: Color(0x1f414141),
      //         //Color(0xff000000),
      //         onBackground: Color(0x1f414141),
      //         //Color(0xff000000),
      //         onError: Color(0xffffffff),
      //         brightness: Brightness.light,
      //       ),
      //     );

      // case ThemeType.CyanWhiteCombo:
      //   return AppTheme(isDark: false)
      //     ..bg1 = Colors.white
      //     ..prime = Color(0xff00CEC9)
      //     ..bg2 = Color(0xff636E72)
      //     ..surface = Color(0xff74B9FF)
      //     ..accent1 = Color(0xfff8fcf3)
      //     ..accent1Dark = Color(0xff00856f)
      //     ..accent1Darker = Color(0xff00BEC9)
      //     ..accent2 = Color(0xff636E72)
      //     ..accent3 = Color(0xff5bc91a)
      //     ..greyWeak = Color(0xffcfebad)
      //     ..error = Color(0xffd32f2f)
      //     ..focus = Color(0x1f000000)
      //     ..txt = Color(0xff000000)
      //     ..railsbg = Color(0xfff8fcf3)
      //     ..accentTxt = Color(0xfff8fcf3)
      //     ..selectedColor = Color(0xffB9B9B9)
      //     ..unselectedColor = Color(0x8a000000) //Colors.white
      //     ..appBarTheme = AppBarTheme(
      //       backgroundColor: Color(0xff00CEC9),
      //        shadowColor: Colors.white
      //     )
      //     ..texttotal = TextStyle(
      //         fontFamily: defaultFontFamily,
      //         fontWeight: FontWeight.bold,
      //         color: Color(0xffB9B9B9),
      //         fontSize: 14)
      //     ..textThemeTitle = TextTheme(
      //       headline1: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         fontSize: 93,
      //         fontWeight: FontWeight.w300,
      //         letterSpacing: -1.5,
      //       ),
      //       headline2: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         fontStyle: FontStyle.normal,
      //         // fontSize: 20.0,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 58,
      //         fontWeight: FontWeight.w300,
      //         letterSpacing: -0.5,
      //       ),
      //       headline3: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         fontStyle: FontStyle.normal,
      //         // fontSize: 12.0,
      //         fontSize: 47,
      //         fontWeight: FontWeight.w400,
      //       ),
      //       headline4: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         // fontSize: 18.0,
      //         fontWeight: FontWeight.w400,
      //         fontSize: 33,
      //         letterSpacing: 0.25,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       headline5: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xdd000000),
      //         // fontSize: null,
      //         fontWeight: FontWeight.w400,
      //         fontSize: 23,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       headline6: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xff636E72),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 19,
      //         fontWeight: FontWeight.w500,
      //         letterSpacing: 0.15,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       subtitle1: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xdd000000),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 16,
      //         fontWeight: FontWeight.w400,
      //         letterSpacing: 0.15,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       bodyText1: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xff636E72),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 16,
      //         fontWeight: FontWeight.w400,
      //         letterSpacing: 0.5,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       bodyText2: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xff636E72),
      //         // fontSize: null,
      //         fontSize: 14,
      //         fontWeight: FontWeight.w400,
      //         letterSpacing: 0.25,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       caption: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         // fontSize: null,
      //         fontSize: 12,
      //         letterSpacing: 0.4,
      //         fontWeight: FontWeight.w700,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       button: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xdd000000),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 14,
      //         fontWeight: FontWeight.w500,
      //         letterSpacing: 1.25,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       subtitle2: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xff636E72),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 13,
      //         fontWeight: FontWeight.w500,
      //         letterSpacing: 0.1,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       overline: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xff000000),
      //         // fontSize: null,
      //         fontSize: 10,
      //         fontWeight: FontWeight.w400,
      //         letterSpacing: 1.5,
      //         fontStyle: FontStyle.normal,
      //       ),
      //     )
      //     ..iconTheme = IconThemeData(
      //       color: Color(0xff636E72),
      //       opacity: 1,
      //       size: 24,
      //     )
      //     ..primaryIconTheme = IconThemeData(
      //       color: Colors.white,
      //       //color : Colors.white,
      //       opacity: 1,
      //       size: 24,
      //     )
      //     ..accentIconTheme = IconThemeData(
      //       color: Colors.white,
      //       opacity: 1,
      //       size: 24,
      //     )
      //     ..navigationRailThemeData =
      //         NavigationRailThemeData(backgroundColor: Color(0xffffffff),)
      //     ..floatingActionButtonThemeData =
      //         FloatingActionButtonThemeData(foregroundColor: Colors.white)
      //     ..cardTheme = CardTheme(color: Colors.white)
      //     ..chipTheme = ChipThemeData(
      //       backgroundColor: Color(0x1f000000),
      //       brightness: Brightness.light,
      //       deleteIconColor: Color(0xde000000),
      //       disabledColor: Color(0x0c000000),
      //       labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
      //       labelStyle: TextStyle(
      //         color: Color(0xde000000),
      //         fontSize: null,
      //         fontWeight: FontWeight.w400,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
      //       secondaryLabelStyle: TextStyle(
      //         color: Color(0x3d000000),
      //         fontSize: null,
      //         fontWeight: FontWeight.w400,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       secondarySelectedColor: Color(0x3df8fcf3),
      //       selectedColor: Color(0x3d000000),
      //       shape: StadiumBorder(
      //           side: BorderSide(
      //         color: Color(0xff000000),
      //         width: 0,
      //         style: BorderStyle.none,
      //       )),
      //     )
      //     ..buttonTheme = ButtonThemeData(
      //       textTheme: ButtonTextTheme.normal,
      //       minWidth: 88,
      //       height: 36,
      //       padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
      //       shape: RoundedRectangleBorder(
      //         side: BorderSide(
      //           color: Color(0xff000000),
      //           width: 0,
      //           style: BorderStyle.none,
      //         ),
      //         borderRadius: BorderRadius.all(Radius.circular(2.0)),
      //       ),
      //       alignedDropdown: false,
      //       buttonColor: Color(0xffe0e0e0),
      //       disabledColor: Color(0x61000000),
      //       highlightColor: Color(0x29000000),
      //       splashColor: Color(0x1f000000),
      //       focusColor: Color(0x1f000000),
      //       hoverColor: Color(0x0a000000),
      //       colorScheme: ColorScheme(
      //         primary:Color(0xff00CEC9),
      //         primaryVariant: Color(0xff636E72),
      //         secondary: Color(0xff636E72),
      //         secondaryVariant: Color(0xff527a1f),
      //         surface: Color(0xffDFE6E9),
      //         //Color(0xffffffff),
      //         background: Color(0xffcfebad),
      //         error: Color(0xffd32f2f),
      //         onPrimary: Color(0xffffffff),
      //         onSecondary: Color(0xff000000),
      //         onSurface: Color(0xff000000),
      //         onBackground: Color(0xff000000),
      //         onError: Color(0xffffffff),
      //         brightness: Brightness.light,
      //       ),
      //     );

      // case ThemeType.BlueWhiteCombo:
      //   return AppTheme(isDark: false)
      //     ..bg1 = Colors.white
      //     ..prime = Color(0xff0099CC)
      //     ..bg2 = Color(0xffCCFFCC)
      //     ..surface = Color(0xff66CCFF)
      //     ..accent1 = Color(0xfff8fcf3)
      //     ..accent1Dark = Color(0xff00856f)
      //     ..accent1Darker = Colors.white
      //     ..accent2 = Color(0xff4caf50)
      //     ..accent3 = Color(0xff5bc91a)
      //     ..greyWeak = Color(0xffcfebad)
      //     ..error = Color(0xffd32f2f)
      //     ..focus = Color(0x1f000000)
      //     ..txt = Color(0xff000000)
      //     ..railsbg = Color(0xfff8fcf3)
      //     ..accentTxt = Color(0xfff8fcf3)
      //     ..selectedColor = Color(0xffB9B9B9)
      //     ..unselectedColor = Color(0x8a000000) //Colors.white
      //     ..appBarTheme = AppBarTheme(
      //       backgroundColor: Color(0xff0099CC),
      //        shadowColor: Colors.white
      //     )
      //     ..texttotal = TextStyle(
      //         fontFamily: defaultFontFamily,
      //         fontWeight: FontWeight.bold,
      //         color: Color(0xffB9B9B9),
      //         fontSize: 14)
      //     ..textThemeTitle = TextTheme(
      //       headline1: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         fontSize: 93,
      //         fontWeight: FontWeight.w300,
      //         letterSpacing: -1.5,
      //       ),
      //       headline2: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         fontStyle: FontStyle.normal,
      //         // fontSize: 20.0,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 58,
      //         fontWeight: FontWeight.w300,
      //         letterSpacing: -0.5,
      //       ),
      //       headline3: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         fontStyle: FontStyle.normal,
      //         // fontSize: 12.0,
      //         fontSize: 47,
      //         fontWeight: FontWeight.w400,
      //       ),
      //       headline4: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         // fontSize: 18.0,
      //         fontWeight: FontWeight.w400,
      //         fontSize: 33,
      //         letterSpacing: 0.25,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       headline5: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xdd000000),
      //         // fontSize: null,
      //         fontWeight: FontWeight.w400,
      //         fontSize: 23,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       headline6: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xff636E72),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 19,
      //         fontWeight: FontWeight.w500,
      //         letterSpacing: 0.15,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       subtitle1: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xdd000000),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 16,
      //         fontWeight: FontWeight.w400,
      //         letterSpacing: 0.15,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       bodyText1: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xff636E72),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 16,
      //         fontWeight: FontWeight.w400,
      //         letterSpacing: 0.5,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       bodyText2: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xff636E72),
      //         // fontSize: null,
      //         fontSize: 14,
      //         fontWeight: FontWeight.w400,
      //         letterSpacing: 0.25,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       caption: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0x8a000000),
      //         // fontSize: null,
      //         fontSize: 12,
      //         letterSpacing: 0.4,
      //         fontWeight: FontWeight.w400,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       button: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xdd000000),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 14,
      //         fontWeight: FontWeight.w500,
      //         letterSpacing: 1.25,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       subtitle2: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xff000000),
      //         // fontSize: null,
      //         // fontWeight: FontWeight.w400,
      //         fontSize: 13,
      //         fontWeight: FontWeight.w500,
      //         letterSpacing: 0.1,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       overline: TextStyle(
      //         fontFamily: defaultFontFamily,
      //         color: Color(0xff000000),
      //         // fontSize: null,
      //         fontSize: 10,
      //         fontWeight: FontWeight.w400,
      //         letterSpacing: 1.5,
      //         fontStyle: FontStyle.normal,
      //       ),
      //     )
      //     ..iconTheme = IconThemeData(
      //       color: Color(0xff0099CC),
      //       opacity: 1,
      //       size: 24,
      //     )
      //     ..primaryIconTheme = IconThemeData(
      //       color: Colors.white,
      //       //color : Colors.white,
      //       opacity: 1,
      //       size: 24,
      //     )
      //     ..accentIconTheme = IconThemeData(
      //       color:  Color(0xff0099CC),
      //       opacity: 1,
      //       size: 24,
      //     )
      //     ..navigationRailThemeData =
      //     NavigationRailThemeData(backgroundColor: Color(0xffffffff),)
      //     ..floatingActionButtonThemeData =
      //     FloatingActionButtonThemeData(foregroundColor: Colors.white)
      //     ..cardTheme = CardTheme(color: Colors.white)
      //     ..chipTheme = ChipThemeData(
      //       backgroundColor: Color(0x1f000000),
      //       brightness: Brightness.light,
      //       deleteIconColor: Color(0xde000000),
      //       disabledColor: Color(0x0c000000),
      //       labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
      //       labelStyle: TextStyle(
      //         color: Color(0xde000000),
      //         fontSize: null,
      //         fontWeight: FontWeight.w400,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
      //       secondaryLabelStyle: TextStyle(
      //         color: Color(0x3d000000),
      //         fontSize: null,
      //         fontWeight: FontWeight.w400,
      //         fontStyle: FontStyle.normal,
      //       ),
      //       secondarySelectedColor: Color(0x3df8fcf3),
      //       selectedColor: Color(0x3d000000),
      //       shape: StadiumBorder(
      //           side: BorderSide(
      //             color: Color(0xff000000),
      //             width: 0,
      //             style: BorderStyle.none,
      //           )),
      //     )
      //     ..buttonTheme = ButtonThemeData(
      //       textTheme: ButtonTextTheme.normal,
      //       minWidth: 88,
      //       height: 36,
      //       padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
      //       shape: RoundedRectangleBorder(
      //         side: BorderSide(
      //           color: Color(0xff000000),
      //           width: 0,
      //           style: BorderStyle.none,
      //         ),
      //         borderRadius: BorderRadius.all(Radius.circular(2.0)),
      //       ),
      //       alignedDropdown: false,
      //       buttonColor: Color(0xffe0e0e0),
      //       disabledColor: Color(0x61000000),
      //       highlightColor: Color(0x29000000),
      //       splashColor: Color(0x1f000000),
      //       focusColor: Color(0x1f000000),
      //       hoverColor: Color(0x0a000000),
      //       colorScheme: ColorScheme(
      //         primary: Color(0xff0099CC),
      //         primaryVariant: Color(0xff636E72),
      //         secondary: Color(0xff66CCFF),
      //         secondaryVariant: Color(0xff527a1f),
      //         surface: Color(0xffDFE6E9),
      //         //Color(0xffffffff),
      //         background: Color(0xffcfebad),
      //         error: Color(0xffd32f2f),
      //         onPrimary: Color(0xffffffff),
      //         onSecondary: Color(0xff000000),
      //         onSurface: Color(0xff000000),
      //         onBackground: Color(0xff000000),
      //         onError: Color(0xffffffff),
      //         brightness: Brightness.light,
      //       ),
      //     );

      case ThemeType.EpicTheme:
        return AppTheme(isDark: false)
          ..bg1 = Color(0xfff1f1f1)
          ..prime = Color(0xff5a5278)
          ..bg2 = Color(0xff5a5278)
          ..surface = Color(0xff66CCFF)
          ..accent1 = Colors.white
          ..accent1Dark = Color(0xff00856f)
          ..accent1Darker = Color(0xff5a5278)
          ..accent2 = Colors.blue
          ..accent3 = Color(0xff5bc91a)
          ..greyWeak = Color(0xffcfebad)
          ..error = Color(0xffd32f2f)
          ..focus = Color(0x1f000000)
          ..txt = Color(0xff000000)
          ..railsbg = Color(0xfff8fcf3)
          ..accentTxt = Color(0xfff8fcf3)
          ..selectedColor = Color(0xffB9B9B9)
          ..unselectedColor = Color(0x8a000000) //Colors.white
          ..appBarTheme = AppBarTheme(
              backgroundColor: Color(0xfff1f1f1),
              shadowColor: Color(0xff5a5278))
          ..texttotal = TextStyle(
              fontFamily: defaultFontFamily,
              fontWeight: FontWeight.bold,
              color: Color(0xffB9B9B9),
              fontSize: 14)
          ..textThemeTitle = TextTheme(
            headline1: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0x8a4d5052),
              fontSize: 93,
              fontWeight: FontWeight.w300,
              letterSpacing: -1.5,
            ),
            headline2: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0x8a4d5052),
              fontStyle: FontStyle.normal,
              // fontSize: 20.0,
              // fontWeight: FontWeight.w400,
              fontSize: 58,
              fontWeight: FontWeight.w300,
              letterSpacing: -0.5,
            ),
            headline3: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0x8a4d5052),
              fontStyle: FontStyle.normal,
              // fontSize: 12.0,
              fontSize: 47,
              fontWeight: FontWeight.w400,
            ),
            headline4: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0x8a4d5052),
              // fontSize: 18.0,
              fontWeight: FontWeight.w400,
              fontSize: 33,
              letterSpacing: 0.25,
              fontStyle: FontStyle.normal,
            ),
            headline5: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0x8a4d5052),
              // fontSize: null,
              fontWeight: FontWeight.w400,
              fontSize: 23,
              fontStyle: FontStyle.normal,
            ),
            headline6: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0xff5a5278),
              // fontSize: null,
              // fontWeight: FontWeight.w400,
              fontSize: 19,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
              fontStyle: FontStyle.normal,
            ),
            subtitle1: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0x8a4d5052),
              // fontSize: null,
              // fontWeight: FontWeight.w400,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.15,
              fontStyle: FontStyle.normal,
            ),
            bodyText1: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0xff636E72),
              // fontSize: null,
              // fontWeight: FontWeight.w400,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
              fontStyle: FontStyle.normal,
            ),
            bodyText2: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0xff212529),
              fontSize: 14,
              //fontWeight: FontWeight.w400,
              // letterSpacing: 0.25,
              // fontStyle: FontStyle.normal,
            ),
            caption: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0xff212529),
              // fontSize: null,
              fontSize: 13,
              letterSpacing: 0.4,
              // fontWeight: FontWeight.w400,
              // fontStyle: FontStyle.normal,
            ),
            button: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0x8a4d5052),
              // fontSize: null,
              // fontWeight: FontWeight.w400,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.25,
              fontStyle: FontStyle.normal,
            ),
            subtitle2: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0x8a4d5052),
              // fontSize: null,
              // fontWeight: FontWeight.w400,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.1,
              fontStyle: FontStyle.normal,
            ),
            overline: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0x8a4d5052),
              // fontSize: null,
              fontSize: 10,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.5,
              fontStyle: FontStyle.normal,
            ),
          )
          ..iconTheme = IconThemeData(
            color: Color(0xff4d5052),
            opacity: 1,
            size: 24,
          )
          ..primaryIconTheme = IconThemeData(
            color: Colors.white,
            //color : Colors.white,
            opacity: 1,
            size: 24,
          )
          ..accentIconTheme = IconThemeData(
            color: Color(0xfff1f1f1),
            opacity: 1,
            size: 24,
          )
          ..navigationRailThemeData = NavigationRailThemeData(
            backgroundColor: Color(0xffffffff),
            selectedIconTheme: IconThemeData(color: Colors.grey),
            selectedLabelTextStyle: TextStyle(),
            unselectedIconTheme: IconThemeData(color: Colors.black),
            unselectedLabelTextStyle: TextStyle(),
          )
          ..floatingActionButtonThemeData =
              FloatingActionButtonThemeData(foregroundColor: Colors.white)
          ..cardTheme = CardTheme(color: Colors.white)
          ..chipTheme = ChipThemeData(
            backgroundColor: Color(0x1f000000),
            brightness: Brightness.light,
            deleteIconColor: Color(0xde000000),
            disabledColor: Color(0x0c000000),
            labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
            labelStyle: TextStyle(
              color: Color(0xde000000),
              fontSize: null,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
            padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
            secondaryLabelStyle: TextStyle(
              color: Color(0x3d000000),
              fontSize: null,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
            secondarySelectedColor: Color(0x3df8fcf3),
            selectedColor: Color(0x3d000000),
            shape: StadiumBorder(
                side: BorderSide(
              color: Color(0xff000000),
              width: 0,
              style: BorderStyle.none,
            )),
          )
          ..buttonTheme = ButtonThemeData(
            textTheme: ButtonTextTheme.normal,
            minWidth: 88,
            height: 36,
            padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xff000000),
                width: 0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
            ),
            alignedDropdown: false,
            buttonColor: Color(0xffe0e0e0),
            disabledColor: Color(0x61000000),
            highlightColor: Color(0x29000000),
            splashColor: Color(0x1f000000),
            focusColor: Color(0x1f000000),
            hoverColor: Color(0x0a000000),
            colorScheme: ColorScheme(
              primary: Color(0xff5a5278),
              primaryVariant: Color(0xff636E72),
              secondary: Color(0xff007bff),
              secondaryVariant: Color(0xff527a1f),
              surface: Colors.white,
              //Color(0xffffffff),
              background: Color(0xffcfebad),
              error: Color(0xffd32f2f),
              onPrimary: Color(0xffffffff),
              onSecondary: Color(0xff000000),
              onSurface: Color(0xff000000),
              onBackground: Color(0xff000000),
              onError: Color(0xffffffff),
              brightness: Brightness.light,
            ),
          );

      case ThemeType.EpicThemeDark:
        return AppTheme(isDark: false)
          ..bg1 = Color(0xff343a40)
          ..prime = Color(0xff7d8490)
          ..bg2 = Color(0xff343a40)
          ..surface = Color(0xff66CCFF)
          ..accent1 = Color(0xff2b3035)
          ..accent1Dark = Color(0xff00856f)
          ..accent1Darker = Color(0xff7d8490)
          ..accent2 = Colors.blue
          ..accent3 = Color(0xff5bc91a)
          ..greyWeak = Color(0xffcfebad)
          ..error = Color(0xffd32f2f)
          ..focus = Color(0x1f000000)
          ..txt = Color(0xff000000)
          ..railsbg = Color(0xff80868e)
          ..accentTxt = Color(0xfff8fcf3)
          ..selectedColor = Color(0xffB9B9B9)
          ..unselectedColor = Color(0x8a000000) //Colors.white
          ..appBarTheme = AppBarTheme(
              backgroundColor: Color(0xff343a40),
              shadowColor: Color(0xff5a5278))
          ..texttotal = TextStyle(
              fontFamily: defaultFontFamily,
              fontWeight: FontWeight.bold,
              color: Color(0xffB9B9B9),
              fontSize: 14)
          ..textThemeTitle = TextTheme(
            headline1: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0x8a4d5052),
              fontSize: 93,
              fontWeight: FontWeight.w300,
              letterSpacing: -1.5,
            ),
            headline2: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0x8a4d5052),
              fontStyle: FontStyle.normal,
              // fontSize: 20.0,
              // fontWeight: FontWeight.w400,
              fontSize: 58,
              fontWeight: FontWeight.w300,
              letterSpacing: -0.5,
            ),
            headline3: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0x8a4d5052),
              fontStyle: FontStyle.normal,
              // fontSize: 12.0,
              fontSize: 47,
              fontWeight: FontWeight.w400,
            ),
            headline4: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0x8a4d5052),
              // fontSize: 18.0,
              fontWeight: FontWeight.w400,
              fontSize: 33,
              letterSpacing: 0.25,
              fontStyle: FontStyle.normal,
            ),
            headline5: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0x8a4d5052),
              // fontSize: null,
              fontWeight: FontWeight.w400,
              fontSize: 23,
              fontStyle: FontStyle.normal,
            ),
            headline6: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0xff7d8490),
              // fontSize: null,
              // fontWeight: FontWeight.w400,
              fontSize: 19,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
              fontStyle: FontStyle.normal,
            ),
            subtitle1: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0x8a4d5052),
              // fontSize: null,
              // fontWeight: FontWeight.w400,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.15,
              fontStyle: FontStyle.normal,
            ),
            bodyText1: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0xff636E72),
              // fontSize: null,
              // fontWeight: FontWeight.w400,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
              fontStyle: FontStyle.normal,
            ),
            bodyText2: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0xff212529),
              fontSize: 14,
              //fontWeight: FontWeight.w400,
              // letterSpacing: 0.25,
              // fontStyle: FontStyle.normal,
            ),
            caption: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0xff212529),
              // fontSize: null,
              fontSize: 13,
              letterSpacing: 0.4,
              // fontWeight: FontWeight.w400,
              // fontStyle: FontStyle.normal,
            ),
            button: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0x8a4d5052),
              // fontSize: null,
              // fontWeight: FontWeight.w400,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.25,
              fontStyle: FontStyle.normal,
            ),
            subtitle2: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0x8a4d5052),
              // fontSize: null,
              // fontWeight: FontWeight.w400,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.1,
              fontStyle: FontStyle.normal,
            ),
            overline: TextStyle(
              fontFamily: defaultFontFamily,
              color: Color(0x8a4d5052),
              // fontSize: null,
              fontSize: 10,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.5,
              fontStyle: FontStyle.normal,
            ),
          )
          ..iconTheme = IconThemeData(
            color: Color(0xff80868e),
            opacity: 1,
            size: 24,
          )
          ..primaryIconTheme = IconThemeData(
            color: Color(0xff7d8490),
            //color : Colors.white,
            opacity: 1,
            size: 24,
          )
          ..accentIconTheme = IconThemeData(
            color: Color(0xff7d8490),
            opacity: 1,
            size: 24,
          )
          ..navigationRailThemeData = NavigationRailThemeData(
            backgroundColor: Color(0xff343a40),
            selectedIconTheme: IconThemeData(color: Colors.grey),
            selectedLabelTextStyle: TextStyle(),
            unselectedIconTheme: IconThemeData(color: Colors.black),
            unselectedLabelTextStyle: TextStyle(),
          )
          ..floatingActionButtonThemeData =
              FloatingActionButtonThemeData(foregroundColor: Colors.white)
          ..cardTheme = CardTheme(color: Colors.white)
          ..chipTheme = ChipThemeData(
            backgroundColor: Color(0x1f000000),
            brightness: Brightness.light,
            deleteIconColor: Color(0xde000000),
            disabledColor: Color(0x0c000000),
            labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
            labelStyle: TextStyle(
              color: Color(0xde000000),
              fontSize: null,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
            padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
            secondaryLabelStyle: TextStyle(
              color: Color(0x3d000000),
              fontSize: null,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
            secondarySelectedColor: Color(0x3df8fcf3),
            selectedColor: Color(0x3d000000),
            shape: StadiumBorder(
                side: BorderSide(
              color: Color(0xff000000),
              width: 0,
              style: BorderStyle.none,
            )),
          )
          ..buttonTheme = ButtonThemeData(
            textTheme: ButtonTextTheme.normal,
            minWidth: 88,
            height: 36,
            padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xff000000),
                width: 0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
            ),
            alignedDropdown: false,
            buttonColor: Color(0xffe0e0e0),
            disabledColor: Color(0x61000000),
            highlightColor: Color(0x29000000),
            splashColor: Color(0x1f000000),
            focusColor: Color(0x1f000000),
            hoverColor: Color(0x0a000000),
            colorScheme: ColorScheme(
              primary: Color(0xff7d8490),
              primaryVariant: Color(0xff636E72),
              secondary: Color(0xff007bff),
              secondaryVariant: Color(0xff527a1f),
              surface: Color(0xff7d8490),
              //Color(0xffffffff),
              background: Color(0xffcfebad),
              error: Color(0xffd32f2f),
              onPrimary: Color(0xff636E72),
              onSecondary: Color(0xff000000),
              onSurface: Color(0xff000000),
              onBackground: Color(0xff000000),
              onError: Color(0xffffffff),
              brightness: Brightness.light,
            ),
          );
    }
    return AppTheme.fromType(defaultTheme);
  }

  ThemeData get themeData {
    var t = ThemeData.from(
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      colorScheme: ColorScheme(
          brightness: isDark ? Brightness.dark : Brightness.light,
          primary: prime,
          primaryVariant: accent1Darker,
          secondary: accent2,
          secondaryVariant: ColorUtils.shiftHsl(accent2, -.2),
          background: bg1,
          surface: surface,
          onBackground: txt,
          onSurface: txt,
          onError: txt,
          onPrimary: accentTxt,
          onSecondary: accentTxt,
          error: error ?? Colors.red.shade400),
    );
    return t.copyWith(
      inputDecorationTheme: InputDecorationTheme(
        border: ThinUnderlineBorder(),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //textSelectionColor: greyWeak,
      //textSelectionHandleColor: Colors.transparent,
      buttonColor: accent1,
      //cursorColor: accent1,
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: accent1,
          selectionHandleColor: Colors.transparent,
          selectionColor: greyWeak),
      highlightColor: accent1,
      textTheme: textThemeTitle,
      toggleableActiveColor: accent1,
      iconTheme: iconTheme,
      primaryIconTheme: primaryIconTheme,
      accentIconTheme: accentIconTheme,
      navigationRailTheme: navigationRailThemeData,
      floatingActionButtonTheme: floatingActionButtonThemeData,
      cardTheme: cardTheme,
      selectedRowColor: selectedColor,
      unselectedWidgetColor: unselectedColor,
      chipTheme: chipTheme,
      buttonTheme: buttonTheme,
      secondaryHeaderColor: bg2,
      appBarTheme: appBarTheme,
    );
  }

  Color shift(Color c, double d) =>
      ColorUtils.shiftHsl(c, d * (isDark ? -1 : 1));

  TextStyle getCustomtextstyle(TextStyle textstyle,
      {FontStyle fontstyle,
      String fontfamily,
      double opacity,
      FontWeight fontWeight,
      double fontsize}) {
    return TextStyle(
      color: opacity != null
          ? textstyle.color.withOpacity(opacity)
          : textstyle.color,
      fontSize: fontsize ?? textstyle.fontSize,
      fontFamily: fontfamily ?? textstyle.fontFamily,
      fontStyle: fontstyle ?? textstyle.fontStyle,
      fontWeight: fontWeight ?? textstyle.fontWeight,
      //FontWeight.normal,
    );
  }
}
