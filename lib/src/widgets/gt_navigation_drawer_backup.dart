// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../models/rails.dart';
// import '../models/enums.dart';
// import 'gt_icon.dart';
// import 'gt_text.dart';

// class GtNavigationRails extends StatelessWidget {
//   GtNavigationRails({
//     this.nrdlist,
//     this.selectedindex,
//     this.setindex,
//     this.isShowLable = true,
//     this.trailingWidget,
//     this.navigationBackGroundColor,
//     this.selectedRowColor,
//     this.selectedRowDarkColor,
//     this.iconColor,
//     this.onHoverHandler,
//     this.onHover,
//     this.selectedTitle = "",
//     this.selectedTitleColor,
//     this.selectedTitleChange,
//     this.selectedTitleOnTap,
//     this.drawerWidth = 200,
//     this.railIconSize = 16,
//     this.svgheight = 23,
//     this.svgwidth = 23,
//     this.imageSize = 20,
//     this.isExpandedNavigation = false,
//     this.userProfileLink,
//     this.listExpandedItems,
//     this.onTapExpanded,
//     this.titleTextStyle,
//   });
//   final List<Rails> nrdlist;
//   final int selectedindex;
//   final Function setindex;
//   final bool isShowLable;
//   final List<Widget> trailingWidget;
//   final Color navigationBackGroundColor;
//   final Color selectedRowColor;
//   final Color selectedRowDarkColor;
//   final Color iconColor;
//   final Function(bool isSelected, dynamic item) onHoverHandler;
//   final int onHover;
//   final String selectedTitle;
//   final Color selectedTitleColor;
//   final Widget selectedTitleChange;
//   final Function selectedTitleOnTap;
//   final double drawerWidth;
//   final double railIconSize;
//   final double svgheight;
//   final double svgwidth;
//   final double imageSize;
//   // Inputs for Expanded Navigation
//   final bool isExpandedNavigation;
//   final String userProfileLink;
//   final List<dynamic> listExpandedItems;
//   final Function(dynamic) onTapExpanded;
//   final TextStyle titleTextStyle;

//   @override
//   Widget build(BuildContext context) {
//     // TO SHOW ICONS/IMAGES BASED ON THE TYPE
//     Widget getrailsIcons(GtIconType iconType, int index) {
//       switch (iconType) {
//         case GtIconType.ICON:
//           return GtIcon(
//             icondata: nrdlist[index].icon,
//             color: selectedindex == index ? selectedRowDarkColor ??  Theme.of(context)
//                                       .navigationRailTheme
//                                       .selectedIconTheme
//                                       .color : Theme.of(context).navigationRailTheme.unselectedIconTheme.color,
//             size: railIconSize,
//           );
//           break;

//         case GtIconType.IMAGE:
//           return Padding(
//               padding: EdgeInsets.only(left: 2.0),
//               child: ImageIcon(
//                 AssetImage(nrdlist[index].imageUrl),
//                 size: imageSize,
//                 color:
//                     selectedindex == index ? selectedRowDarkColor ??  Theme.of(context)
//                                       .navigationRailTheme
//                                       .selectedIconTheme
//                                       .color : iconColor,
//               ));
//           break;

//         case GtIconType.SVG:
//           return Container(
//               padding: EdgeInsets.all(2.0),
//               height: svgheight,
//               width: svgwidth,
//               child: SvgPicture.asset(
//                 nrdlist[index].iconPath,
//               ));
//           break;
//         default:
//           break;
//       }
//     }

//     return !isExpandedNavigation
//         ? Container(
//             width: isShowLable ? drawerWidth : 0,
//             height: double.infinity,
//             color: navigationBackGroundColor ?? Theme.of(context).navigationRailTheme.backgroundColor,
//             child: Column(
//               children: [
//                 if (selectedTitle != "" && selectedTitle != null)
//                   Container(
//                       padding: EdgeInsets.only(top: 11, bottom: 15),
//                       child: ListTile(
//                         onTap: () {
//                           if (selectedTitleOnTap != null) selectedTitleOnTap();
//                         },
//                         title: GtText(
//                           text: selectedTitle,
//                           textStyle: TextStyle(
//                               color: selectedRowDarkColor ??  Theme.of(context)
//                                       .navigationRailTheme
//                                       .selectedIconTheme
//                                       .color,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w900),
//                         ),
//                         trailing: selectedTitleChange != null
//                             ? selectedTitleChange
//                             : null,
//                       )),
//                 Expanded(
//                   child: ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: nrdlist.length,
//                       itemBuilder: (context, index) {
//                         return AnimatedContainer(
//                           duration: Duration(milliseconds: 100),
//                           // color: selectedindex == index
//                           //     ? selectedRowColor
//                           //     : navigationBackGroundColor,
//                           color: navigationBackGroundColor ?? Theme.of(context).navigationRailTheme.backgroundColor,
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 border: Border(
//                               right: BorderSide(
//                                 color: onHover == index
//                                     ? selectedRowDarkColor ??  Theme.of(context)
//                                       .navigationRailTheme
//                                       .selectedIconTheme
//                                       .color
//                                     : selectedindex == index
//                                         ? selectedRowDarkColor ??  Theme.of(context)
//                                       .navigationRailTheme
//                                       .selectedIconTheme
//                                       .color
//                                         : navigationBackGroundColor ?? Theme.of(context).navigationRailTheme.backgroundColor,
//                                 width: 2.5,
//                               ),
//                             )),
//                             child: InkWell(
//                               onTap: () =>
//                                   {if (setindex != null) setindex(index)},
//                               onHover: (value) {
//                                 if (onHoverHandler != null)
//                                   onHoverHandler(value, index);
//                               },
//                               child: Container(
//                                 padding: EdgeInsets.only(
//                                     left: 7, right: 7, top: 12, bottom: 12),
//                                 child: Row(
//                                   children: <Widget>[
//                                     //nrdlist[index].imageUrl != ""
//                                     getrailsIcons(
//                                         nrdlist[index].iconType, index),

//                                     Expanded(
//                                         child: Padding(
//                                       padding: EdgeInsets.only(left: 15.0),
//                                       child: AnimatedDefaultTextStyle(
//                                         style: TextStyle(
//                                           color: selectedindex == index
//                                               ? selectedRowDarkColor ??  Theme.of(context)
//                                       .navigationRailTheme
//                                       .selectedIconTheme
//                                       .color
//                                               : iconColor,
//                                           letterSpacing: onHover != null
//                                               ? onHover == index
//                                                   ? 1.50
//                                                   : 0.20
//                                               : 0.20,
//                                           fontWeight: selectedindex == index
//                                               ? FontWeight.w700
//                                               : null,
//                                         ),
//                                         duration: Duration(milliseconds: 100),
//                                         child: GtText(
//                                           text: nrdlist[index].label,
//                                           textStyle: TextStyle(),
//                                         ),
//                                       ),
//                                     ))
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       }),
//                 ),
//                 if (trailingWidget != null) ...[
//                   Column(
//                     children: trailingWidget,
//                   )
//                 ],
//               ],
//             ),
//           )
//         : Container(
//             width: drawerWidth,
//             height: double.infinity,
//             color: navigationBackGroundColor ?? Theme.of(context).navigationRailTheme.backgroundColor,
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   color: Colors.white,
//                   height: 100.0,
//                   child: DrawerHeader(
//                     margin: EdgeInsets.all(0.0),
//                     padding: EdgeInsets.only(
//                         left: 20.0, top: 10.0, right: 10.0, bottom: 10.0),
//                     decoration: BoxDecoration(
//                       color: navigationBackGroundColor ?? Theme.of(context).navigationRailTheme.backgroundColor,
//                     ),
//                     child: Row(
//                       children: <Widget>[
//                         CircleAvatar(
//                           backgroundImage:
//                               userProfileLink != null && userProfileLink != ""
//                                   ? NetworkImage(userProfileLink)
//                                   : AssetImage(
//                                       "lib/assets/images/amanda_minicucci.jpg",
//                                       package: 'greytrix_ui_kit',
//                                     ),
//                         ),
//                         Expanded(
//                           child: Padding(
//                             padding: EdgeInsets.only(left: 10.0),
//                             child: Align(
//                               alignment: FractionalOffset.centerLeft,
//                               child: GtText(
//                                 text: selectedTitle,
//                                 textStyle: titleTextStyle == null
//                                     ? TextStyle(
//                                         color: selectedTitleColor,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold)
//                                     : titleTextStyle,
//                               ),
//                             ),
//                           ),
//                         ),
//                         selectedTitleChange,
//                       ],
//                     ),
//                   ),
//                 ),
//                 Flexible(
//                     child: ListView.builder(
//                   itemCount: listExpandedItems.length,
//                   itemBuilder: (context, index) {
//                     List<Widget> listWidget = [];
//                     if (listExpandedItems[index]["ChildMenu"] != null) {
//                       listWidget = List<Widget>.generate(
//                         listExpandedItems[index]["ChildMenu"].length,
//                         (i) => Ink(
//                           height: 40,
//                           color: selectedRowColor ??  Theme.of(context).navigationRailTheme.selectedIconTheme.color,
//                           child: ListTile(
//                             leading: GtIcon(
//                               icondata: listExpandedItems[index]["ChildMenu"][i]
//                                           ["IconData"] !=
//                                       null
//                                   ? listExpandedItems[index]["ChildMenu"][i]
//                                       ["IconData"]
//                                   : Icons.home,
//                               color: Theme.of(context).navigationRailTheme.unselectedIconTheme.color,
//                             ),
//                             dense: true,
//                             title: GtText(
//                               text: listExpandedItems[index]["ChildMenu"][i]
//                                           ["Menu"] !=
//                                       null
//                                   ? listExpandedItems[index]["ChildMenu"][i]
//                                       ["Menu"]
//                                   : "Home",
//                               textStyle: TextStyle(
//                                   color: selectedRowColor ??  Theme.of(context)
//                                       .navigationRailTheme
//                                       .selectedIconTheme
//                                       .color, fontSize: 16),
//                             ),
//                             onTap: () {
//                               if (onTapExpanded != null)
//                                 onTapExpanded(listExpandedItems[index]
//                                             ["ChildMenu"][i]["Route"] !=
//                                         null
//                                     ? {
//                                         "Name": listExpandedItems[index]
//                                                 ["ChildMenu"][i]["Menu"]
//                                             .toString(),
//                                         "Route": listExpandedItems[index]
//                                                 ["ChildMenu"][i]["Route"]
//                                             .toString()
//                                       }
//                                     : {"Name": "Home", "Route": "home"});
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                         ),
//                       ).toList();
//                     } else {
//                       listWidget = [
//                         ListTile(
//                           leading: GtIcon(
//                             icondata:
//                                 listExpandedItems[index]["HeaderIcon"] != null
//                                     ? listExpandedItems[index]["HeaderIcon"]
//                                     : Icons.home,
//                             color: selectedRowColor ??  Theme.of(context)
//                                       .navigationRailTheme
//                                       .selectedIconTheme
//                                       .color,
//                           ),
//                           dense: true,
//                           title: GtText(
//                             text: listExpandedItems[index]["HeaderMenu"] != null
//                                 ? listExpandedItems[index]["HeaderMenu"]
//                                 : "Home",
//                             textStyle: TextStyle(
//                                 color: selectedRowColor ??  Theme.of(context)
//                                       .navigationRailTheme
//                                       .selectedIconTheme
//                                       .color, fontSize: 16),
//                           ),
//                           onTap: () {
//                             if (onTapExpanded != null)
//                               onTapExpanded(
//                                   listExpandedItems[index]["Route"] != null
//                                       ? {
//                                           "Name": listExpandedItems[index]
//                                                   ["HeaderMenu"]
//                                               .toString(),
//                                           "Route": listExpandedItems[index]
//                                                   ["Route"]
//                                               .toString()
//                                         }
//                                       : {"Name": "Home", "Route": "home"});
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                       ];
//                     }
//                     return Theme(
//                         data: Theme.of(context)
//                             .copyWith(unselectedWidgetColor: selectedRowColor ??  Theme.of(context)
//                                       .navigationRailTheme
//                                       .selectedIconTheme
//                                       .color),
//                         child: listExpandedItems[index]["ChildMenu"] != null
//                             ? ExpansionTile(
//                                 childrenPadding: EdgeInsets.only(left: 30.0),
//                                 leading: Icon(
//                                   listExpandedItems[index]["HeaderIcon"] != null
//                                       ? listExpandedItems[index]["HeaderIcon"]
//                                       : Icons.home,
//                                   color: selectedRowColor ??  Theme.of(context)
//                                       .navigationRailTheme
//                                       .selectedIconTheme
//                                       .color,
//                                 ),
//                                 title: GtText(
//                                   text: listExpandedItems[index]
//                                               ["HeaderMenu"] !=
//                                           null
//                                       ? listExpandedItems[index]["HeaderMenu"]
//                                       : "Home",
//                                   textStyle: TextStyle(
//                                       color: selectedRowColor ??  Theme.of(context)
//                                       .navigationRailTheme
//                                       .selectedIconTheme
//                                       .color, fontSize: 16),
//                                 ),
//                                 children: <Widget>[...listWidget])
//                             : listWidget[0]);
//                   },
//                 )),
//               ],
//             ),
//           );
//   }
// }