// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/settings_controller.dart';
// import '../../src/models/themes.dart';
// import '../widgets/gt_text.dart';
// import '../widgets/gt_icon.dart';
// import '../models/index.dart';

// class GtUserSettingPage extends GetView<UserSettingController> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       child: controller.obx((state) => Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                   padding: const EdgeInsets.all(15),
//                   child: GtText(
//                     text: 'Settings'.tr,
//                     textStyle: TextStyle(color: context.theme.primaryColor),
//                     //texttype: TextformatType.subtitle,
//                   )),
//               Padding(
//                 padding: EdgeInsets.all(5.00),
//                 child: Card(
//                   color: Get.theme.canvasColor,
//                   elevation: 8.0,
//                   margin:
//                       new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5.0)),
//                   child: Container(
//                     // height: 60.0,
//                     padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                     child: Column(
//                       children: [
//                         // ListTile(
//                         //     leading:
//                         Padding(
//                           padding:
//                               EdgeInsets.all(1 * SizeConfig.heightMultiplier),
//                           child: GtText(
//                             text: 'Account Changes'.tr,
//                             textStyle:
//                                 TextStyle(color: context.theme.primaryColor),
//                             //texttype: TextformatType.subtitle,
//                           ),
//                         ),
//                         Divider(
//                           color: context.theme.textTheme.bodyText1.color,
//                           height: 0,
//                           thickness: 1,
//                           endIndent: 0,
//                         ),
//                         ListTile(
//                           title: GtText(
//                             text: "Languages".tr,
//                             textStyle:
//                                 TextStyle(color: context.theme.primaryColor),
//                             //texttype: TextformatType.textwithbold,
//                           ),
//                           leading: GtIcon(
//                             icondata: Icons.language,
//                             color: context.theme.iconTheme.color,
//                           ),
//                           trailing: Container(
//                             child: DropdownButton(
//                               icon: GtIcon(icondata: Icons.arrow_drop_down),
//                               value: Get.find<ShellController>()
//                                   .languageselect
//                                   .value,
//                               items: Get.find<ShellController>()
//                                   .langlist
//                                   .map((LanguageModel lang) {
//                                 return DropdownMenuItem<LanguageModel>(
//                                   value: lang,
//                                   child: GtText(
//                                     text: lang.name,
//                                     textStyle: TextStyle(
//                                         color: context.theme.primaryColor),
//                                     //texttype: TextformatType.textwithbold,
//                                   ),
//                                 );
//                               }).toList(),
//                               onChanged: (value) {
//                                 print(value);
//                                 Get.find<ShellController>().changeLocale(value);
//                               },
//                             ),
//                           ),
//                         ),
//                         Divider(
//                           color: context.theme.textTheme.bodyText1.color,
//                           height: 0,
//                           thickness: 1,
//                           endIndent: 0,
//                         ),

//                         /// TODO : FLOCK_DARK THEME NEEDS TO BE CONFIGURED PROPERLY THROUGHOUT THE APP
//                         Obx(() => ListTile(
//                               leading: GtIcon(
//                                 icondata: Icons.color_lens,
//                                 color: context.theme.iconTheme.color,
//                               ),
//                               title: GtText(
//                                 text: "Themes".tr,
//                                 textStyle: TextStyle(
//                                     color: context.theme.primaryColor),
//                                 //texttype: TextformatType.textwithbold,
//                               ),
//                               trailing: Container(
//                                 child: DropdownButton(
//                                   icon: GtIcon(
//                                     icondata: Icons.arrow_drop_down,
//                                   ),
//                                   value: Get.find<ShellController>()
//                                       .themingType
//                                       .value,
//                                   items:
//                                       ThemeType.values.map((ThemeType theme) {
//                                     return DropdownMenuItem<ThemeType>(
//                                       value: theme,
//                                       child: GtText(
//                                         text: theme
//                                             .toString()
//                                             .substring(
//                                                 theme.toString().indexOf('.') +
//                                                     1)
//                                             .tr,
//                                         textStyle: TextStyle(
//                                             color: context.theme.primaryColor),
//                                         //texttype: TextformatType.textwithbold,
//                                       ),
//                                     );
//                                   }).toList(),
//                                   onChanged: (value) {
//                                     Get.find<ShellController>()
//                                         .changethemedata(value);
//                                   },
//                                 ),
//                               ),
//                             )),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )),
//     );
//   }
// }
