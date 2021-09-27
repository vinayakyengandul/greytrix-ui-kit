// import 'package:get/get.dart';
// import '../../src/models/themes.dart';
// import '../data/index.dart';

// class UserSettingController extends GetxController with StateMixin<Setting> {
//   UserSettingController({this.userPortalProvider});
//   final UserPortalProvider userPortalProvider;

//   @override
//   void onInit() {
//     print("init UserPortalController controller");
//     super.onInit();
//     fetchSettings();
//   }

//   @override
//   void onClose() {
//     print("closed UserPortalController");
//   }

//   ///IT FETCHES THE TASKS LIST DATA FROM THE API
//   void fetchSettings() async {
//     LanguageModel nameOfLanguage;
//     ThemeType nameOfTheme;
//     userPortalProvider
//         .fetchSettings()
//         .then((settinsRes) => {
//               print('Settings Success response '),
//               print(settinsRes),

//               ///Language Response check to the language list and assign it
//               nameOfLanguage = Get.find<ShellController>().langlist.firstWhere(
//                   (language) => language.name == settinsRes.language,
//                   orElse: () => null),
//               if (nameOfLanguage != null)
//                 {
//                   Get.find<ShellController>().languageselect.value =
//                       nameOfLanguage,
//                 }
//               else
//                 {
//                   Get.find<ShellController>().languageselect.value =
//                       Get.find<ShellController>().langlist.first
//                 },

//               ///Theme Response check to the Theme list and assign it
//               nameOfTheme = ThemeType.values.firstWhere(
//                   (theme) =>
//                       theme
//                           .toString()
//                           .substring(theme.toString().indexOf('.') + 1) ==
//                       settinsRes.theme,
//                   orElse: () => null),
//               if (nameOfTheme != null)
//                 {
//                   Get.find<ShellController>().themingType.value = nameOfTheme,
//                 }
//               else
//                 {
//                   Get.find<ShellController>().themingType.value =
//                       ThemeType.values.first
//                 },

//               ///CHANGING THE CONTROLLER STATUS AND SETTING THE TASKS LIST DATA
//               change(settinsRes, status: RxStatus.success()),
//             })
//         .catchError((e) => {
//               print('Settings error response '),
//               print(e),

//               ///CHANGING THE CONTROLLER STATUS TO ERROR BY PASSING ERROR TEXT
//               change(null, status: RxStatus.error(e.toString())),
//             });
//   }
// }

// class Setting {
//   Setting({
//     this.language,
//     this.theme,
//   });

//   String language;
//   String theme;

//   factory Setting.fromJson(Map<String, dynamic> json) => Setting(
//         language: json["language"] as String,
//         theme: json["theme"] as String,
//       );

//   Map<String, dynamic> toJson() => {
//         "language": language,
//         "theme": theme,
//       };
// }
