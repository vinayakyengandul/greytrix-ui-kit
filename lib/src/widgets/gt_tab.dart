// import 'package:flutter/material.dart';
// import '../../greytrix_ui_kit.dart';

// class GtTab extends StatelessWidget {
//   GtTab({@required this.headerwidgets,
//   this.selectedColor
//   ,this.unselectedColor,this.itemCount,this.tabWidgets,
//   this.shadowColor});

//   final List<Widget> headerwidgets;

//   final Color selectedColor;
//   final Color unselectedColor;
//   final int itemCount;
//   final List<Map<String,Widget>> tabWidgets;
//   final Color shadowColor;

//   @override
//   Widget build(BuildContext context) {
//     final _formkey = GlobalKey<FormState>();
//     return Form(
//       key: _formkey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children:

//               headerwidgets
//             ,
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 15),
//             child: Container(
//               height: 3 * SizeConfig.heightMultiplier,
//               width: 184.8 * SizeConfig.widthMultiplier,
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: tabWidgets.length,
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, counter) {
//                         return InkWell(
//                           child: Container(
//                             width: 25 * SizeConfig.widthMultiplier,
//                             height: 3 * SizeConfig.heightMultiplier,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(18),
//                                 topLeft: Radius.circular(18),
//                               ),
//                               //Changes Tab color according to selected.
//                               color: counter ==
//                                       controller.customerDetailTabIndex.value
//                                   ? Colors.red.shade100
//                                   : Colors.redAccent,
//                             ),
//                             child: Center(
//                               child: GtText(
//                                 text: controller.customerDetailTab[counter],
//                                 textStyle: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: counter ==
//                                             controller
//                                                 .customerDetailTabIndex.value
//                                         ? Colors.black
//                                         : Colors.white),
//                               ),
//                             ),
//                           ),
//                           splashColor: Colors.white,
//                           onTap: () {

//                           },
//                         );
//                       })
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: Material(
//               elevation: 25,
//               shadowColor: shadowColor,
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(18),
//                 bottomLeft: Radius.circular(18),
//                 bottomRight: Radius.circular(18),
//               ),
//               child: Container(
//                 width: 200 * SizeConfig.widthMultiplier,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(18),
//                     bottomLeft: Radius.circular(18),
//                     bottomRight: Radius.circular(18),
//                   ),
//                 ),
//                 // Changes Screen according to selected tab.
//                 child:

//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
