import 'package:flutter/material.dart';
import '../../greytrix_ui_kit.dart';

class GtTab extends StatelessWidget {
  GtTab({
    @required this.tabPages,
    @required this.tablist,
    @required this.pageController,
    @required this.tabcontroller,
    this.selectedColor,
    this.unselectedColor,
    this.selectedTab,
    this.onPressed,
    this.selectedTextStyle,
    this.unselectedTextStyle,
    this.isTophighlighted = false
  }) : assert(tabPages.length == tablist.length);

  final PageController pageController;
  final Color selectedColor;
  final Color unselectedColor;
  final Function onPressed;
  final List<String> tablist;
  final List<Widget> tabPages;
  final int selectedTab;
  final TextStyle selectedTextStyle;
  final TextStyle unselectedTextStyle;
  final ScrollController tabcontroller;
  final bool isTophighlighted;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: tabcontroller,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...tablist.asMap().entries.map(
                        (e) => new GtTabButton(
                          text: e.value,
                          pageNumber: e.key,
                          selectedPage: selectedTab,
                          onPressed: () => onPressed(e.key, false),
                          selectedColor: selectedColor,
                          unselectedColor: unselectedColor,
                          selectedTextStyle: selectedTextStyle,
                          unselectedTextStyle: unselectedTextStyle,
                          isTophighlighted: isTophighlighted,


                        ),
                      ),
                ],
              )),
        ),
        Expanded(
            child: PageView(
          onPageChanged: (index) {
            onPressed(index, true);
            tabcontroller.animateTo(
                index * (MediaQuery.of(context).size.width * 0.2),
                duration: Duration(seconds: 1),
                curve: Curves.decelerate);
          },
          controller: pageController,
          children: tabPages,
        ))
      ],
    ));
  }
}