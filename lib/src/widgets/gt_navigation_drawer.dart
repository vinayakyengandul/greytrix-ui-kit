import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
import '../models/rails.dart';
import 'gt_icon.dart';
import 'gt_text.dart';

class GtNavigationRails extends StatelessWidget {
  GtNavigationRails({
    this.nrdlist,
    this.selectedindex,
    this.setindex,
    this.isShowLable = true,
    this.trailingWidget,
    this.navigationBackGroundColor = Colors.white,
    this.selectedRowColor = Colors.blueGrey,
    this.selectedRowDarkColor = Colors.grey,
    this.iconColor = Colors.black,
    this.onHoverHandler,
    this.onHover,
    this.selectedTitle = "",
    this.selectedTitleColor = Colors.blue,
    this.selectedTitleChange,
    this.selectedTitleOnTap,
    this.drawerWidth = 200,
    this.railIconSize = 16,
    this.svgheight = 23,
    this.svgwidth = 23,
    this.imageSize = 20,
    this.isExpandedNavigation = false,
    this.userProfileLink,
    this.listExpandedItems,
    this.onTapExpanded,
  });
  final List<Rails> nrdlist;
  final int selectedindex;
  final Function setindex;
  final bool isShowLable;
  final List<Widget> trailingWidget;
  final Color navigationBackGroundColor;
  final Color selectedRowColor;
  final Color selectedRowDarkColor;
  final Color iconColor;
  final Function(bool isSelected, dynamic item) onHoverHandler;
  final int onHover;
  final String selectedTitle;
  final Color selectedTitleColor;
  final Widget selectedTitleChange;
  final Function selectedTitleOnTap;
  final double drawerWidth;
  final double railIconSize;
  final double svgheight;
  final double svgwidth;
  final double imageSize;
  // Inputs for Expanded Navigation
  final bool isExpandedNavigation;
  final String userProfileLink;
  final List<dynamic> listExpandedItems;
  final Function(dynamic) onTapExpanded;

  @override
  Widget build(BuildContext context) {
    // TO SHOW ICONS/IMAGES BASED ON THE TYPE
    Widget getrailsIcons(GtIconType iconType, int index) {
      switch (iconType) {
        case GtIconType.ICON:
          return GtIcon(
            icondata: nrdlist[index].icon,
            color: selectedindex == index ? selectedRowDarkColor : iconColor,
            size: railIconSize,
          );
          break;

        case GtIconType.IMAGE:
          return Padding(
              padding: EdgeInsets.only(left: 2.0),
              child: ImageIcon(
                AssetImage(nrdlist[index].imageUrl),
                size: imageSize,
                color:
                    selectedindex == index ? selectedRowDarkColor : iconColor,
              ));
          break;

        case GtIconType.SVG:
          return Container(
              padding: EdgeInsets.all(2.0),
              height: svgheight,
              width: svgwidth,
              child: SvgPicture.asset(
                nrdlist[index].iconPath,
              ));
          break;
        default:
          break;
      }
    }

    return !isExpandedNavigation ? Container(
      width: isShowLable ? drawerWidth : 0,
      height: double.infinity,
      color: navigationBackGroundColor,
      child: Column(
        children: [
          if (selectedTitle != "" && selectedTitle != null)
            Container(
                padding: EdgeInsets.only(top: 11, bottom: 15),
                child: ListTile(
                  onTap: () {
                    if (selectedTitleOnTap != null) selectedTitleOnTap();
                  },
                  title: GtText(
                    text: selectedTitle,
                    textStyle: TextStyle(
                        color: selectedRowDarkColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w900),
                  ),
                  trailing:
                      selectedTitleChange != null ? selectedTitleChange : null,
                )),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: nrdlist.length,
                itemBuilder: (context, index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    // color: selectedindex == index
                    //     ? selectedRowColor
                    //     : navigationBackGroundColor,
                    color: navigationBackGroundColor,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                        right: BorderSide(
                          color: onHover == index
                              ? selectedRowDarkColor
                              : selectedindex == index
                                  ? selectedRowDarkColor
                                  : navigationBackGroundColor,
                          width: 2.5,
                        ),
                      )),
                      child: InkWell(
                        onTap: () => {if (setindex != null) setindex(index)},
                        onHover: (value) {
                          if (onHoverHandler != null)
                            onHoverHandler(value, index);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 7, right: 7, top: 12, bottom: 12),
                          child: Row(
                            children: <Widget>[
                              //nrdlist[index].imageUrl != ""
                              getrailsIcons(nrdlist[index].iconType, index),

                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.only(left: 15.0),
                                child: AnimatedDefaultTextStyle(
                                  style: TextStyle(
                                    color: selectedindex == index
                                        ? selectedRowDarkColor
                                        : iconColor,
                                    letterSpacing: onHover != null
                                        ? onHover == index
                                            ? 1.50
                                            : 0.20
                                        : 0.20,
                                    fontWeight: selectedindex == index
                                        ? FontWeight.w700
                                        : null,
                                  ),
                                  duration: Duration(milliseconds: 100),
                                  child: GtText(
                                    text: nrdlist[index].label,
                                    textStyle: TextStyle(),
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          if (trailingWidget != null) ...[
            Column(
              children: trailingWidget,
            )
          ],
        ],
      ),
   ) : Container(
      width: drawerWidth,
      height: double.infinity,
      color: navigationBackGroundColor,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 100.0,
            child: DrawerHeader(
              margin: EdgeInsets.all(0.0),
              padding: EdgeInsets.only(
                  left: 20.0, top: 10.0, right: 10.0, bottom: 10.0),
              decoration: BoxDecoration(
                color: navigationBackGroundColor,
              ),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: userProfileLink != null && userProfileLink != "" ? 
                    NetworkImage(userProfileLink)
                    : AssetImage(
                      "lib/assets/images/amanda_minicucci.jpg",
                      package: 'greytrix_ui_kit',
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Align(
                              alignment: FractionalOffset.bottomLeft,
                              child: Text(
                                selectedTitle.substring(0,selectedTitle.indexOf(" ")),
                                style: TextStyle(
                                    color: selectedTitleColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: FractionalOffset.topLeft,
                              child: Text(
                                selectedTitle.substring(selectedTitle.indexOf(" "),selectedTitle.length),
                                style: TextStyle(
                                  color: selectedTitleColor,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  selectedTitleChange,
                ],
              ),
            ),
          ),
          Flexible(child:ListView.builder(
            itemCount:listExpandedItems.length,
            itemBuilder: (context, index){
              List<Widget> listWidget = [];
              listWidget =  List<Widget>.generate(listExpandedItems[index]["ChildMenu"].length, (i) => 
              Ink(height: 40,
                  color: selectedRowColor,
                  child: ListTile(
                    leading: GtIcon(icondata: listExpandedItems[index]["ChildMenu"][i]["IconData"], color: iconColor,),
                    dense: true,
                    title: GtText(text: listExpandedItems[index]["ChildMenu"][i]["Menu"],
                      textStyle : TextStyle(color: selectedRowColor,fontSize: 16),
                    ),
                    onTap: () {
                      if(onTapExpanded != null)
                      onTapExpanded(listExpandedItems[index]["ChildMenu"][i]["Menu"]);
                    },
                  ),
                ),
                ).toList();
                return Theme(
                    data: Theme.of(context).copyWith(unselectedWidgetColor: selectedRowColor),
                    child: ExpansionTile(
                      childrenPadding: EdgeInsets.only(left: 30.0),
                      leading: Icon(listExpandedItems[index]["HeaderIcon"],
                        color: selectedRowColor,
                      ),
                      title: GtText(text: listExpandedItems[index]["HeaderMenu"],
                        textStyle: TextStyle(color: selectedRowColor,fontSize: 16),
                      ),
                      children: <Widget>[
                        ...listWidget
                      ]
                    ));
            },)),
        ],
      ),
    );
  }
}
