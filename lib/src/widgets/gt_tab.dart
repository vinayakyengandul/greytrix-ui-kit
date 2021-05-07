import 'package:flutter/material.dart';
import '../../greytrix_ui_kit.dart';

class GtTab extends StatelessWidget {
  GtTab({
    @required this.tabPages,
    @required this.tablist,
    @required this.pageController,
    this.selectedColor,
    this.unselectedColor,
    this.selectedTab,
    this.onPressed,
    this.textStyle,
  }) : assert(tabPages.length == tablist.length);

  final PageController pageController;
  final Color selectedColor;
  final Color unselectedColor;
  final Function onPressed;
  final List<String> tablist;
  final List<Widget> tabPages;
  final int selectedTab;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
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
                      textStyle: textStyle,
                    ),
                  ),
            ],
          ),
        ),
        Expanded(
            child: PageView(
          onPageChanged: (index) => onPressed(index, true),
          controller: pageController,
          children: tabPages,
        ))
      ],
    ));
  }
}
