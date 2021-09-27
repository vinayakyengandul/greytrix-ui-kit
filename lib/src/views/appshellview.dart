import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

class AppShellView extends StatelessWidget {
  AppShellView(
      {this.kTabletBreakpoint = 720.0,
      this.kDesktopBreakpoint = 1366.0,
      this.child,
      this.title,
      this.appBar,
      this.themeData,
      this.themeDataDark,
      this.themeMode,
      this.enddrawer,
      this.appSidebar,
      this.navigationDrawer,
      this.bottomNavigationBar});

  final kTabletBreakpoint;
  final kDesktopBreakpoint;
  final String title;
  final Widget child;
  final Widget enddrawer;
  final Widget navigationDrawer;
  final Widget appSidebar;
  final Widget bottomNavigationBar;
  final ThemeData themeData;
  final ThemeData themeDataDark;
  final ThemeMode themeMode;

  final PreferredSizeWidget appBar;

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData,
        // darkTheme: themeDataDark,
        themeMode: themeMode,
        home: LayoutBuilder(
          builder: (_, constraints) {
            ///SCAFFOLD FOR WEB VIEW
            if (constraints.maxWidth >= kDesktopBreakpoint) {
              return Scaffold(
                  backgroundColor: context.theme.backgroundColor,
                  key: scaffoldKey,
                  endDrawer: enddrawer,
                  bottomNavigationBar: bottomNavigationBar,
                  body: Container(
                      child: Stack(children: [
                    Row(children: [
                      if (!SizeConfig.isMobilePortrait && appSidebar != null)
                        appSidebar,
                      VerticalDivider(thickness: 1, width: 0.8),
                      if (SizeConfig.isMobilePortrait == false &&
                          navigationDrawer != null)
                        navigationDrawer,
                      VerticalDivider(thickness: 1, width: 1),
                      Expanded(
                          child: Column(children: [
                        if (appBar != null) appBar,
                        Divider(
                          thickness: 0.1,
                          height: 1,
                          color: context.theme.primaryColor,
                          indent: 30,
                          endIndent: 30,
                        ),
                        Expanded(child: this.child)
                      ])),
                    ]),
                  ])));
            }

            ///SCAFFOLD FOR TABLETS VIEW
            if (constraints.maxWidth >= kTabletBreakpoint) {
              return Scaffold(
                  backgroundColor: context.theme.backgroundColor,
                  key: scaffoldKey,
                  endDrawer: enddrawer,
                  body: Container(
                      child: Stack(children: [
                    Row(children: [
                      if (!SizeConfig.isMobilePortrait && appSidebar != null)
                        appSidebar,
                      VerticalDivider(thickness: 1, width: 0.8),
                      if (SizeConfig.isMobilePortrait == false &&
                          navigationDrawer != null)
                        navigationDrawer,
                      VerticalDivider(thickness: 1, width: 1),
                      Expanded(
                          child: Column(children: [
                        if (appBar != null) appBar,
                        Divider(
                          thickness: 0.1,
                          height: 1,
                          color: context.theme.primaryColor,
                          indent: 30,
                          endIndent: 30,
                        ),
                        Expanded(child: this.child)
                      ])),
                    ]),
                  ])));
            }

            return SafeArea(
              child: Scaffold(
                backgroundColor: context.theme.backgroundColor,
                key: scaffoldKey,
                appBar: appBar,
                endDrawer: enddrawer,
                drawer: Row(children: [
                  if (appSidebar != null) appSidebar,
                  VerticalDivider(thickness: 1, width: 0.4),
                  if (navigationDrawer != null)
                    SizedBox(
                      width: 250.0,
                      child: navigationDrawer,
                    ),
                ]),
                bottomNavigationBar: bottomNavigationBar,
                body: this.child,
              ),
            );
          },
        )
        //)
        );
  }
}
