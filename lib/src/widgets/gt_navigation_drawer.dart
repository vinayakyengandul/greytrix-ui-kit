import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

class GtNavigationRails extends StatelessWidget {
  GtNavigationRails({
    @required this.nrdlist,
    this.selectedindex,
    this.setindex,
    this.trailingWidget,
    this.onHoverHandler,
    this.onHover,
    this.extendedWidth = 200,
    this.svgheight = 23,
    this.svgwidth = 23,
    this.imageSize = 20,
    this.extended = false,
    this.leadingWidget,
    this.showLabel = false,
    this.toolTipMessageField,
  });

  // LIST OF MENUS TO BE DISPLAYED
  final List<GtRail> nrdlist;

  // INDEX OF THE SELECTED MENU
  final int selectedindex;

  // FUNCTION SET INDEX WHEN MENUS IS CHANGE
  final Function setindex;

  // LEADING WIDGET BEFORE THE MENUS
  final Widget leadingWidget;

  // TRAILING WIDGET AFTER THE MENUS AT THE EXTREME BOTTOM
  final List<Widget> trailingWidget;

  // ON HOVER HANDLER FOR HANDLING
  final Function(bool isSelected, dynamic item) onHoverHandler;

  // ON HOVER INDEX
  final int onHover;

  // TOOLTIP FOR LIST
  final String Function(dynamic obj) toolTipMessageField;

  // EXTENDED WIDTH
  final double extendedWidth;

  // SVG IMAGE WIDTH
  final double svgheight;

  // SVG IMAGE WIDTH
  final double svgwidth;

  //  IMAGE  SIZE FOR ICON IMAGE
  final double imageSize;

  // FOR RAILS EXTENDED
  final bool extended;

  //TO SHOW LABEL FOR ICONS
  final bool showLabel;

  @override
  Widget build(BuildContext context) {
    // TO SHOW ICONS/IMAGES BASED ON THE TYPE
    Widget getrailsIcons(GtIconType iconType, int index) {
      switch (iconType) {
        case GtIconType.ICON:
          return GtIcon(
            icondata: selectedindex == index
                ? nrdlist[index].selectedIcon
                : nrdlist[index].icon,
            color: selectedindex == index
                ? Theme.of(context).navigationRailTheme.selectedIconTheme?.color
                : Theme.of(context)
                    .navigationRailTheme
                    .unselectedIconTheme
                    ?.color,
            size:
                Theme.of(context).navigationRailTheme.unselectedIconTheme?.size,
          );
          break;

        case GtIconType.IMAGE:
          return Padding(
              padding: EdgeInsets.only(left: 2.0),
              child: ImageIcon(
                AssetImage(nrdlist[index].imageUrl.toString()),
                size: imageSize,
                color: selectedindex == index
                    ? Theme.of(context)
                        .navigationRailTheme
                        .selectedIconTheme
                        .color
                    : Theme.of(context)
                        .navigationRailTheme
                        .unselectedIconTheme
                        .color,
              ));
          break;

        case GtIconType.SVG:
          return Container(
              padding: EdgeInsets.all(2.0),
              height: svgheight,
              width: svgwidth,
              child: SvgPicture.asset(
                nrdlist[index].iconPath.toString(),
              ));
          break;
        default:
          return Container();
          break;
      }
    }

    return Container(
        width: extended == true ? extendedWidth : 60.0,
        height: double.infinity,
        color: Theme.of(context).navigationRailTheme.backgroundColor,
        child: Column(children: [
          // LEADING WIDGET
          if (leadingWidget != null)
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: extended ? 8 : 12),
              child: leadingWidget,
            ),

          // MENUS SECTION
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: nrdlist.length,
                itemBuilder: (context, index) {
                  return AnimatedContainer(
                    decoration: BoxDecoration(
                      gradient: selectedindex == index
                          ? LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                  Theme.of(context)
                                      .navigationRailTheme
                                      .selectedIconTheme
                                      .color
                                      .withOpacity(0.2),
                                  Theme.of(context)
                                      .navigationRailTheme
                                      .backgroundColor
                                      .withOpacity(0.1),
                                ])
                          : LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                  Theme.of(context)
                                      .navigationRailTheme
                                      .backgroundColor,
                                  Theme.of(context)
                                      .navigationRailTheme
                                      .backgroundColor
                                ]),
                      color:
                          Theme.of(context).navigationRailTheme.backgroundColor,
                    ),
                    duration: Duration(milliseconds: 50),
                    child: Container(
                      decoration: extended
                          ? BoxDecoration(
                              border: Border(
                              right: BorderSide(
                                color: onHover == index
                                    ? Theme.of(context)
                                        .navigationRailTheme
                                        .selectedIconTheme
                                        .color
                                    : selectedindex == index
                                        ? Theme.of(context)
                                            .navigationRailTheme
                                            .selectedIconTheme
                                            .color
                                        : Theme.of(context)
                                            .navigationRailTheme
                                            .backgroundColor,
                                width: 2.5,
                              ),
                            ))
                          : null,
                      child: Tooltip(
                        message:
                            toolTipMessageField == null
                                ? nrdlist[index].label
                                : toolTipMessageField(nrdlist[index].label),
                        child: Center(
                          child: InkWell(
                            onTap: () =>
                                {if (setindex != null) setindex(index)},
                            onHover: (value) {
                              if (onHoverHandler != null)
                                onHoverHandler(value, index);
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 7, right: 7, top: 12, bottom: 12),
                              child:

                                  //  BASED ON THE EXTENDED PROPERTY CHANGED MENUS STYLE
                                  extended
                                      ? Row(children: <Widget>[
                                          getrailsIcons(
                                              nrdlist[index].iconType, index),
                                          Expanded(
                                              child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 15.0),
                                            child: AnimatedDefaultTextStyle(
                                              style: TextStyle(
                                                color: selectedindex == index
                                                    ? Theme.of(context)
                                                        .navigationRailTheme
                                                        .selectedIconTheme
                                                        .color
                                                    : Theme.of(context)
                                                        .navigationRailTheme
                                                        .unselectedIconTheme
                                                        .color,
                                                letterSpacing: onHover != null
                                                    ? onHover == index
                                                        ? 1.50
                                                        : 0.20
                                                    : 0.20,
                                                fontWeight:
                                                    selectedindex == index
                                                        ? FontWeight.w700
                                                        : null,
                                              ),
                                              duration:
                                                  Duration(milliseconds: 100),
                                              child: GtText(
                                                text: nrdlist[index].label,
                                                textStyle: selectedindex ==
                                                        index
                                                    ? Theme.of(context)
                                                        .navigationRailTheme
                                                        .selectedLabelTextStyle
                                                    : Theme.of(context)
                                                        .navigationRailTheme
                                                        .unselectedLabelTextStyle,
                                              ),
                                            ),
                                          ))
                                        ])
                                      : Column(children: [
                                          Container(
                                              child: getrailsIcons(
                                                  nrdlist[index].iconType,
                                                  index)),
                                          showLabel
                                              ? AnimatedDefaultTextStyle(
                                                  style: TextStyle(
                                                    color: selectedindex ==
                                                            index
                                                        ? Theme.of(context)
                                                            .navigationRailTheme
                                                            .selectedIconTheme
                                                            .color
                                                        : Theme.of(context)
                                                            .navigationRailTheme
                                                            .unselectedIconTheme
                                                            .color,
                                                    letterSpacing:
                                                        onHover != null
                                                            ? onHover == index
                                                                ? 0.80
                                                                : 0.20
                                                            : 0.20,
                                                    fontWeight:
                                                        selectedindex == index
                                                            ? FontWeight.w700
                                                            : null,
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 100),
                                                  child: GtText(
                                                    text: nrdlist[index].label,
                                                    textStyle: selectedindex ==
                                                            index
                                                        ? Theme.of(context)
                                                            .navigationRailTheme
                                                            .selectedLabelTextStyle
                                                        : Theme.of(context)
                                                            .navigationRailTheme
                                                            .unselectedLabelTextStyle,
                                                  ))
                                              : Container(),
                                        ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),

          // TRAILING WIDGET
          if (trailingWidget != null) ...[
            Column(
              children: trailingWidget,
            )
          ],
        ]));
  }
}
