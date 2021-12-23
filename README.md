# greytrix_ui_kit

# Widgets

- [GtText Widget](#gttext-widget)
- [GtIcon Widget](#gticon-widget)
- [GtIconCheckbox Widget](#gticoncheckbox-widget)
- [GtTextFormField Widget](#gttextformfield-widget)
- [GTChip Widget](#gtchip-widget)
- [GtHeader Widget](#gtheader-widget)
- [CustomPopup Widget](#custompopup-widget)
- [GtNavigationRails Widget](#gtnavigationrails-widget)
- [SearchDialog Widget](#searchdialog-widget)
- [GtAppBar Widget](#gtappbar-widget)
- [CoreListView Widget](#corelistview-widget)
- [GtUserMenuBar Widget](#gtusermenubar-widget)
- [GtTab Widget](#gttab-widget)
- [GtBottomBar Widget](#gtbottombar-widget)
- [GtComingSoon Widget](#gtcomingsoon-widget)
- [GtPageNotFound Widget](#gtpagenotfound-widget)
- [GtNoListFound Widget](#gtnolistfound-widget)
- [GtImageCard Widget](#gtimagecard-widget)
- [GtCard Widget](#gtcard-widget)
- [GtDate Widget](#gtdate-widget)
- [GtCalendar Widget](#gtcalendar-widget)
- [GtCurrency Widget](#gtcurrency-widget)
- [GtButton Widget](#gtbutton-widget)
- [GtAppSideBar Widget](#gtappsidebar-widget)
- [GtDynamicView Widget](#gtdynamicview-widget)
- [GtSignature Widget](#gtsignature-widget)
- [GtFileUpload Widget](#gtfileupload-widget)
- [GtTagTextField Widget](#gttagtextfield-widget)
- [GtListPage Widget](#gtlistpage-widget)
- [GtCheckboxFormField Widget](#gtcheckboxformfield-widget)
- [GtDropdownFormField Widget](#gtdropdownformfield-widget)
- [GtRadioButtonFormField Widget](#gtradiobuttonformfield-widget)
- [GtSwitchButtonFormField Widget](#gtswitchbuttonformfield-widget)
- [GtSurveyKit Widget](#gtsurveykit-widget)
- [GtMarquee Widget](#gtmarquee-widget)
- [GtPdfWidget Widget](#gtpdfwidget-widget)
- [GtDropdownSearch Widget](#gtdropdownsearch-widget)
- [GtBackDropListView Widget](#gtbackdroplistview-widget)
- [GtListFilter Widget](#gtlistfilter-widget)

# GtText Widget

The gttext widget is used represent the text on the Screen with alng icons as optional parameter.

- Benefits of GtText Widget
  - Handles the font size of the text in dynamic way based on the screen resolution when specified along with required TextformatType.
- Used the GtTextwidget along textoverflow property.
  TextOverflow - ellipsis,clip,visible,fade
- Also show a icons along with Text.(Optional)
- Constructors:

```
   - [GtText](components.md#gttext-widget)({@required this.text,
                  this.textOverflow,
                  this.textStyle,
                  this.fontFamily,
                  this.iconData,
                  this.iconSize,
                  this.iconColor,
                  this.position = GtPosition.PREFIX,
                  this.textAlign = TextAlign.start,
                  this.maxLines,});
```

- Input Parameters of GtText Widget

  - **text** - String - This is required parameter, it well show text.
  - **textStyle** - TextformatType - It well show text type form TextformatType. Default value is TextformatType.bodytext.
  - **textOverflow** - TextOverflow - How visual overflow should be handled. Types : TextOverflow - ellipsis,clip,visible,fade
  - **fontFamily** - String - Provide a Fontfamily for the text.
  - **iconData** - IconData - Provide icon which is to be displayed with the text.
  - **iconSize** - double - Provide a size for the Icon.
  - **iconColor** - Color - Provide a color for the Icon.
  - **position** - GtPosition - Provide aposition for the icon to be displayed before or after the text.
  - **textAlign** - TextAlign - This is used for Align the text, Default value is TextAlign.start.
  - **maxLines** - int - Text Field define maxline if null its showing default.

- Example

  - Step 1 : Import UI KIT in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtText widget and specify the textformattype for the text which is to be displayed.

  ```dart
        class TextDemo extends StatelessWidget {
           @override
           Widget build(BuildContext context) {
             return Scaffold(
                 appBar: GtAppBar(
                     backgroundColor: Color(0xff5a5278),
                     title: GtText(text: 'Customers')),
                 body: Container(
                   child: GtText(
                     text: 'HR',
                     textStyle: TextStyle(fontSize: 20, color: Colors.grey),
                     iconData: Icons.people_alt_outlined,
                     position: GtPosition.PREFIX,
                   ),
                 ));
           }
        }

  ```

  - Step 3 : Result :

    ![Gtext](https://user-images.githubusercontent.com/47977097/115866662-9d1d8680-a457-11eb-8053-a57d97459961.png)

# GtIcon Widget

The gticon widget is used represent the Icon on the Screen with responsive sizing handle if size and color mentioned in the usage.

- Benefits of GtIcon Widget
  - Handles the icon size of the Icon in dynamic way based on the screen resolution when size is not specified.
  - Also Handles the color as per theme set if color is not specified during the usage.
- Constructors:

```
   - [GtIcon](components.md#gticon-widget)({
      @required this.icondata,
      this.size,
      this.color});
```

- Input Parameters of GtText Widget
  - **icondata** - IconData - The icon to display. The available icons are described in Icons. This is required parameter.
  - **size** - double - The size of the icon in logical pixels. Icons occupy a square with width and height equal to size.
  - **color** - Color - The color to use when drawing the icon. Defaults to the current IconTheme color, if any.
- Example

  - Step 1 : Import core in files that it will be used:

  ```dart
      import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : GtIcon widget can be used as shown in the below example where color and size are the optional Paramters if not specified the widget will handles it with its own creative way.

  ```dart
     class WelcomePage extends StatelessWidget {
       @override
       Widget build(BuildContext context) {
         return Container(
                  child: GtIcon(
                  icondata: Icons.mail_outline,
                  color: Color(0xFF5785f3),
                  size: 20.0,
                    ),
                 );
               }
         }
  ```

  - Step 3 : Result :

    ![image](https://user-images.githubusercontent.com/64594463/103771677-31511280-504e-11eb-94e4-4462565e69ca.png)

# GtIconCheckbox Widget

The GtIconCheckbox widget is combination of Icon and chexbox widget on the Screen specially used for the selection of multiple records in listing screen.

- Benefits of GtIconCheckbox Widget
  - Handles the checbox functionality on the click of the icon (i.e the Icon is displayed initially but when the click / tap event is fired it flips the widget with checkbox.)
  - Best suited to used in the leading parameter fo Listtile Widget.
- Constructors:

```
 - [GtIconCheckbox](components.md#gticoncheckbox-widget){
    @required this.icon,
    this.selected = false,
   @required this.onchanged,
   @required this.backgroundColor,
   this.checkboxcheckColor,
   this.checkboxactiveColor,
   this.checkboxfocusColor,
   this.iconcolor,
   this.iconfocuscolor,});
```

- Input Parameters of GtIconCheckbox Widget

  - **icon** - Icondata - Expects the Icons data which is used to displayed.
  - **selected** - bool - Bool value to flip between the checkbox and Icon widget
  - **onchanged** - Function - Function to that handles the On changed event of both the widgets.
  - **backgroundColor** - Color - This is required parameter this define background color of checkbox.
  - **checkboxcheckColor** - Color - This is check box check color.
  - **checkboxactiveColor** - Color - This is check box active color.
  - **checkboxfocusColor** - Color - This is focus color of check box.
  - **iconcolor** - Color - This is Color of icon.
  - **iconfocuscolor** - Color - This is Color of icon focus color.
    Note : The function passed above it is completely handled in the Controller of the widget and it should be the void return type.

- Example

  - Step 1 : Import core in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : GtIconCheckbox widget can be used as shown in the below example.

  ```dart
     class CustomerList extends StatelessWidget {
           bool isSelected = false;
         @override
               Widget build(BuildContext context) {
                  return Container(
                       child: ListTile(
                       title: GtText(
                         text: 'Paul Walker',
                         texttype: TextformatType.listitemkey,
                         textOverflow: TextOverflow.ellipsis,
                       ),
                       subtitle:
                           GtText(text: "USA", texttype: TextformatType.listitem),
                       leading: GtIconCheckbox(
                         icon: Icons.account_circle,
                         selected: isSelected,
                         onchanged: (value) => checkitem(value),
                         backgroundColor: Colors.white,
                       ),
                       trailing: GtIcon(
                         icondata: Icons.arrow_forward_ios_rounded,
                       ),
                     ));
                   }
              void checkitem(value) {
                  isSelected = value;
               }}


  ```

  - Step 3 : Result :
    ![image](https://user-images.githubusercontent.com/64594463/103772299-4e3a1580-504f-11eb-940d-2e116862f956.png)

# GtTextFormField Widget

The gttextformfield widget is used represent the text form field on the Screen with responsive sizing handle by the core package.

- Benefits of GtTextFormField Widget
  - Handles the font size of the text field in dynamic way based on the screen resolution.
  - GtTextFormField theme handles the ThemeData we don`t have to provide theme in GtTextFromField.
- Constructors:

```
   - [GtTextFormField](components.md#gttextformfield-widget)({
         @required this.fieldLabel,
         this.maxLength = 1000,
         this.maxLines = 1,
         this.minLines = 1,
         this.isReadOnly = false,
         this.textEditingController,
         this.textInputType = TextInputType.text,
         this.isRequired = false,
         this.onChangeHandler,
         this.padding = const EdgeInsets.all(0.0),
         this.obscureText = false,
         this.onSaveHandler,
         this.chips,
         this.prefixIcon,
         this.labeltextStyle,
         this.textStyle,
         this.onTapHandler,
         this.inputDecoration,
         this.boxDecoration,
         this.validationHandler,
         this.focusNode});
```

- Input Parameters of GtTextFormField Widget
  - **fieldLabel** - String - This is required parameter, it well show field label name.
  - **maxLength** - int - It shows max length of text field and its default max length is 1000.
  - **maxLines** - int - It show max lines of text field and its default max line is 1.
  - **minLines** - int - It show min lines of text field and its default min line is 1.
  - **isReadOnly** - bool - When this is set to true, the text cannot be modified by any shortcut or keyboard operation. The text is still selectable. Defaults to false. Must not be null.
  - **textEditingController** - TextEditingController - Controls the text being edited. If null, this widget will create its own TextEditingController and initialize its TextEditingController.text with initialValue.
  - **textInputType** - TextInputType - This parameter is used to text input type, Defualt type was TextInputType.text.
  - **isRequired** - bool - It contains Field is Required or not, if isRequired is true than we have to Enter the value in text field. Default is false.
  - **padding** - EdgeInsets - This gives padding to text fields and its default value is const EdgeInsets.all(0.0).
  - **obscureText** - bool - Whether to hide the text being edited (e.g., for passwords). Defaults to false.
  - **onChangeHandler** - Function(dynamic val) - Signature for callbacks that report that an underlying value has changed.
  - **onSaveHandler** - Function(dynamic val) - An optional method to call with the final value when the form is saved.
  - **chips** - Widget - This used for suffixIcons in FormText Field.
  - **prefixIcon** - Icon - This is prefix for TextForm Field.
  - **labeltextStyle** - TextStyle - This is InputDecoration label TextStyle.
  - **textStyle** - TextStyle - This is text style of formField.
  - **onTapHandler** - Function - This is ontap handler used for formField click.
  - **inputDecoration** - InputDecoration - The border, labels, icons, and styles used to decorate a Material Design text field.
  - **boxDecoration** - BoxDecoration - The box has a [border], a body, and may cast a [boxShadow]. The [shape] of the box can be a circle or a rectangle. If it is a rectangle, then the [borderRadius] property controls the roundness of the corners.
  - **validationHandler** - Function(dynamic) - When a [controller] is specified, [initialValue] must be null (the default). If [controller] is null, then a [TextEditingController] will be constructed automatically and its text will be initialized to [initialValue] or the empty string.
  - **focusNode** - FocusNode - To receive key events that focuses on this node, pass a listener to `onKeyEvent`. The `onKey` is a legacy API based on [RawKeyEvent] and will be deprecatedin the future..
- Example

  - Step 1 : Import core in files that it will be used:

  ```dart
      import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtTextFormField widget with spacific fieldLabel name.

  ```dart
         class WelcomePage extends StatelessWidget {
         final TextEditingController usernameTextController = TextEditingController();
            @override
           Widget build(BuildContext context) {
           return Container(
              child: GtTextFormField(
                  fieldLabel: 'Username'.tr,
                  textEditingController: usernameTextController,
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  isRequired: true,
                  isReadOnly: true,
               )
            );
        }
     }
  ```

  - Step 3 : Result :

    ![image](https://user-images.githubusercontent.com/64594463/103736306-fb903780-5015-11eb-94ac-1b7ef800f33f.png)

# GTChip Widget

The gtchip widget is used represent the text in chip on the Screen with responsive sizing handle by the core package.

- Benefits of GTChip Widget
  - Handles the font size of the text in dynamic way based on the screen resolution.
  - Following are the Textformattype supported for GtChip widget text :
    title,
    subtitle,
    phone,
    bodytext,
    greetingtext,
    listitem,
    listitemkey,
    cardtitle,
    email,
    amount,
    button,
  - Used the GTText for text in the chip.
    TextOverflow - ellipsis,clip,visible,fade
- Constructors:

```
    - [GTChip](components.md#gtchip-widget)({
       this.label,
       this.backgroundColor,
       this.textFormatType = TextformatType.subtitle2});
```

- Input Parameters of GTChip Widget
  - **label** - String - The primary content of the GTChip. It shows text in chip.
  - **backgroundColor** - Color - It will use in background color in GtChip widget.
  - **textStyle** - TextStyle - This is text style for chip Text.
  - **avatar** - Widget - This is chip widget avatar.
  - **shapeBorder** - ShapeBorder - Chip Widget shape Border Define.
- Example

  - Step 1 : Import core in files that it will be used:

  ```dart
      import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GTChip widget and specify the textformattype for the text which is to be displayed.

  ```dart
         class WelcomePage extends StatelessWidget {
            @override
           Widget build(BuildContext context) {
           return Container(
           child: GTChip(
                label: 'Chip Demo',
                textFormatType: TextformatType.bodytext),
           );
        }
     }
  ```

  - Step 3 : Result :

    ![image](https://user-images.githubusercontent.com/64594463/103748865-bd514300-502a-11eb-9509-eb7827439137.png)

# GtHeader Widget

The gtheader widget is used represent the ListTile on the Screen with responsive sizing handle in the core package.

- Benefits of GtHeader Widget

  - Handles the font size of the text in dynamic way based on the screen resolution.

- Constructors:

```
   - [GtHeaderWidget](components.md#gtheader-widget)({
      this.listItemsheader,
      this.enableCheckbox = false});
```

- Input Parameters of GtHeaderWidget Widget

  - **listItemsheader** - List<Widget> - Is will contains List of widgets in GtHeaderWidget. Used in ListTile title.
  - **enableCheckbox** - bool - If is true than it shows checkbox widget in ListTile Leading property. default value is false.

- Example

  - Step 1 : Import core in files that it will be used:

  ```dart
      import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtHeader widget input is List of Widgets and Bool.

  ```dart
         class WelcomePage extends StatelessWidget {
            @override
           Widget build(BuildContext context) {
           return Container(
           child: GtHeaderWidget(
                     listItemsheader: [
                       GtText(text: "Header 1",),
                       GtText(text: "Header 2")
                     ],
                     enableCheckbox: true,
               )
           );
        }
     }
  ```

  - Step 3 : Result :
    ![image](https://user-images.githubusercontent.com/64594463/103750941-83ce0700-502d-11eb-9d6d-87e33fc7ea2d.png)

# CustomPopup Widget

The custompopup widget is used represent the dialog on the Screen in the core package.

- Benefits of CustomPopup Widget
  - Handles the font size of the text in dynamic way based on the screen resolution.
- Constructors:

```
      - [CustomPopup](components.md#custompopup-widget)({
         @required this.isItemSelected,
         @required this.items,
         @required this.getOptionText,
         @required this.getAvatarWidgetContent,
         @required this.onTapHandler,
         @required this.showMoreOption,
         @required this.showMoreHandler,
         this.top,
         this.bottom,
         this.left,
         this.right});
```

- Input Parameters of CustomPopup Widget
  - **isItemSelected** - Function(dynamic obj) - This is a method with parameter which is used to value is selected or not. And it is a required parameter. - **items** - List<dynamic> - Used to List of dymanic to Custompopup value. And its required parameter. - **getOptionText** - Function(dynamic obj) - This is a method with parameter. its shows text in each card in CustomPopup. And its required parameter. - **getAvatarWidgetContent** - Function(dynamic obj) - This is a method with parameter. its shows leading text in each card in CustomPopup. And its required parameter. - **onTapHandler** - Function - It Called when the user taps this List tile. - **showMoreOption** - bool - Used for when showMoreOption is true it will show Show More option in CustomPopup Widget. - **showMoreHandler** - Function - This function is used for when user click on showMoreOption it will open all CustomPopup items open in new dialog. - **top** - double - Used for CustomPopup Widget Positioned in top. - **bottom** - double - Used for CustomPopup Widget Positioned in bottom. - **left** - double - Used for CustomPopup Widget Positioned in left. - **right** - double - Used for CustomPopup Widget Positioned in right.
- Example

  - Step 1 : Import core in files that it will be used:

  ```dart
     import 'package:core/core.dart';
  ```

  - Step 2 : Used CustomPopup widget.

  ```dart
         class WelcomePage extends StatelessWidget {
            @override
           Widget build(BuildContext context) {
              var e = ["Popup 1" , "Popup 2", "Popup 3"];
           return Container(
           child: CustomPopup(
                      top: 5.0,
                      left: 5.0,
                      isItemSelected: (e) =>
                      "Popup 1" == e,
                      items: e,
                      showMoreOption: e.length > 3,
                      getOptionText: (e) => '${e}'.tr,
                      getAvatarWidgetContent: (e) => Text(
                        '${e.toString().substring(0,1)}',
                        style: TextStyle(
                            color: "Popup 1" == e
                                ? context.theme.colorScheme.onPrimary
                                : context.theme.colorScheme.primary),
                      ),
                      onTapHandler: (e) => {},
                      showMoreHandler: () => {
                      },
                    ),
           );
        }
     }
  ```

  - Step 3 : Result :
    ![image](https://user-images.githubusercontent.com/64594463/103757929-7fa6e700-5037-11eb-947d-539203681cc4.png)

# GtNavigationRails Widget

The gtnavigationrails widget is used represent the NavigationRail on the Screen with responsive sizing handle in the core package.

- Benefits of GtNavigationRails Widget

  - Handles the font size of the text in dynamic way based on the screen resolution.
  - GtNavigationRails widget theme handles by ThemeData.

- Constructors:

```
   - [GtNavigationRails](components.md#gtnavigationrails-widget)({this.nrdlist,
       this.selectedindex, this.setindex, this.isShowLable = true, this.trailing, this.navigationBackGroundColor,
      this.selectedRowColor,
      this.selectedRowDarkColor,
      this.iconColor,
      this.onHoverHandler,
      this.onHover,
      this.selectedTitle = "",
      this.selectedTitleColor,
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
      this.titleTextStyle,});
```

- Input Parameters of GtNavigationRails Widget
  - **nrdlist** - List<Rails> - Defines the appearance of the button items that are arrayed within the navigation rail. The value must be a list of two or more.
  - **selectedindex** - selectedindex - The index into destinations for the current selected NavigationRailDestination.
  - **setindex** - Function - Called when one of the destinations is selected.
  - **isShowLable** - bool - Defines the layout and behavior of the labels for the default, unextended NavigationRail. When a navigation rail is extended, the labels are always shown.
  - **trailingWidget** - List<Widget> - The trailing List of widget is placed bottom of the rails last NavigationRailDestination. It's location is affected by groupAlignment.
  - **navigationBackGroundColor** - Color - Navigation Drawer background color.
  - **selectedRowColor** - Color - This is selected row color defines.
  - **selectedRowDarkColor** - Color - This is selected dark color Defines.
  - **iconColor** - Color - This Defines the Icon Color in rails.
  - **onHoverHandler** - Function - Rails on hover function.
  - **onHover** - int - Index of hover in rails.
  - **selectedTitle** - String - This is selected rails String value.
  - **selectedTitleColor** - Color - Selected Tile Color defines.
  - **selectedTitleChange** - Widget - Selected tile on change Function in rails.
  - **selectedTitleOnTap** - Function - on Tap function of Tile Selected.
  - **drawerWidth** - double - This is drawer widgth defines, defualt is 200.
  - **railIconSize** - double - This defines the icon size of rails.
  - **svgheight** - double - This is height of svg.
  - **svgwidth** - double - This is width of svg.
  - **imageSize** - double - This is size of Image.
  - **isExpandedNavigation** - bool - This is defines type of rails.
  - **userProfileLink** - String - Profile link as string.
  - **listExpandedItems** - List<dynamic> - This is List of Expanded Rails.
  - **onTapExpanded** - Function - On Tap expanded Item Function.
  - **titleTextStyle** - TextStyle - TextStyle of title field.
- Example

  - Step 1 : Import core in files that it will be used:

  ```dart
      import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtNavigationRails widget.

  ```dart
         class WelcomePage extends StatelessWidget {
            @override
           Widget build(BuildContext context) {
             var nrdrails = [
                   Rails(Icons.folder_open, Icons.folder, "Document",
                       "/documents/"), // Roles
                   Rails(Icons.calendar_today_outlined, Icons.today, "Tasks",
                       "/tasks/"),
                   Rails(Icons.settings, Icons.settings, "Settings", "/settings/"),];
           return Container(
           child:  GtNavigationRails(
                 nrdlist: nrdrails,
                 selectedindex: 1,
                 isShowLable: true,
                 trailingWidget: [
                     IconButton(
                       icon: Icon(
                         Icons.logout,
                         color: context.theme.iconTheme.color.withOpacity(0.64),
                       ),
                     ),
                     Text('Log Out',
                         style: TextStyle(
                             color: Color(0xdd000000).withOpacity(0.64),
                             fontSize: context.theme.textTheme.bodyText1.fontSize,
                             fontFamily: AppTheme.defaultFontFamily))
                   ],
                 )
           );
        }
     }
  ```

  - Step 3 : Result (Web/Mobile):
    ![image](https://user-images.githubusercontent.com/64594463/104910165-ee2c6300-59ae-11eb-9283-84c6cac45bfa.png)
    ![image](https://user-images.githubusercontent.com/64594463/104910316-27fd6980-59af-11eb-9936-c8ee69cc66b7.png)

# SearchDialog Widget

The searchdialog widget is used represent the SearchDialog for App and Oragnization when count is more than 3 on the Screen with responsive sizing handle in the core package.

- Benefits of SearchDialog Widget
  - Handles the font size of the text in dynamic way based on the screen resolution.
  - SearchDialog widget theme handles by ThemeData.
- Constructors:

```
   - [SearchDialog](components.md#searchdialog-widget)({
      @required this.isItemSelected,
      @required this.items,
      @required this.getOptionText,
      @required this.getAvatarWidgetContent,
      @required this.onTapHandler,
      @required this.dialogTitle,
      this.searchBox = false,
      this.searchOnChangeHandler,
      this.dialogHeight = 350});
```

- Input Parameters of SearchDialog Widget

  - **isItemSelected** - Function(dynamic obj) - This is a method with parameter which is used to value is selected or not. And it is a required parameter.
  - **items** - Rx<List<dynamic>> - Used to List of dymanic to SearchDialog value. And its required parameter.
  - **getOptionText** - Function(dynamic obj) - This is a method with parameter. its shows text in each card in CustomPopup. And its required parameter.
  - **getAvatarWidgetContent** - Function(dynamic obj) - This is a method with parameter. its shows leading text in each card in CustomPopup. And its required parameter.
  - **onTapHandler** - Function - It Called when the user taps this List tile.
  - **dialogTitle** - String - This contains dialog title text.
  - **searchBox** - bool - This is option for search box is given or not by bool. default is false.
  - **searchOnChangeHandler** - Function - This function is when we search any key in search box that items list is filter by searchOnChangeHandler funation.
  - **dialogHeight** - double - This defines the dialog height. Default height is 350.

- Example

  - Step 1 : Import core in files that it will be used:

  ```dart
     import 'package:core/core.dart';
  ```

  - Step 2 : Used SearchDialog widget.

  ```dart
         class WelcomePage extends StatelessWidget {
       Rx<List<dynamic>> e =  new Rx<List<dynamic>>();
            @override
           Widget build(BuildContext context) {
           e = ["Popup 1" , "Popup 2", "Popup 3", "Popup 4", "Popup 4"];
           return Container(
           child: IconButton(
                  icon: Icon(Icons.more),
                  onPressed: (){
                    Get.dialog(
                      SearchDialog(
                        searchBox: true,
                        dialogTitle: 'Select Organization'.tr,
                        isItemSelected: (e) =>
                        "Popup 1" == e,
                        items: e,
                        getOptionText: (e) => '${e}'.capitalizeFirst,
                        getAvatarWidgetContent: (e) => Icon(
                          Icons.supervised_user_circle,
                          color: "Popup 1" == e
                              ? context.theme.colorScheme.onPrimary
                              : context.theme.primaryColor,
                        ),
                        onTapHandler: (e) => {
                        },
                      ),
                    );
                  },
                ),
           );
        }
     }
  ```

  - Step 3 : Result :
    ![image](https://user-images.githubusercontent.com/64594463/103763437-d9131400-503f-11eb-86e5-511d630b0f19.png)

# GtAppBar Widget

The gtappbar widget is used represent the App Bar on the Screen with responsive sizing handle by the core package.

- Benefits of GtAppBar Widget
  - Handles the font size of the text field in dynamic way based on the screen resolution.
  - GtAppBar theme handles the ThemeData we don`t have to provide theme in GtAppBar.
- Constructors:

```
   - [GtAppBar](components.md#gtappbar-widget)({
      Key key,
      this.primary = true,
      this.leading,
      this.automaticallyImplyLeading = true,this.title,this.actions,this.bottom,
      this.elevation: 0.0,
      this.backgroundColor,
      this.flexibleSpace,});
```

- Input Parameters of GtAppBar Widget
  - **key** - Key - A new widget will only be used to update an existing element if its key is the same as the key of the current widget associated with the element.
  - **primary** - bool - Whether this app bar is being displayed at the top of the screen. Default value is true.
  - **leading** - Widget - A widget to display before the title. Typically the leading widget is an Icon or an IconButton. Becomes the leading component of the NavigationToolbar built by this widget.
  - **automaticallyImplyLeading** - bool - Controls whether we should try to imply the leading widget if null. Default value is true.
  - **title** - Widget - The primary widget displayed in the app bar.
  - **actions** - List<Widget> - Widgets to display in a row after the title widget.
  - **bottom** - PreferredSizeWidget - A size whose height is the sum of toolbarHeight and the bottom widget's preferred height. Scaffold uses this size to set its app bar's height.
  - **elevation** - double - This is app bar border elevation, default is 0.0.
  - **backgroundColor** - Color - This is background color of app bar.
  - **flexibleSpace** - Widget - This is used for gradiant color.
- Example

  - Step 1 : Import core in files that it will be used:

  ```dart
      import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtAppBar widget.

  ```dart
         class WelcomePage extends StatelessWidget {
         final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
         final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
            @override
           Widget build(BuildContext context) {
           return Scaffold(
                  backgroundColor: context.theme.backgroundColor,
                  appBar: GtAppBar(
                    title: const Text('AppBar Demo'),
                    actions: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.add_alert),
                        tooltip: 'Show Snackbar',
                        onPressed: () {
                          scaffoldKey.currentState.showSnackBar(snackBar);
                        },
                      ),
                    ],
                  ),
                  body: const Center(
                     child: Text(
                       'This is the WelcomePage',
                       style: TextStyle(fontSize: 24),
                     ),
                   ),
            );
        }
     }
  ```

  - Step 3 : Result :

    ![image](https://user-images.githubusercontent.com/64594463/104146642-69ab7480-53f1-11eb-8e90-b365ae4e944c.png)

# CoreListView Widget

The corelistview widget is used represent the List View on the Screen with responsive sizing handle by the core package.

- Benefits of CoreListView Widget
  - Handles the font size of the text field in dynamic way based on the screen resolution.
  - CoreListView theme handles the ThemeData we don`t have to provide theme in CoreListView.
  - CoreListView Handle with Controller we also want to pass CoreBinding in CreatePage binding.
- Constructors:

```
   - [CoreListView](components.md#/corelistview-widget)({
      this.title,
      this.toMapjson,
      this.rowsCount = 2,
      this.cardAspectRatio = 1,
      this.viewType = ViewType.list,
      this.leadingIcon,
      this.trailingIcon,
      this.tag,
      this.enablefilter = false,
      this.backNavigation = false,
      this.pathNavigation = "",
      this.isSpaceInRecords = false,
      this.postfixtitleText,
      this.prefixtitleText,
      this.titletextValuePath,
      this.selectAllcheckboxOption = true,});
```

- Input Parameters of CoreListView Widget

  - **title** - String - The contains ListView Title name.
  - **rowsCount** - int - Called to obtain the number of rows to tell the ListView or GridView. Default value is 2.
  - **cardAspectRatio** - double - The ratio of the cross-axis to the main-axis extent of each child. Default value is 1.
  - **viewType** - ViewType (Enum) - This is for how View is showing (both, list, card). If both is selected than we get both view. Default is ViewType.list.
  - **leadingIcon** - IconData - There is only we have to pass IconData that showing in ListView.
  - **trailingIcon** - IconData - There is only we have to pass IconData that showing in ListView.
  - **tag** - String - This String value taken unique Key as defines which View is showing.
  - **enablefilter** - bool - It is used for the filter option, If true we get Filter option in ListView. Default value is false.
  - **backNavigation** - bool - This containes back navigation arrow button for listview, Default value is false.
  - **pathNavigation** - String - It used for navigate form listview record to given navigation path. if children path is "navigation/:id" this have to pass only "navigation/" this.
  - **isSpaceInRecords** - bool - Listview record between space indicate, Default is spacing value is false.
  - **titletextValuePath** - String - When we have to take Listview title from Response, have to pass this value path.
  - **selectAllcheckboxOption** - bool - This show Listview All Select checkBox, Default is true.
  - **prefixtitleText** - String - It`s containe Listview title prefix text.
  - **postfixtitleText** - String - It`s containe Listview title postfix text.
  - **toMapjson** - Map<String, dynamic> - This contains which fields we have to show in ListView of each row. And we used GtTileField widget check below.

    - Constructor of GtTileField

    ```
       - GtTileField({this.row,
          this.mobileRow,
          this.value,
          this.iconData,
          this.flex = 1,
          this.mobileFlex = 1,
          this.textOverFlow,
          this.displayKey = false,
          this.type = GtFieldType.STRING,
          this.webTextFormatType = TextformatType.caption,
          this.mobileTextFormatType = TextformatType.caption,
          this.keyTextFormatType = TextformatType.caption,
          this.isCardTitle = false,
          this.isCardSubTitle = false,
          this.isBannerField = false,
          this.cardRow,
          this.filterType,
          this.filterItems,
          this.valuePath,
          this.filterValue,
          this.filterLabel,
          this.rangeStart,
          this.rangeEnd,
          this.bannerItems});
    ```

    - Input Parameters of GtTileField Widget

      - **row** - int - This is contains which row have to display this field in web.
      - **mobileRow** - int - This is contains which row have to display this field in mobile.
      - **value** - dynamic - This contains value of the field.
      - **iconData** - IconData - Showing Icon start of the field.
      - **flex** - int - The flex factor to use for this child. This is for Web.
      - **mobileFlex** - int - The mobileFlex factor to use for this child. This is for mobile.
      - **textOverFlow** - TextOverflow - Defaults to retrieving the value from the nearest DefaultTextStyle ancestor.
      - **displayKey** - bool - This is for Display field label name, If displaykey is true than field name is showing with value. Default is false.
      - **type** - GtFieldType - Type of field is defines like Enum(STRING,EMAIL,PHONE,CHIP,BANNER,FILTER).
      - **webTextFormatType** - TextformatType - This defines the which text format is taken. Default is TextformatType.caption for web.
      - **mobileTextFormatType** - TextformatType - This defines the which text format is taken. Default is TextformatType.caption for mobile.
      - **keyTextFormatType** - TextformatType - This defines the which text format is taken. Default is TextformatType.caption for label.
      - **isCardTitle** - bool - This contains field is showing in title or not in Card. Default false.
      - **isCardSubTitle** - bool - This contains field is showing in SubTitle or not in Card. Default false.
      - **isBannerField** - bool - This used for A banner displays a prominent message and related field. Default value is false.
      - **cardRow** - int - This is contains which row have to display this field in card.
      - **filterType** - GtFilterType - This field is used for which type is filter like ( RADIO_BUTTON_FILTER, CHECKBOX_BUTTON_FILTER, RANGE_FILTER, SORT_FILTER,)
      - **filterItems** - Map<String, dynamic> - This is Sort the List as per given sort fields. And also Display the fields in UI.
      - **valuePath** - String - This defines the which is Field map with valuePath.
      - **filterValue** - String - This value is send to the API for this field.
      - **filterLabel** - String - It will show in UI in this filter field.
      - **rangeStart**- String - This is Range Start field name.
      - **rangeEnd** - String - This is Range End field name.
      - **bannerItems** - Map<String, dynamic> - It will show banner Items.

- Constructor of CoreBinding:

```
      - [CoreBinding](components.md#/corelistview-widget)({
         this.entityGQL,
         this.nodeName,
         this.isList = false,
         this.headers,
         this.setHeaders,
         this.enableDefaultHeader = false,
         this.tag,this.filterRangePath,
         this.lookupGQL,
         this.addLookupDataGQL,
         this.controllerType = ControllerType.LIST,
         this.addFormGQL,
         this.toMapfilterjson,
         this.valuePath,
         this.inputType = GtListInputType.GRAPHQL,
         this.inputData});
```

- Input Parameters of CoreBinding Widget

  - **entityGQL** - String - This used for query for Listview data fetch from server, this field is mandatory.
  - **nodeName** - String - It indicates unique key for Listview entityname.
  - **headers** - Map<String, dynamic> - When we have to pass headers to API this will be used.
  - **setHeaders** - Function - This will be function to set headers to API.
  - **enableDefaultHeader** - bool - This is indicated for Headers taken or not, If value is true than DefaultHeader will taken. Default value is false.
  - **tag** - String - It is used for when you want multiple different instance of a same Listview must be unique.
  - **filterRangePath** - Map<String, Map<String, String>> - This is Filter used for RangeValues Filter have to pass Response Key will get data.
  - **lookupGQL** - Map<String, String> - It is used for lookUp data have to pass Query in this lookupGQL.
  - **addLookupDataGQL** - Map<String, String> - It is used for add lookUp data have to pass Query in this addLookupDataGQL.
  - **controllerType** - enum {LIST,FORM} - This is indicate to show Listview or Form, Default is LIST.
  - **addFormGQL** - String - This have to add form view pass GQL Query in this.
  - **toMapfilterjson** - Map<String, GtTileField> - It will show Filter Fields In Filter.
  - **valuePath** - String - This used for particular response data have to taken than pass Path of that response.

- Example

  - Step 1 : Import core in files that it will be used:

  ```dart
     import 'package:core/core.dart';
  ```

  - Step 2 : Used CoreListView widget in the Create Page, In CreatePage we have to pass CoreBinding. copy only createPage function.

  ```dart
         createPage("/demo",
             CoreListView(
                  tag: "Demo",
                  title: "Demo",
                  rowsCount: 3,
                  leadingIcon: Icons.account_circle_rounded,
                  trailingIcon: Icons.arrow_forward_ios_rounded,
                  toMapjson: {
                    'DocNo': GtTileField(
                      valuePath: 'DocumentNo',
                      row: 1,
                      mobileRow: 1,
                      cardRow: 1,
                      mobileFlex: 2,
                      isCardTitle: true,
                      type: GtFieldType.STRING,
                      webTextFormatType: TextformatType.headline6,
                    ),
                    'Name': GtTileField(
                      valuePath: 'Customer/Name', // If return single object Customer take value of the object like this Customer/Name
                      row: 2,
                      mobileRow: 2,
                      mobileFlex: 2,
                      cardRow: 1,
                      isCardSubTitle: true,
                      type: GtFieldType.STRING,
                      webTextFormatType: TextformatType.bodyText1,
                    ),
                    "Status": GtTileField(
                                valuePath: "DeliveryStatus",
                                bannerItems: {'Delivered': 'Delivered', 'NotDelivered': 'NotDelivered', 'PartiallyDelivered' : 'PartiallyDelivered'},
                                isBannerField: true,
                              ),
                    "StatusFilter": GtTileField(
                                valuePath: "Status",
                                type: GtFieldType.FILTER,
                                filterType: GtFilterType.RADIO_BUTTON_FILTER,
                                filterItems: {'All': null, 'Delivered': "Delivered", 'NotDelivered': "NotDelivered","PartiallyDelivered":"PartiallyDelivered"},
                                filterValue: 'deliveryStatus',
                                filterLabel: 'Status',
                              ),
                    "SortFilter": GtTileField(
                        filterLabel: "Sort By Field",
                        type: GtFieldType.FILTER,
                        filterType: GtFilterType.SORT_FILTER,
                        filterItems: {
                          'DocumentNo': 'DocumentNo',
                        },
                        filterValue: 'sortField'
                    ),
                  },
                  viewType: ViewType.both,
                  enablefilter: true,
                ),
             binding: [
                     CoreBinding(
                         entityGQL: CustomerOrdersGQL.ORDER_GQL_QUERY, // Pass your GQL
                         isList: true,
                         nodeName: "demo",
                         tag: "demo",
                         enableDefaultHeader: true,),
                   ]
             )

         class CustomerOrdersGQL {
           static const ORDER_GQL_QUERY = '''
                 query(
                   \$limit: Int
                   \$offset: Int
                   \$sort: sortEnumType
                   \$sortField: String
                   \$deliveryStatus: OrderDeliveryStatusEnumType
                 ) {
                   orders: orders(
                     limit: \$limit
                     offset: \$offset
                     sort: \$sort
                     sortField: \$sortField
                     deliveryStatus: \$deliveryStatus
                   ) {
                     DocumentNo
                     DeliveryStatus
                     Customer {
                       Name
                     }
                   }
                 }
               ''';
  }
  ```

  - Step 3 : Result :
    - List View
      ![image](https://user-images.githubusercontent.com/64594463/104177057-33d8b100-542e-11eb-9fd7-e2859a752da3.png)
    - List View With Filter
      ![image](https://user-images.githubusercontent.com/64594463/104183583-2e806400-5438-11eb-9b1e-16c703747d05.png)
    - Card View With Filter
      ![image](https://user-images.githubusercontent.com/64594463/104187331-a1400e00-543d-11eb-8a3b-049495a43509.png)

# GtUserMenuBar Widget

The GtUserMenuBar widget is used represent the user menu on the Appbar along with other icons options for actions and also used for user profile landing UI.

- Benefits of GtUserMenuBar Widget
  - Handles the handles both Asset and Network image support User Image.
  - Allows to provide more options along woth user profile Avatar for actions.
- Constructors:

```
       - [GtUserMenuBar](components.md#gtusermenubar-widget)(
   {this.userImage,
   this.greetingText,
   this.greetingTextStyle,
   @required this.userName,
   this.userNameTextStyle,
   this.iconWidgets,
   this.leadingOnTap,
   this.leadingAvatar = true});
```

- Input Parameters of GtUserMenuBar Widget
  - **userImage** - dynamic - It is type of dynamic to support Asset and Network Image for User profile image.
  - **greetingText** - String - Provide a greeting text to be displayed.
  - **greetingTextStyle** - TextStyle - Provide a TextStyle for the Greeting Text.
  - **userName** - String - Provide a userName text to be displayed.
  - **userNameTextStyle** - TextStyle - This is use for text font which we have to take.
  - **iconWidgets** - List<Widget> - Provide a List of Icons Widgets to displayed along with user details along with its on click handling.
  - **leadingOnTap** - Function - Provide a function to perform some action on the click event of the UserImage.
  - **leadingAvatar** - bool - To show the leading Avatar before the Username.
- Example

  - Step 1 : Import UI kit in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtUserMenuBar widget and specify the color for the text which is to be displayed.

  ```dart
         class Menu extends StatelessWidget {
         @override
        Widget build(BuildContext context) {
           return Scaffold(
              appBar: GtAppBar(
                 backgroundColor: Color(0xff5a5278),
                 title: GtUserMenuBar(
                 userName: "Sara",
                    userNameTextStyle: TextStyle(
                 color: Color.fromRGBO(152, 156, 173, 1),
              fontWeight: FontWeight.bold),
              iconWidgets: [
              IconButton(
              icon: Icon(Icons.notifications_rounded), onPressed: () => {})
              ],
         ),
      ),
              body: Container()
     );
        }
       }
  ```

  - Step 3 : Result :
    ![GtuserMenu](https://user-images.githubusercontent.com/47977097/115863898-c20ffa80-a453-11eb-9c32-c6b4935b105b.png)

# GtTab Widget

The GtTab widget is used represent the UI with Customs Tabs .

- Benefits of GtTab Widget
  - Handles the tabs using Page Controller.
  - Provide the transition for the tab change event.
- Constructors:

```
       - [GtTab](components.md#gttab-widget)(
            {@required this.tabPages,
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
      });
```

- Input Parameters of GtTab Widget
  - **tabPages** - List<Widget> - Provide the Tabpages/Content of tab displayed for each each tab in list of Widgets
  - **tablist** - List<String> - Provide tabs list of titles to be displayed for the tabPages.
  - **pageController** - PageController - Provide a page Controller for handling the transition of tabs/page.
  - **selectedColor** - Color - Provide a color to be displayed for selected tab.
  - **unselectedColor** - Color - Provide a color to be displayed for unselected tab.
  - **selectedTab** - int - Provide a initial select default index which can used in handling the selection of page/tab.
  - **onPressed** - Function - Provide a function to perform some action on the click event of the tabs based on the above selectedTab parameter.
  - **tabcontroller** - ScrollController - This controller used for scroll the tab automaticlly.
  - **selectedTextStyle** - TextStyle - Selected Text Style.
  - **unselectedTextStyle** - TextStyle - UnSelected Text Style.
  - **isTophighlighted** - bool - This is selected highlighted color.
- Example

  - Step 1 : Import UI kit in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtTab widget as shown below example.

  ```dart
         class Tab extends StatelessWidget {
           int selectedTab = 0;
           final PageController pageController = new PageController();

        @override
        Widget build(BuildContext context) {
          return Scaffold(
              appBar: GtAppBar(
                backgroundColor: Color(0xff5a5278),
                title: GtUserMenuBar(
                  userName: "Sara",
                  userNameTextStyle: TextStyle(
                      color: Color.fromRGBO(152, 156, 173, 1),
                      fontWeight: FontWeight.bold),
                  iconWidgets: [
                    IconButton(
                        icon: Icon(Icons.notifications_rounded), onPressed: () => {})
                  ],
                ),
              ),
              body: Container(
                child: GtTab(
                  pageController: pageController,
                  selectedTab: selectedTab,
                  onPressed: (index) => {
                    selectedTab = index,
                    pageController.animateToPage(index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.fastLinearToSlowEaseIn)
                  },
                  tabPages: [
                    Container(
                      child: GtText(
                        text: 'Page 1',
                      ),
                    ),
                    Container(
                      child: GtText(
                        text: 'Page 2',
                      ),
                    ),
                    Container(
                      child: GtText(
                        text: 'Page 3',
                      ),
                    )
                  ],
                  tablist: ['Holidays', 'Leave', 'HR'],
                ),
              ));
           }
        }

  ```

  - Step 3 : Result :
    ![tabmenu](https://user-images.githubusercontent.com/47977097/115863830-a7d61c80-a453-11eb-9716-0c132d38858a.png)

# GtBottomBar Widget

The GtBottomBar widget is used represent the UI with bottom navigation bar with mutiple options.

- Benefits of GtBottomBar Widget
  - For ease use of bottomNavigationbar with default handling for colors..
- Constructors:

```
       - [GtBottomBar](components.md#gtbottombar-widget)(
         {@required this.bottombarItems,
         this.selectedIconThemedata,
         this.unselectedIconThemedata,
         this.backgroundColor,
         this.showSelectedLabels = false,
         this.showUnselectedLabels = false,
         this.bartype = BottomNavigationBarType.fixed,
         this.onTaphandler,
         this.elevation,
         this.selectedItemColor,
         this.unselectedItemColor,
         this.iconsSize,});
```

- Input Parameters of GtBottomBar Widget
  - **bottombarItems** - List<BottomNavigationBarItem> - Provide the list of widgets of BottomNavigationBarItem type.
  - **selectedIconThemedata** - IconThemeData - Provide theme data for selectedIcon to be displayed for the Icon.
  - **unselectedIconThemedata** - IconThemeData - Provide theme data for unselectedIcon to be displayed for the Icon.
  - **backgroundColor** - Color - Provide a color to be displayed for background of bottombar.
  - **showSelectedLabels** - bool - Provide a bool value to whether displayed labels for selected icons.
  - **showUnselectedLabels** - bool - Provide a bool value to whether displayed labels for unselected icons.
  - **bartype** - BottomNavigationBarType - Provide a BottomNavigationBarType for navigationbar type.
  - **onTaphandler** - Function(int) - Provide a function to perform some action on the click event of the bottomnavigationbar.
  - **elevation** - double - Provide a double type value to set the elevation.
  - **selectedItemColor** - Color - Color of selected item text.
  - **unselectedItemColor** - Color - color of Unselected item text.
  - **iconsSize** - double - Size of Icon.
- Example

  - Step 1 : Import UI kit in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtBottomBar widget as shown below example.

  ```dart
         class BottomMenubar extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return Scaffold(
           bottomNavigationBar: GtBottomBar(
             bottombarItems: [
               BottomNavigationBarItem(
                   icon: Icon(Icons.home_filled), label: "Home"),
               BottomNavigationBarItem(icon: Icon(Icons.person), label: "Me"),
               BottomNavigationBarItem(
                   icon: Icon(Icons.directions_walk_outlined), label: "Leave"),
               BottomNavigationBarItem(
                 icon: Icon(Icons.calendar_today),
                 label: "Calendar",
               ),
               BottomNavigationBarItem(
                   icon: Icon(Icons.format_align_right_sharp), label: ""),
               //
             ],
           ),
           appBar: GtAppBar(
               backgroundColor: Color(0xff5a5278),
               title: GtText(text: 'Bottom Bar Demo')),
           body: Container());
     }
  }

  ```

  - Step 3 : Result :
    ![bottombar](https://user-images.githubusercontent.com/47977097/115863804-9ab92d80-a453-11eb-9a15-b6eb705e75f8.png)

# GtComingSoon Widget

The GtComingSoon widget is used represent the UI with Coming Soon widget for upcoming feature or development fo any page.

- Benefits of GtComingSoon Widget
  - Compactible with both mobile/web
    [GtComingSoon](components.md#gtcomingsoon-widget)
- Example

  - Step 1 : Import UI kit in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtComingSoon widget as shown below example.

  ```dart
        class Dashboard extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
          return Scaffold(
              appBar: GtAppBar(
                  backgroundColor: Color(0xff5a5278),
                  title: GtText(text: ' Dashboard')),
              body: Container(
                child: GtComingSoon(),
              ));
        }
     }

  ```

  - Step 3 : Result :
    ![gtComingSoon](https://user-images.githubusercontent.com/47977097/115863738-82491300-a453-11eb-9082-97eece67c0cb.png)

# GtPageNotFound Widget

The GtPageNotFound widget is used represent the UI with Page not found widget for incorrect or restricted routes .

- Benefits of GtPageNotFound Widget
  - Compactible with both mobile/web

[GtPageNotFound](components.md#gtpagenotfound-widget)

- Example

  - Step 1 : Import UI kit in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtPageNotFound widget as shown below example.

  ```dart
        class Dashboard extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
          return Scaffold(
              appBar: GtAppBar(
                  backgroundColor: Color(0xff5a5278),
                  title: GtText(text: 'Dashboard')),
              body: Container(
                child: GtPageNotFound(),
              ));
        }
     }

  ```

  - Step 3 : Result :

           ![PageNotFound](https://user-images.githubusercontent.com/47977097/115863634-5f1e6380-a453-11eb-83d7-1579f23c8877.png)

# GtNoListFound Widget

The GtNoListFound widget is used represent the UI with not data found widget for no records or data is not available.

- Benefits of GtNoListFound Widget
  - Compactible with both mobile/web

[GtNoListFound](components.md#gtnolistfound-widget)

- Example

  - Step 1 : Import UI kit in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtNoListFound widget as shown below example.

  ```dart
        class ListPage extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
          return Scaffold(
              appBar: GtAppBar(
                  backgroundColor: Color(0xff5a5278),
                  title: GtText(text: 'Customers')),
              body: Container(
                child: GtNoListFound(),
              ));
        }
     }

  ```

  - Step 3 : Result :
    ![image](https://user-images.githubusercontent.com/47977097/115865008-5890eb80-a455-11eb-97a7-baa7b75d613d.png)

# GtImageCard Widget

The GtImageCard widget is used represent the UI with card to display a image.

- Benefits of GtImageCard Widget
  - For ease use of Image to display image with with default image handler.
  - Supports both network images and handle with asset image with image not found.
- Constructors:

```
       - [GtImageCard](components.md#gtimagecard-widget)(
         {  this.boxFit = BoxFit.fill,
            this.imageURL,
            this.backgroundcolor,
            this.height,
            this.width,
            this.isNetworkImage = true,
            this.isSvgImage = false
                });
```

- Input Parameters of GtImageCard Widget
  - **boxFit** - BoxFit - Provide the list of widgets of BottomNavigationBarItem type.
  - **imageURL** - String - Provide theme data for unselectedIcon to be displayed for the Icon.
  - **backgroundcolor** - Color - Provide a color to be displayed for background of bottombar.
  - **height** - double - Provide a bool value to whether displayed labels for selected icons.
  - **width** - double - Provide a bool value to whether displayed labels for unselected icons.
  - **isNetworkImage** - bool - This is define image link is local or network.
  - **isSvgImage** - bool - This is define image is svg or not.
- Example

  - Step 1 : Import UI kit in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtImageCard widget as shown below example.

  ```dart
         class BottomMenubar extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return Scaffold(
           bottomNavigationBar: GtBottomBar(
             bottombarItems: [
               BottomNavigationBarItem(
                   icon: Icon(Icons.home_filled), label: "Home"),
               BottomNavigationBarItem(icon: Icon(Icons.person), label: "Me"),
               BottomNavigationBarItem(
                   icon: Icon(Icons.directions_walk_outlined), label: "Leave"),
               BottomNavigationBarItem(
                 icon: Icon(Icons.calendar_today),
                 label: "Calendar",
               ),
               BottomNavigationBarItem(
                   icon: Icon(Icons.format_align_right_sharp), label: ""),
               //
             ],
           ),
           appBar: GtAppBar(
               backgroundColor: Color(0xff5a5278),
               title: GtText(text: 'Bottom Bar Demo')),
           body: Container());
     }
  }

  ```

  - Step 3 : Result :
    ![image](https://user-images.githubusercontent.com/64594463/103752016-276be700-502f-11eb-958b-e2515129cc34.png)

# GtCard Widget

The GtCard widget is used represent the UI with bottom navigation bar with mutiple options.

- Benefits of GtCard Widget
  - For ease use of GtCard with default handling for colors..
- Constructors:

```
       - [GtCard](components.md#gtimagecard-widget)(
         {  this.cardColor,
            this.shadowColor,
            this.shape,
            this.elevation,
            this.label,
            this.imageURL,
            this.cardheight,
            this.cardwidth,
            this.imageWidth,
            this.imageheight,
            this.boxFit,
            this.textStyle,
            this.imagePosition = GtImagePosition.TOP,
            this.imageBackgroundColor,
            this.isNetworkImage,
            this.cardRadius,
            this.textPadding = 2.0,
                         });
```

- Input Parameters of GtCard Widget
  - **cardColor** - Color - Sets a color for the card.
  - **shadowColor** - Color - Sets a shadow color for the card .
  - **label** - String - Sets the text/label below the image.
  - **shape** - ShapeBorder - Sets the shape of the card.
  - **elevation** - double - Sets the elevation of the card.
  - **imageURL** - dynamic - Sets the ImageURL for netwoek Image or Asset
  - **cardwidth** - double - Sets the width of the card.
  - **cardheight** - double - Sets the height of the card.
  - **imageWidth** - double - Sets the width of the image.
  - **imageheight** - double - Sets the height of the image.
  - **boxFit** - BoxFit - Sets filling type of the image i.e contains,fill,etc.
  - **textStyle** - TextStyle - Sets the textstyle for the label.
  - **imagePosition** - GtImagePosition - This Defines the Position of the Image where it should be shown in the Card.
  - **imageBackgroundColor** - Color - Image Background color.
  - **isNetworkImage** - bool - Image from network or local define.
  - **cardRadius** - double - Card Redius define.
  - **textPadding** - double - padding of text.
- Example

  - Step 1 : Import UI kit in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtCard widget as shown below example.

  ```dart
         class CardDemo extends StatelessWidget {
              @override
              Widget build(BuildContext context) {
                return Scaffold(
                    appBar: GtAppBar(
                        backgroundColor: Color(0xff5a5278),
                        title: GtText(text: 'Card Demo')),
                    body: Container(
                        child: GtCard(
                      cardheight: 150,
                      cardwidth: 150,
                      boxFit: BoxFit.fill,
                      imageWidth: 90,
                      imageheight: 100,
                      label: 'Product',
                    )));
              }
           }

  ```

  - Step 3 : Result :
    ![gtcard](https://user-images.githubusercontent.com/47977097/115863522-31d1b580-a453-11eb-966c-77b83ef900cc.png)

# GtDate Widget

The GtDate widget is used represent the UI with date and time widget.

- Benefits of GtDate Widget
  - Supports both date and time.
  - Widget can be optional based requirement - Either Date or time or Both.
- Constructors:

```
       - [GtDate](components.md#gtdate-widget)(
         {  this.type = GtDateTimeType.BOTH,
            @required this.label,
            @required this.initialDate,
            this.firstDate,
            this.lastDate,
            this.prefixIcon = Icons.calendar_today,
            this.isRequired = false,
            this.onDateSubmitted,
            this.onSaveHandler,
            this.dateTextEditingController,
            this.timeTextEditingController,
            this.datePickerEntryMode = DatePickerEntryMode.calendar,
            this.initialEntryMode = DatePickerMode.day,
            this.labeltextStyle,
            this.themeData,
            this.datefieldLabel = "",
            this.timefieldLabel = "",
            this.datetextStyle,
            this.timetextStyle,
            this.cancelText,
            this.confirmText,
            this.iconColor = Colors.black,
            this.selectedTextStyle,
            this.prefixTimeIcon,
            this.suffixDateIcon,
            this.suffixTimeIcon,
            this.isReadOnly = false,
            this.dateFormat = "yyyy-MM-dd"
                         });
```

- Input Parameters of GtDate Widget
  - **type** - GtDateTimeType - Sets a type for the widget to show either date/time or both.
  - **label** - String - Sets a label for the widget.
  - **initialDate** - DateTime - Sets the initial date before the widget to displayed when widget is opened.
  - **firstDate** - DateTime - Sets the min date range of the calendar.
  - **lastDate** - DateTime - Sets the max date range of the calendar.
  - **prefixIcon** - Icon - Sets the ImageURL for netwoek Image or Asset
  - **onDateSubmitted** - Function(dynamic val, GtDateTimeType type, dynamic date) - Sets the width of the card.
  - **onSaveHandler** - Function(dynamic val, GtDateTimeType type) - Sets the height of the card.
  - **dateTextEditingController** - TextEditingController - To handle the textfield for date.
  - **timeTextEditingController** - TextEditingController - To handle the textfield for time.
  - **datePickerEntryMode** - DatePickerEntryMode - Sets datepickerentry mode i.e calendar or input.
  - **initialEntryMode** - DatePickerMode - Sets the DatePickerMode i.e year or month.
  - **labeltextStyle** -TextStyle - This is TextStyle of label String.
  - **themeData** - ThemeData - This is used for widget theme.
  - **datefieldLabel** - String - Label of date field in widget.
  - **timefieldLabel** - String - This is Field label of time.
  - **datetextStyle** - TextStyle - This is used for date text style.
  - **timetextStyle** - TextStyle - This is used for time text style.
  - **cancelText** - String - This is used for cancel Text String.
  - **confirmText** - String - This is used for confirmText.
  - **iconColor** - Color - this is color of icons.
  - **selectedTextStyle** - TextStyle - This is selected date TextStyle.
  - **prefixTimeIcon** - Icon - This is Prefix icon for time.
  - **suffixDateIcon** - Icon - This is suffix icon for date.
  - **suffixTimeIcon** - Icon - This is suffix icon for time.
  - **isReadOnly** - bool - Field is write or readable.
  - **dateFormat** - String - Date format in string, default is "yyyy-MM-dd".
- Example

  - Step 1 : Import UI kit in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtDate widget as shown below example.

  ```dart
         class DateDemo extends StatelessWidget {
              @override
              Widget build(BuildContext context) {
                return Scaffold(
                    appBar: GtAppBar(
                        backgroundColor: Color(0xff5a5278),
                        title: GtText(text: 'Date Demo')),
                    body: Container(
                      child: GtDate(
                        initialDate: DateTime.now(),
                        type: GtDateTimeType.DATE,
                        datePickerEntryMode: DatePickerEntryMode.calendar,
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2100),
                      ),
                    ));
                 }
           }

  ```

  - Step 3 : Result :
    ![gtdate](https://user-images.githubusercontent.com/47977097/115863275-dd2e3a80-a452-11eb-9980-a3ee1d82b1ca.png)
    ![time](https://user-images.githubusercontent.com/47977097/115863484-22526c80-a453-11eb-860e-2e0d0bc61b2e.png)

# GtCalendar Widget

The GtCalendar widget is used represent the UI with calendar widget.

- Benefits of GtCalendar Widget
  - Supports both date and time.
  - Widget can be optional based requirement - Either Date or time or Both.
- Constructors:

```
       - [GtCalendar](components.md#gtcalendar-widget)(
         {   @required this.focusedDay,
               @required this.firstDate,
               @required this.lastDate,
               @required this.selectedDay,
               this.rangeEndDay,
               this.rangeStartDay,
               this.calendarFormat,
               this.rangeSelectionMode,
               this.eventLoader,
               this.calendarStyle,
               this.calendarBuilders,
               this.onDaySelected,
               this.onRangeSelected,
               this.onFormatChanged,
               this.onPageChanged,
                         });
```

- Input Parameters of GtCalendar Widget
  - **focusedDay** - DateTime - Sets the initial date before the widget to displayed when widget is opened.
  - **firstDate** - DateTime - Sets the min date range of the calendar.
  - **lastDate** - DateTime - Sets the max date range of the calendar.
  - **selectedDay** - DateTime - Sets the selected Day.
  - **rangeEndDay** - DateTime - Sets The range of end Day.
  - **rangeStartDay** - DateTime - Sets The range of start Day.
  - **calendarFormat** - CalendarFormat - This is calenderFormat define.
  - **rangeSelectionMode** - RangeSelectionMode - this is Selected the range mode.
  - **eventLoader** - List<CalendarEvent> Function(DateTime) - This is date events define in calender.
  - **calendarStyle** - CalendarStyle - Style of calendar to display in UI.
  - **calendarBuilders** - CalendarBuilders<CalendarEvent> - This is calender builder ised for build calender.
  - **onDaySelected** - Function(DateTime, DateTime) - This is selection of onDay function.
  - **onRangeSelected** - Function(DateTime, DateTime, DateTime) - This is range selected on calender.
  - **onFormatChanged** - Function(CalendarFormat) - This is changed the formate of calender.
  - **onPageChanged** - Function(DateTime) - This is function used for page on change.
- Example

  - Step 1 : Import UI kit in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtCalendar widget as shown below example.

  ```dart
         class CalendarDemo extends StatelessWidget {
              @override
              Widget build(BuildContext context) {
                return Scaffold(
                    appBar: GtAppBar(
                        backgroundColor: Color(0xff5a5278),
                        title: GtText(text: 'Calendar Demo')),
                    body: Container(
                        child: GtCalendar(
                      firstDate: DateTime(1900),
                      initialDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    )));
              }
           }

  ```

  - Step 3 : Result :
    ![calendar](https://user-images.githubusercontent.com/47977097/115863209-c7207a00-a452-11eb-80e2-9d0a4ec664f7.png)

# GtCurrency Widget

The GtCurrency widget is used represent the values figure/amount related data.

- Benefits of GtCurrency Widget
  - Provided the option append the currenct with the data.
  - More properties/options are available to make widget pretty good.
- Constructors:

```
       - [GtCurrency](components.md#gtcurrency-widget)(
         {  this.amount,
            this.label,
            this.currency,
            this.labelTextStyle,
            this.amountTextStyle,
            this.horizontalView = false
                         });
```

- Input Parameters of GtCurrency Widget
  - **amount** - String - Sets the initial date before the widget to displayed when widget is opened.
  - **currency** - String - Sets the min date range of the calendar.
  - **labelTextStyle** - TextStyle - Sets the max date range of the calendar.
  - **amountTextStyle** - TextStyle - Function to handle Onch-
  - **horizontalView** - bool - Decide the position of label.
- Example

  - Step 1 : Import UI kit in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtCurrency widget as shown below example.

  ```dart
         class CurrencyDemo extends StatelessWidget {
              @override
              Widget build(BuildContext context) {
                return Scaffold(
                    appBar: GtAppBar(
                        backgroundColor: Color(0xff5a5278),
                        title: GtText(text: 'Calendar Demo')),
                    body: Container(
                      padding: EdgeInsets.all(10.0),
                      child: GtCurrency(
                        label: 'Balance',
                        amount: '102,445.798',
                        currency: '\$',
                        horizontalView: true,
                      ),
                    ));
                 }
           }

  ```

  - Step 3 : Result :
    ![image](https://user-images.githubusercontent.com/47977097/115865502-09978600-a456-11eb-8be0-25218a464cab.png)

# GtButton Widget

The GtButton widget is used represent the button with multiple functionality of buttons in single widget.

- Benefits of GtButton Widget
  - Button can be Normal and styled button along with Icon as optional parameter.
  - Button can be radio button with required properties.
  - Button can also b image button with error handling of the image.
- Constructors:

```
       - [GtButton](components.md#gtbutton-widget)(
         {  this.buttonStyle,
            this.iconColor,
            this.iconPosition,
            this.iconSize,
            this.icondata,
            this.onPressed,
            this.text,
            this.textStyle,
            this.buttonType = GtButtonType.BUTTON,
            this.value,
            this.groupValue,
            this.onChanged,
            this.toggleable = false,
            this.activeColor,
            this.autofocus = false,
            this.imagebackgroundcolor,
            this.imageboxFit,
            this.imageheight,
            this.imageURL,
            this.imageonClick,
            this.imagewidth,
             this.borderRadius,
            this.color,
            this.disabledColor,
            this.padding,
                         });
```

- Input Parameters of GtButton Widget
  - **buttonStyle** - ButtonStyle - Sets the initial date before the widget to displayed when
  - **iconColor** - Color - Sets the min date range of the calendar.
  - **iconPosition** - TextStyle - Sets the max date range of the calendar.
  - **iconSize** - TextStyle - Function to handle Onch-
  - **icondata** - IconData - Set the icon based provided icon data.
  - **onPressed** - Function - Function to call events on pressed event of the button.
  - **text** - String - Text to be display as label of the button
  - **textStyle** - TextStyle - TextStyle for the label text.
  - **buttonType** - GtButtonType - Identifier to set the required typr of button.
  - **value** - dynamic - To set the value for radio button.
  - **groupValue** - dynamic - To set the value for the radio button.
  - **onChanged** - Function - Function to perform actions on changed event of the radio button.
  - **toggleable** - bool - To toggle the widget behaviour based on bool value.
  - **activeColor** - Color - Sets the active color of the radio button.
  - **imagebackgroundcolor** - Color - sets the background color for the image container.
  - **imageboxFit** - BoxFit - sets the boxFit options for the image.
  - **imageURL** - String - URL to load the Image.
  - **imageonClick** - Function - Function perform actions on Click event of the image button.
  - **imageheight** - double - Sets the height for the image container.
  - **imagewidth** - double - Sets the weight for the image container.
  - **borderRadius** - BorderRadius - This is border redius for button.
  - **color** - Color - Color of button define.
  - **disabledColor** - Color - Disable color of button.
  - **padding** - EdgeInsets - This is button padding.
- Example

  - Step 1 : Import UI kit in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtButton widget as shown below example.

  ```dart
        Button

         class ButtonDemo extends StatelessWidget {
              @override
              Widget build(BuildContext context) {
                return Scaffold(
                    appBar: GtAppBar(
                        backgroundColor: Color(0xff5a5278),
                        title: GtText(text: 'Button Demo')),
                    body: Container(
                        padding: EdgeInsets.all(10.0),
                        child: GtButton(
                          icondata: Icons.ac_unit,
                          text: 'Click Me',
                          iconPosition: GtPosition.PREFIX,
                        )));
              }
        }

        Radio  Button

        enum SingingCharacter { lafayette, jefferson }
        class ButtonDemo extends StatelessWidget {
              @override
              Widget build(BuildContext context) {
                return Scaffold(
                    appBar: GtAppBar(
                        backgroundColor: Color(0xff5a5278),
                        title: GtText(text: 'Button Demo')),
                    body: Container(
                        padding: EdgeInsets.all(10.0),
                        child: GtButton(
                          buttonType: GtButtonType.RADIO,
                          groupValue: SingingCharacter.lafayette,
                          value: SingingCharacter.lafayette,
                          title: GtText(text: 'lafayette'),
                          selected: true,
                          text: 'lafayette',
                        )));
              }
           }

       Image Button

        class ButtonDemo extends StatelessWidget {
              @override
              Widget build(BuildContext context) {
                return Scaffold(
                    appBar: GtAppBar(
                        backgroundColor: Color(0xff5a5278),
                        title: GtText(text: 'Button Demo')),
                    body: Container(
                        padding: EdgeInsets.all(10.0),
                        child: GtButton(
                          buttonType: GtButtonType.IMAGE,
                           imageheight: 70,
                           imagewidth: 80,
                          imageURL:
                              'https://homepages.cae.wisc.edu/~ece533/images/airplane.png',
                          imageboxFit: BoxFit.fill,
                          imageonClick: () => {print('clicked')},
                        )));
                 }
           }


  ```

  - Step 3 : Result :

    ![bt1](https://user-images.githubusercontent.com/47977097/115862918-5b3e1180-a452-11eb-9c70-587b63074972.png)

    ![rdbtn](https://user-images.githubusercontent.com/47977097/115862984-714bd200-a452-11eb-9038-7c5a744e58e8.png)

    ![imbtn](https://user-images.githubusercontent.com/47977097/115863019-7dd02a80-a452-11eb-92b1-4706b7b40855.png)

# GtAppSideBar Widget

The GtAppSideBar widget are two primary options for navigation tabs and drawers when there is insufficient space to support tabs, drawers.

- Benefits of GtAppSideBar Widget

  - SideBar is design used in app secondary menu design.

  - We can use vertical space of mobile screens optimally because most of the users in most cases use portraint mode of app orientation against landscape mode.

  - SideBar can cover a number of navigation opetions campared to tiny main navigation bar situated either on the top or bottm of the app Even users cna scroll it further to access hidden buttons or content.

  - SideBar can provide clear and clutter free desing.

- Constructors:

```
       - [GtAppSideBar](components.md#gtbutton-widget)(
         {  @required this.listApp,
            @required this.isItemSelected,
            @required this.toolTipMessageField,
            @required this.getAvatarWidgeContent,
            this.selectedindex,
            this.onTapHandler,
            this.trailingWidget,
            this.navigationBackGround = Colors.white,
            this.selectedRowColor = Colors.blueGrey,
            this.selectedRowDarkColor = Colors.grey,
            this.iconColor = Colors.black,
            this.leadingWidget,
            this.backGroundColor = Colors.white,
            this.width = 60.0,
            this.railTextWidget
         });
```

- Input Parameters of GtAppSideBar Widget
  - **listApps** - List<dynamic> - This is fine for short list but not for a long list.
  - **trailingWidget** - List<Widget> - List are made up of multiple rows of items, which include text, buttons, toggles, icons, thumbnails, and many more.
  - **selectedindex** - int - The index into destinations for the current selected
  - **onTapHandler** - Function - Function to call ListApp onTapHandler.
  - **navigationBackGroundColor** - Color - To set navigationBackGroundColor.
  - **selectedRowColor** - Color - Provide Row color selected row.
  - **selectedRowDarkColor** - Color - Set Row color dark selected row.
  - **iconColor** - Color - To set the icon color.
  - **isItemSelected** - Function(dynamic obj) - To call function which item selected.
  - **getAvatarWidgetContent** - Function(dynamic obj) - To call getAvatarWidgetContent function.
  - **toolTipMessageContent** - Function(dynamic obj) - To call toolTipMessageContent function.
  - **leadingWidget** - Widget- A widget to display before the toolbar's title.
  - **backGroundColor** - Color - To sets backgroundcolor.
  - **width** - double - To set width in double data type.
  - **railTextWidget** - Function(dynamic obj) - To call railTextWidget function.
- Example

  - Step 1 : Import UI kit in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtAppSideBar widget as shown below example.

  ```dart



         class Home extends StatelessWidget {
              @override
              Widget build(BuildContext context) {
                 return Scaffold(
                    appBar: GtAppBar(
                       title: GtText(
                         text: 'AppBar',
                        )
                  ),
                  drawer: Drawer(
                    child: GtAppSideBar(
                      isItemSelected: (obj) {},
                      getAvatarWidgetContent: (obj) {},
                      toolTipMessageField: (obj) {},
                      listApps: [],
                      trailingWidget: [
                        Container(
                           child: Column(
                             children: <Widget>[
                                 Container(
                                   width: double.infinity,
                                   padding: EdgeInsets.all(20),
                                   color: Theme.of(context).primaryColor,
                                   child: Center(
                                       child: Column(children: <Widget>[
                                          Container(
                                             width: 100,
                                             height: 100,
                                             decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                               image: DecorationImage(
                                                 image: AssetImage('assets/images/profile.jpg'),
                                                 fit: BoxFit.fill)),
                                                ),
                                                Text(
                                                  'Greytrix',
                                                  style: TextStyle(fontSize: 20),
                                                  ),
                                                  GtText(text: 'greytrixindia@gmail.com')
                                              ]
                                         ),
                                     ),
                                   ),
                                   ListTile(
                                    leading: Icon(Icons.file_present),
                                    title: Text('My File'),
                                   ),
                                   ListTile(
                                    leading: Icon(Icons.people),
                                    title: GtText(text: 'Shared with me'),
                                   ),
                                   ListTile(
                                    leading: Icon(Icons.star),
                                    title: GtText(text: 'Starred')
                                   ),
                                   ListTile(
                                    leading: Icon(Icons.credit_card_rounded),
                                    title: GtText(text: 'Recent'),
                                   ),
                                   ListTile(
                                    leading: Icon(Icons.offline_share),
                                    title: GtText(text: 'Offline'),
                                   ),
                                   ListTile(
                                    leading: Icon(Icons.upload_rounded),
                                    title: GtText(text: 'Upload'),
                                   ),
                                   ListTile(
                                    leading: Icon(Icons.cloud_download_outlined),
                                    title: GtText(text: 'Backup'),
                                   ),
                                ],
                             ),
                           ),
                         ]
                      ),
                    )
                 );
             }
        }

  ```

  - Step 3 : Result :

    ![AppSideBar](https://user-images.githubusercontent.com/82582302/119087922-78e8a180-ba25-11eb-88a9-5edc66af81c8.png)

# GtDynamicView Widget

The GtDynamicView widget is used to write corresponding parsing engines on the client side to implement dyanamic view.

- Benefits of GtDynamicView Widget
  - Dynamic views have the benefits of transparent file access.
  - Fast immediate updates.
  - Also, get global view of code base.
  - Derived objects sharing.
- Constructors:

```
       - [GtDynamicView](components.md#gtbutton-widget)(
         {
            key key,
            this.listItems,
            this.title,
            this.gtTileRowCrossAxisAlignment,
            this.gtTileRowMainAxisAlignment,
            this.toMapjson,
            this.rowsCount = 1,
            this.headertextStyle,
            this.datatextStyle,
            this.backgroundColor,
            this.cardColor,
         });
```

- Input Parameters of GtDynamicView Widget

  - **rowsCont** - int - To set the number of row.
  - **toMapjson** - Map<String, dynamic>- A Map object is a key-value pair to store string or any dynamic data.
  - **listItem** - dynamic - To set the data in listItems.
  - **gtTileRowCrossAxisAlignment** - CrossAxisAlignment - To set ho items are align on the other axis
  - **gtTileRowMainAxisAlignment** - MainAxisAlignment - To set how items are aligned on that axis.
  - **title** - String - To set the Title.
  - **headertextStyle** - TextStyle - Sets the heardertextStyle which you want.
  - **datatextStyle** - TextStyle - Sets the datatextStyle which you want.
  - **backgroundColor** - Color - Sets background color which user wants to set.
  - **cardColor** - Color - This is card color which you want to set.

- Example

  - Step 1 : Import UI kit in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtDynamicView widget as shown below example.

  ```dart

     class DynamicViewDemo extends StatelessWidget {
           @override
           Widget build(BuildContext context) {
              return Scaffold(
                  appBar: GtAppBar(
                     title: GtText(
                         text: 'Dynamic View',
                        ),
                     ),
                     body: GtDynamicView(
                     rowsCount: 11,
                     title: 'PERSONAL DETAILS',
                     toMapjson: {
                        'Personal Email Id': GtTileField(
                             displayKey: true,
                             row: 1,
                             valuePath: 'email',
                             flex: 1,
                             mobileRow: 1,
                         ),
                        'Blood Group': GtTileField(
                            displayKey: true,
                            row: 1,
                            valuePath: 'bloodgroup',
                            flex: 1,
                            mobileRow: 2,
                         ),
                        'Address1': GtTileField(
                            displayKey: true,
                            row: 2,
                            valuePath: 'address1',
                            flex: 1,
                            mobileRow: 3,
                         ),
                        'Address2': GtTileField(
                            displayKey: true,
                            row: 2,
                            valuePath: 'address2',
                            flex: 1,
                            mobileRow: 4,
                         ),
                        'Place ': GtTileField(
                            displayKey: true,
                            row: 3,
                            valuePath: 'place',
                            flex: 1,
                            mobileRow: 5,
                         ),
                        'City': GtTileField(
                            displayKey: true,
                            row: 3,
                            valuePath: 'city',
                            flex: 1,
                            mobileRow: 6,
                         ),
                        'Pin Code': GtTileField(
                            displayKey: true,
                            row: 4,
                            valuePath: 'pincode',
                            flex: 1,
                            mobileRow: 7,
                         ),
                        'Email Id': GtTileField(
                            displayKey: true,
                            row: 4,
                            valuePath: 'emailid',
                            flex: 1,
                            mobileRow: 8,
                         ),
                        'Bank Branch Code': GtTileField(
                            displayKey: true,
                            row: 5,
                            valuePath: 'bankbranchcode',
                            flex: 1,
                            mobileRow: 9,
                         ),
                        'Bank Name': GtTileField(
                            displayKey: true,
                            row: 5,
                            valuePath: 'bankname',
                            flex: 1,
                            mobileRow: 10,
                         ),
                        'Personal Mobile No': GtTileField(
                            displayKey: false,
                            row: 6,
                            valuePath: 'mobileno',
                            flex: 1,
                            mobileRow: 10,
                         ),
                    },
                    listItems: {
                         'email': 'manish98@gmail.com',
                         'bloodgroup': 'O+',
                         'address1': 'Khamothe',
                         'address2': 'Belpada',
                         'place': '121212434',
                         'city': 'KHARGHAR',
                         'pincode': '410210',
                         'emailid': 'manish98@gmail.com',
                         'bankbranchcode': '000291',
                         'bankname': 'HDFC Bank',
                         'mobileno': '9082948703'
                    },
                ),
             );
          }
     }



  ```

  - Step 3 : Result :

  ![DynamicView](https://user-images.githubusercontent.com/82582302/119608692-fe989280-be13-11eb-962f-91d64ba5f646.png)

# GtSignature Widget

The GtSignature widget is used represent to allow users to sign with finger and export the result as image.

- Benefits of GtSignature Widget
  - Provided the options Save and Clear Buttons.
  - More properties/options are available to make widget pretty good.
- Constructors:

```
       - [GtSignature](components.md#gtsignature-widget)(
         {  this.color = Colors.black,
            this.strokeWidth = 2.0,
            this.changeColorOnPressed,
            this.changeStrokeWidthOnPressed,
            this.saveSignOnPressed,
            this.backgroundColor = Colors.white54,
            this.signaturePadBackgroundColor = Colors.white70,
            this.sign,
            this.signClearOnPressed,
            this.clearSignButtonColor,
            this.saveSignButtonColor,
            this.changeColor,
            this.changeStrokeWidth});
```

- Input Parameters of GtCurrency Widget

  - **color** - Color - signature color.
  - **strokeWidth** - double - width of signature line. Default value is 2.0.
  - **changeColorOnPressed** - Function - Change Color of signature function.
  - **changeStrokeWidthOnPressed** - Function - Change signature width function. Example Below.

  ```dart
    void changeStrokeWidthOnPressed(){
        int min = 1;
        int max = 10;
        int selection = min + (Random().nextInt(max - min));
        strokeWidth = selection.roundToDouble();
    }
  ```

  - **saveSignOnPressed** - Function - Save the signature of draw function. Example is below.

  ```dart
    void saveSignOnPressed(){
        ByteData _img = ByteData(0);
        final sign = _sign.currentState;
        //retrieve image data, do whatever you want with it (send to server, save locally...)
        final image = await sign.getData();
        var data = await image.toByteData(format: ui.ImageByteFormat.png);
        sign.clear();
        final encoded = base64.encode(data.buffer.asUint8List());
        setState(() {
           _img = data;
        });
    }
  ```

  - **backgroundColor** - Color - Widget background Color.
  - **signaturePadBackgroundColor** - Color - Signature Pad background Color.
  - **sign** - GlobalKey<SignatureState> - Global key for widget. Example below.

  ```dart
     final sign = GlobalKey<SignatureState>();
  ```

  - **signClearOnPressed** - Function - clear pad signature function. Example below.

  ```dart
     void signClearOnPressed(){
        final sign1 = sign.currentState;
        sign1.clear();
     }
  ```

  - **clearSignButtonColor** - Color - This is Clear Sign button color.
  - **saveSignButtonColor** - Color - This is Save sign button color.
  - **changeColor** - Color - It will change the color of ink.
  - **changeStrokeWidth** - Color - Change the stoke widgth with color.

- Example
  - Step 1 : Import UI kit in files that it will be used:
  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```
  - Step 2 : Used GtSignature widget as shown below example.
  ```dart
     class SignatureDemo extends StatelessWidget {
           @override
           Widget build(BuildContext context) {
              return Scaffold(
                 body: Center(
                 child: Container(
                    width: 200,height: 100,
                    child: GtSignature(
                    color: Colors.black,
                    signaturePadBackgroundColor: Colors.grey[200],
                 ))),
              );
           }
        }
  ```
  - Step 3 : Result :
    ![image](https://user-images.githubusercontent.com/64594463/118918621-a7e11380-b950-11eb-90d3-3aa4091eb835.png)

# GtFileUpload Widget

The GtFileUpload widget is used represent to allow users to file upload with Browse button and Drag and drop files in web, For Mobile only Browse button for file upload.

- Benefits of GtFileUpload Widget
  - Provided the options Browse button and Drag and Drop Files.
  - More properties/options are available to make widget pretty good.
- Constructors:

```
       - [GtFileUpload](components.md#gtfileupload-widget)(
         {  this.backgroundColor = Colors.white,
            this.borderColor = Colors.black,
            this.onPressed,
            this.selectedFiles,
            this.iconUpload = Icons.cloud_upload,
            this.iconColor = Colors.grey,
            this.iconSize = 100.0,
            this.fileNameShow = true,
            this.buttonColor = Colors.blue,
            this.iconShow = true,
            this.fontSize = 20,
            this.extensions,
            this.allowMultiple = true,});
```

- Input Parameters of GtFileUpload Widget

  - **backgroundColor** - Color - Back Ground color of widget, Default color is White.
  - **borderColor** - Color - Widget border color, Default color is black.
  - **onPressed** - Function(dynamic) - This function return browse files or Drag file. Example Below.

  ```dart
    void onPressed(dynamic files) async {
       // Browse files or drag files available in parametere
       // do code here as required
        String fileName;
        selectedFilesName.value = "";
        if(kIsWeb){
           files.forEach((e) => {
              selectedFilesName.value = selectedFilesName.value == null || selectedFilesName.value == "" ? e.name : selectedFilesName.value + ", " + e.name,
           });
        }
        else{
           files.forEach((e) => {
              fileName = e.absolute.toString().substring(e.absolute.toString().lastIndexOf("/") + 1 ),
              selectedFilesName.value = selectedFilesName.value == null || selectedFilesName.value == "" ? fileName : selectedFilesName.value + ", " + fileName,
           });
        }
    }
  ```

  - **selectedFiles** - String - This reperesent the selected files name show in UI.
  - **iconUpload** - IconData - Icon for upload files, Default Icon is Icons.cloud_upload.
  - **iconColor** - Color - Icon color, Default color is grey.
  - **iconSize** - double - Size of icon and default size is 100.0.
  - **fileNameShow** - bool - Selected Files name show or not in UI, Default is true.
  - **buttonColor** - Color - Browse Button color Default color is blue.
  - **iconShow** - bool - Icon is shown or not in UI, Default is true.
  - **fontSize** - double - Size of Fonts in UI, Default size is 20.
  - **extensions** - String - This is Allow to Which Files is Taken from Browse. Pass the extension in string like "pdf,jpg,doc".
  - **allowMultiple** - bool - This is option for allow multiple files to upload, Default value is true.

- Example
  - Step 1 : Import UI kit in files that it will be used:
  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```
  - Step 2 : Used GtSignature widget as shown below example.
  ```dart
     class FileUploadDemo extends StatelessWidget {
           @override
           Widget build(BuildContext context) {
              return Scaffold(
                 body: Center(
                 child: Obx(() => Container(
                    child: GtFileUpload(
                       backgroundColor: Colors.blue[100],
                       onPressed: controller.openFileExplorer,
                       selectedFiles: controller.selectedFilesName.value,
                       extensions: "pdf,doc,jpg",
                       )
                    ))),
              );
           }
        }
  ```
  - Step 3 : Result :
    ![image](https://user-images.githubusercontent.com/64594463/119605079-cd1cc880-be0d-11eb-9460-6fab0543abc7.png)
    ![image](https://user-images.githubusercontent.com/64594463/119605260-13722780-be0e-11eb-857f-0a2d04af8848.png)

# GtTagTextField Widget

The gttagtextfield widget is used represent the Suggestions list when click on the Screen with alng as optional parameter.

- Benefits of GtTagTextField Widget
  - Handles the font size of the text in dynamic way based on the screen resolution when specified along with required Fields.
- Constructors:

```
   - [GtTagTextField](components.md#gttagtextfield-widget)({
         @required this.onDeleted,
         @required this.suggestionsCallback,
         @required this.onSuggestionSelected,
         @required this.taglist,
         @required this.textEditingController,
         @required this.lookupFields,
         this.addNewHandler,
         this.onSavedHander,
         this.allowMultiselection = false,
         this.looupKeyVisibile = false,
         this.selectedTaglist,
         this.maxLines = 1,
         this.minLines = 1,
         this.maxLength,
         this.isRequired = false,
         @required this.fieldLabel,
         this.focusNode,
         this.suggestionsBoxController,
         this.displayInFieldLabel = false,
         this.labelfontsize,
         this.textColor = Colors.black,
         this.addButtonOption = false,
         this.customWidgetPanel,});
```

- Input Parameters of GtTagTextField Widget
  - **onDeleted** - Function - This is required parameter, it well used to Delete the selected tag in Search Box.
  - **suggestionsCallback** - Function - This is required parameter, This will return the suggestion list when user type any key list of suggestion will return.
  - **onSuggestionSelected** - Function - This is required parameter, It will select the suggestion list item.
  - **taglist** - List<dynamic> - This is required parameter, Tag list is selected Tag List from suggestion list.
  - **textEditingController** - TextEditingController - This is required parameter, Text Controller for textField.
  - **lookupFields** - Map<String, String> - This is required parameter, This show Suggestion lookup fields.
  - **addNewHandler** - Function - This for suggestion not match with text than it will give option for add.
  - **allowMultiselection** - bool - This used for suggestion selection was multiple or single. Default is false.
  - **looupKeyVisibile** - bool - This used for lookUp Key Fields visible. Default is false.
  - **selectedTaglist** - List<dynamic> - Tag list is selected Tag List from suggestion list.
  - **isRequired** - bool - This field is required or not defined. Default is false.
  - **fieldLabel** - String - This is required parameter, This will display Field label.
  - **focusNode** - FocusNode - This will used for focuse on delete handler.
  - **displayInFieldLabel** - bool - This will display label in field, Default is false.
  - **labelfontsize** - double - This will used for label font size.
  - **textColor** - Color - This is display text color, default color was Black.
  - **addButtonOption** - bool - This is add button option, default is false.
  - **customWidgetPanel** - Widget - Custome widget for when Suggestion list have to change.
- Example

  - Step 1 : Import in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtTagTextField widget and specify the is to be displayed.

  ```dart
        class TextDemo extends StatelessWidget {
           @override
           Widget build(BuildContext context) {
             return Scaffold(
                 appBar: GtAppBar(
                     backgroundColor: Color(0xff5a5278)),
                 body: Container(
                   child: GtTagTextField(
                       textColor: Colors.blue,
                       fieldLabel: "Product",
                       isRequired: false,
                       allowMultiselection: false,
                       looupKeyVisibile: false,
                       displayInFieldLabel: false,
                       textEditingController:  new TextEditingController(text: ' '),
                       lookupFields: {'company': 'company'},
                       selectedTaglist: [],
                       taglist: [],
                       onDeleted: (val) => {},
                       onSuggestionSelected: (_val, isMutli) {},
                       suggestionsCallback: (pattern) async {
                          return [{
                             "company": "Apple",
                             "description": "job description",
                          },
                          {
                             "company": "Google",
                             "description": "job description",
                          },];
                       }
                   ),
                 ));
           }
        }

  ```

  - Step 3 : Result :

    ![GtTagTextField](https://user-images.githubusercontent.com/64594463/124076547-09be8e00-da64-11eb-9b70-6f11232784e1.png)

# GtListPage Widget

The GtListPage widget is used represent the Listview on the Screen with alng as optional parameter.

- Benefits of gtlistpage Widget
  - Handles the Listview font size of the text in dynamic way based on the screen resolution when specified along with required Fields.
- Constructors:

```
   - [GtListPage](components.md#gtlistpage-widget)({
      Key key,
      this.title,
      @required this.listItems,
      this.enablefilter = false,
      this.viewtype,
      this.backNavigation = false,.selectAllcheckbox,
      this.selectallRecords = false,
      this.showStats,this.leadingIcon,
      this.trailingIcon,
      this.onDetailsNavigateHandler,
      this.onSelectionHandler,
      this.gtTileRowCrossAxisAlignment = CrossAxisAlignment.center,this.gtTileRowMainAxisAlignment = MainAxisAlignment.center,this.rowsCount = 2,
      this.cardAspectRatio = 1.5,
      this.cardCrossAxisSpacing = 8,
      this.cardMainAxisSpacing = 12,
      this.tag,this.filterHandler,
      this.rangeFilterLimits,
      this.rangeFilterDivisions = 10,
      @required this.toMapjson,
      this.isFilterProcessing = false,this.pathNavigation = "",this.isSpaceInRecords = false,
      this.filtersData,this.onHoverHandler,this.toggleListGridView,this.isListView = true,this.backgroundcolor = Colors.white,this.onDeleteHandler,
      this.quantityInitialValue,
      this.incrementHandler,
      this.decrementHandler,
      @required this.size,
      this.entity,
      this.isleadingIconPosition = true,
      this.listViewTableType = GTListViewTableType.Normal,
      this.primaryColor = Colors.blue,
      this.checkboxactiveColor = Colors.blue,
      this.checkboxcheckColor = Colors.white,
      this.checkboxfocusColor = Colors.blue,
      this.selectedRowColor = Colors.grey,
      this.jsonHeader,
      this.filterBottomSheet,
      this.isLeadingShow = true,
      this.cardColor = Colors.white,
      this.swipeToOption,
      this.swipeIcon = Icons.delete,
      this.swipeBackgroundColor = Colors.red,
      this.swipeIconColor = Colors.white,
      this.mobileHeader = false,
      this.backButtonColor = Colors.black,
      //this.swipeConfirmMessage = "Are you sure you wish to delete this item?",
      this.swipeConfirmMessageTextWidget,
      //this.swipeConfirmButtonText = "DELETE",this.swipeConfirmButtonTextWidget,
      this.swipeCancelButtontextWidget,
      this.cardMarginEdgeInsets =const EdgeInsets.only(top: 1, bottom: 1, left: 1, right: 1),
      this.spaceBetweenKeyValue = false,
      this.horizinalScrollable = false,
      this.listItemPadding = const EdgeInsets.only(left: 5.0, top: 8.0, bottom: 8.0, right: 5.0),
      this.itemDatawidget,this.isCustomItemWidget = false,
      this.swipeSnackBartextWidget,
      this.mainCardMargin = const EdgeInsets.all(8),});
```

- Input Parameters of GtListPage Widget

  - **title** - Widget - This is Listview Title widget.
  - **listItems** - List<dynamic> - This is required parameter, have to pass list of Data.
  - **enablefilter** - bool - This used for filter display or not, Default is false.
  - **viewtype** - Viewtype - This is Type of Listview, Default is Viewtype.List.
  - **backNavigation** - bool - This is display back button in top od list, Default is false.
  - **selectAllcheckbox** - Function - This for Record all selection function.
  - **selectallRecords** - bool - select all Record Checkbox is display in Listview, Default is false.
  - **leadingIcon** - Widget - This is Leading Widget For Each item of listview.
  - **trailingIcon** - Widget - This is trailing Widget For Each item of listview.
  - **onDetailsNavigateHandler** - Function - This used for Lisview item click handle.
  - **onSelectionHandler** - Function - This is on record checked selection.
  - **gtTileRowCrossAxisAlignment** - CrossAxisAlignment - This Listview alignment, Default is CrossAxisAlignment.center.
  - **gtTileRowMainAxisAlignment** - MainAxisAlignment - This Listview alignment, Default is MainAxisAlignment.center.
  - **rowsCount** - int - Listview each Item Row Count, Default is 2.
  - **cardAspectRatio** - double - This is card ration, Default is 1.5.
  - **cardCrossAxisSpacing** - double - This will card spacing in cross, default is 8.
  - **cardMainAxisSpacing** - double - This will card spacing in Main, default is 12.
  - **tag** - String - This is tag for each listview will different.
  - **filterHandler** - Function - Filter is refresh handler when we go to nextpage event.
  - **onHoverHandler** - Function - This is when hover on record item hover function call.
  - **toMapjson** - Map<String, dynamic> - This contains which fields we have to show in ListView of each row. And we used GtTileField widget check below.
  - Constructor of GtTileField

  ```
     - GtTileField({this.row,
        this.mobileRow,
        this.value,
        this.iconData,
        this.flex = 1,
        this.mobileFlex = 1,
        this.textOverFlow,
        this.displayKey = false,
        this.type = GtFieldType.STRING,
        this.webTextFormatType = TextformatType.caption,
        this.mobileTextFormatType = TextformatType.caption,
        this.keyTextFormatType = TextformatType.caption,
        this.isCardTitle = false,
        this.isCardSubTitle = false,
        this.isBannerField = false,
        this.cardRow, this.filterType,
        this.filterItems,
        this.valuePath,
        this.filterValue,
        this.filterLabel,
        this.rangeStart,
        this.rangeEnd,
        this.bannerItems,
        this.pathNavigation,
        this.filterNodeValue,
        this.lookUpDisplayNode,
        this.lookUpFilterNode,
        this.fieldTextColor,
        this.fieldTextBackgroundColor,
        this.navigationNode,
        this.textStyle,
        this.lookupAddNodeKey,
        this.lookupAddVariableKey,
        this.focusNode,
        this.textEditingController,
        this.lookupFields,
        this.looupKeyVisibile,this.nodeKey,
        this.fieldKey,
        this.isRequired = false,
        this.isMultiselect = false,
        this.valueType =GtValueType.STRING,
        this.listFieldValuePath,
        this.isActiveInactiveField = false,
        this.activeInactiveItems,
        this.statusField,this.fontFamily,this.tileDateFormat, this.defaultStatusColor = Colors.blue,
        this.chipFieldShape,
        this.isAssert = true,
        this.buttonOnPressed,this.buttonStyle,
        this.keyTextStyle,
        this.valueTextStyle,
        this.keyTextAlign = TextAlign.start,
        this.valueTextAlign = TextAlign.start,
        this.keyValueBetween = " : ",
        this.buttonElevation = 5.0,});
  ```

  - Input Parameters of GtTileField Widget

    - **row** - int - This is contains which row have to display this field in web.
    - **mobileRow** - int - This is contains which row have to display this field in mobile.
    - **value** - dynamic - This contains value of the field.
    - **iconData**- IconData - Showing Icon start of the field.
    - **flex** - int - The flex factor to use for this child. This is for Web.
    - **mobileFlex** - int - The mobileFlex factor to use for this child. This is for mobile.
    - **textOverFlow** - TextOverflow - Defaults to retrieving the value from the nearest DefaultTextStyle ancestor.
    - **displayKey** - bool - This is for Display field label name, If displaykey is true than field name is showing with value. Default is false.
    - **type** - GtFieldType - Type of field is define like Enum(STRING,EMAIL,PHONE,CHIP,BANNER,FILTER).
    - **webTextFormatType** - TextformatType - This will define which text format is taken. Default is TextformatType.caption for web.
    - **mobileTextFormatType** - TextformatType - This will define which text format is taken. Default is TextformatType.caption for mobile.
    - **keyTextFormatType** - TextformatType - This will define which text format is taken. Default is TextformatType.caption for label.
    - **isCardTitle** - bool - This contains field is showing in title or not in Card. Default false.
    - **isCardSubTitle** - bool - This contains field is showing in SubTitle or not in Card. Default false.
    - **isBannerField** - bool - This used for A banner displays a prominent message and related field. Default value is false.
    - **cardRow**- int - This is contains which row have to display this field in card.
    - **filterType** - GtFilterType - This field is used for which type is filter like ( RADIO_BUTTON_FILTER, CHECKBOX_BUTTON_FILTER, RANGE_FILTER, SORT_FILTER,)
    - **filterItems** - Map<String, dynamic> - This is Sort the List as per given sort fields. And also Display the fields in UI.
    - **valuePath** - String - This is define which is Field map with valuePath.
    - **filterValue** - String - This value is send to the API for this field.
    - **filterLabel** - String - It will show in UI in this filter field.
    - **rangeStart**- String - This is Range Start field name.
    - **rangeEnd** - String - This is Range End field name.
    - **bannerItems** - Map<String, dynamic> - It will show banner Items.
    - **pathNavigation** - String - This is Path navigation on field click.
    - **filterNodeValue** - String - This is Filter Field name as handle filter.
    - **lookUpDisplayNode** - String - This LookupFilter Display node.
    - **lookUpFilterNode** - String - This Lookup Filter node as handle.
    - **fieldTextColor** - Color - This is Field text color.
    - **fieldTextBackgroundColor** - Color - This is Field background text color.
    - **navigationNode** - Color - This is navigation node on field click.
    - **textStyle** - TextStyle - This is for text field styling.
    - **lookupAddNodeKey** - String - This is add look up node.
    - **lookupAddVariableKey** - String - This is lookUp Add variable Key.
    - **focusNode** - FocusNode - This is field focuse.
    - **textEditingController** - TextEditingController - This is text field controller.
    - **lookupFields** - Map<String, String> - This is Look up fields which have to display on look up.
    - **looupKeyVisibile** - bool - This is Lookup key Visibile for diaply, Default is false.
    - **nodeKey** - String - This is node key that lookup field define.
    - **fieldKey** - String - This is lookup field key.
    - **isRequired** - bool - This field is required or not defined. Default is false.
    - **isMultiselect** - bool - This is lookup data is multi selected or not.
    - **valueType** - GtValueType - This is define which type is field, Default is STRING.
    - **listFieldValuePath** - String - This is List Field value path for display.
    - **isActiveInactiveField** - bool - This is field is active or inactive define.
    - **activeInactiveItems** - Map<String, dynamic> - This is Active and inactive record item.
    - **statusField** - Map<String, dynamic> - This is for Status Field.
    - **buttonOnPressed** - Function - This is button on preesed function for button field.
    - **buttonStyle** - ButtonStyle - This is button field style.
    - **keyTextStyle** - TextStyle - This is the Field Key Styling.
    - **valueTextStyle** - TextStyle - This is the Field value Styling.
    - **keyTextAlign** - TextAlign - This is for field key textAlign.
    - **valueTextAlign** - TextAlign - This is for field value textAlign.
    - **keyValueBetween** - String - This is Key and value between String display.
    - **buttonElevation** - bouble - This is button elvation.

  - **pathNavigation** - String - This is path of navigate each record.
  - **isSpaceInRecords** - bool - This is space in records, default is false.
  - **filtersData** - Map<String, dynamic> - This is the filter data for display filter.
  - **isListView** - bool - This is for Type of List, Default is true.
  - **backgroundcolor** - Color - This is background color of listview.
  - **onDeleteHandler** - Function - This is function is handle in trailing for deleting the records.
  - **quantityInitialValue** - int - this is the quantity of initial value.
  - **toggleListGridView** - Function - This will listview type change function.
  - **incrementHandler** - Function - This function Widget increment Handler.
  - **decrementHandler** - Function - This function Widget decrement Handler.
  - **size** - Size - This is required field, For this Listview Responsevie size.
  - **entity** - String - This is for on delete entity name.
  - **isleadingIconPosition** - bool - This is leading icon position is define, Default is true.
  - **listViewTableType** - GTListViewTableType - This is Listview type , Default is GTListViewTableType.Normal.
  - **primaryColor** - Color - This is Listview primary color define.
  - **checkboxactiveColor** - Color - This is checkbox active Color.
  - **checkboxcheckColor** - Color - This is checkbox check Color.
  - **checkboxfocusColor** - Color - This is checkbox focuse Color.
  - **selectedRowColor** - Color - This is Selected Row Color.
  - **jsonHeader** - List<dynamic> - This is for Show Listview Header json.
  - **filterBottomSheet** - Function - This is BottomSheet Filter function.
  - **isLeadingShow** - bool - This is Leading Icon show or not, Default is true.
  - **cardColor** - Color - This is Listview Background Card Color.
  - **swipeToOption** - Function - This is Define option for type swipe to delete or any option.
  - **swipeIcon** - IconData - This is Swipe icon data.
  - **swipeBackgroundColor** - Color- this is swipe background color.
  - **swipeIconColor** - Color- this is swipe Icon color.
  - **mobileHeader** - bool- This is header for mobile or not, default is false.
  - **backButtonColor** - Color - Listview back button color.
  - **swipeConfirmMessageTextWidget** - Widget - This is swipe confirmation message widget.
  - **swipeConfirmButtonTextWidget** - Widget - This is swipe confirmation button widget.
  - **swipeCancelButtontextWidget** - Widget - This is swipe cancel button widget.
  - **cardMarginEdgeInsets** - EdgeInsets - This is card margin for design.
  - **spaceBetweenKeyValue** - bool - This is space between key and value, default is false.
  - **horizinalScrollable** - bool - This is horizinal Scrollable, default is false.
  - **listItemPadding** - EdgeInsets - This is item padding.
  - **itemDatawidget** - Function - This is Custom Widget of Each Item.
  - **swipeSnackBartextWidget** - Widget - This is used swipe delete option snackbar showing Widget.
  - **mainCardMargin** - EdgeInsets - This is ListView Main Card margin, default mergin is EdgeInsets.all(8).
  - **cardElevation** - double - FrameLayout with rounded corners and shadow based on its cardElevation.
  - **noListFoundText** - String - This is text for record length is 0 than it message will display.
  - **customGridviewItemBuilder** - Function(int index,dynamic obj) - This is custom widget for Grid View each item.
  - **listCustomWidgetType** - GtListCustomWidgetType (enum) - It is custom widget type for show custom builder, options enum GtListCustomWidgetType { LIST, GRID, NONE }. Default is GtListCustomWidgetType.NONE
  - **currentListViewTyp**e - GtCurrentListViewType - This shows current listview type, Selected list type for gtListPage. option enum { LIST, GRID }, Default is GtCurrentListViewType.LIST.

- Example

  - Step 1 : Import in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtListPage widget and specify the is to be displayed.

  ```dart
        class TextDemo extends StatelessWidget {
           @override
           Widget build(BuildContext context) {
             return Scaffold(
                 appBar: GtAppBar(
                     backgroundColor: Color(0xff5a5278)),
                 body: Container(
                   child: GtListPage(
                       rowsCount: 2,
                       title: GtText(
                       textStyle: TextStyle(
                          color: Colors.black,
                       ),
                          text: "Task"
                       ),
                       leadingIcon: GtIcon(
                       icondata: Icons.account_circle_rounded,
                       ),
                       isLeadingShow: false,
                       listItems: [{"Id": 2093,"CompanyId": 0,"Code": "GT0521","FName": "DEMO USER",},
                       {"Id": 2093,"CompanyId": 0,"Code": "GT011","FName": "DEMO MANAGER",}],
                       viewtype: ViewType.list,
                       spaceBetweenKeyValue: false,
                       toMapjson: {
                       'Name': GtTileField(
                          valuePath: 'FName',
                          row: 1,
                          flex: 4,
                          mobileRow: 1,
                          mobileFlex: 3,
                          cardRow: 1,
                          type: GtFieldType.STRING,
                          keyTextStyle: TextStyle(color: Colors.black,fontSize: 15),
                          valueTextStyle: TextStyle(color: Colors.black,fontSize: 16),
                          keyTextAlign: TextAlign.start,
                          valueTextAlign: TextAlign.end,
                          displayKey: true,
                          keyValueBetween: " : ",
                          webTextFormatType: TextformatType.textwithopacity,
                       ),
                       'Code': GtTileField(
                          valuePath: 'Code',
                          row: 1,
                          flex: 4,
                          mobileRow: 2,
                          mobileFlex: 3,
                          cardRow: 1,
                          type: GtFieldType.STRING,
                          keyTextStyle: TextStyle(color: Colors.black,fontSize: 15),
                          valueTextStyle: TextStyle(color: Colors.black,fontSize: 16),
                          keyTextAlign: TextAlign.start,
                          valueTextAlign: TextAlign.end,
                          displayKey: true,
                          keyValueBetween: " : ",
                          webTextFormatType: TextformatType.textwithopacity,
                       ),
                       },
                       tag: "Task",
                       gtTileRowMainAxisAlignment: MainAxisAlignment.center,
                       gtTileRowCrossAxisAlignment: CrossAxisAlignment.center,
                       isSpaceInRecords: true,
                       isleadingIconPosition: false,
                       size: Get.size,
                       listViewTableType: GTListViewTableType.Normal,
                       cardColor: Colors.blueGrey[200],
                       enablefilter: false,
                       backgroundcolor: Colors.white10,
                       cardMarginEdgeInsets: const EdgeInsets.all(5),
                       listItemPadding: const EdgeInsets.only(left: 15,right: 30, top: 8,bottom: 8),
                       backNavigation: true,
                       horizinalScrollable: false,
                   ),
                 ));
           }
        }

  ```

  - Step 3 : Result :

    ![GtListPage](https://user-images.githubusercontent.com/64594463/124108984-51eda880-da84-11eb-9ad8-4da2f5880f38.png)

# GtCheckboxFormField Widget

The gtcheckboxformfield widget is used represent the Form field checkbox on the Screen with alng optional parameter.

- Benefits of GtCheckboxFormField Widget
  - Handles the font size of the text in dynamic way based on the screen resolution when specified.
- Constructors:

```
   - [GtCheckboxFormField](components.md#gtcheckboxformfield-widget)({@required this.displayMapFields,
         @required this.selectedCheckboxValues,
         @required this.onChangedHandler,
         this.onSaveHandler,
         this.label,
         this.isRequired = false,
         this.textStyle,
         this.validationMessage = true,
         this.activeColor,});
```

- Input Parameters of GtCheckboxFormField Widget
  - **displayMapFields** - Map<String, dynamic> - This is required parameter, It is display field list.
  - **selectedCheckboxValues** - dynamic - This is required parameter, It is display selected check box value.
  - **onChangedHandler** - Function - This is required parameter, It handle on change of checkbox.
  - **onSaveHandler** - Function - This is on saved handler.
  - **label** - String - This is Field label.
  - **isRequired** - bool - This is field is required or not.
  - **textStyle** - TextStyle - this is text styling in widget.
  - **validationMessage** - bool - This is show vaidation message or not.
  - **activeColor** - Color - Color of active check box.
- Example

  - Step 1 : Import core in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtText widget and specify the textformattype for the text which is to be displayed.

  ```dart
        class TextDemo extends StatelessWidget {
           @override
           Widget build(BuildContext context) {
             return Scaffold(
                 appBar: GtAppBar(
                     backgroundColor: Color(0xff5a5278),
                     title: GtText(text: 'Customers')),
                 body: Container(
                   child:  GtCheckboxFormField(
                       displayMapFields: {"data" : "true","Data1": "false"},
                       selectedCheckboxValues: ["true"],
                       label: "Demo",
                       onChangedHandler: (val,data) => {}
                    )
                 ));
           }
        }

  ```

  - Step 3 : Result :

    ![GtCheckboxFormField](https://user-images.githubusercontent.com/64594463/124129481-72752d00-da9b-11eb-8959-cc51e11dfb65.png)

# GtDropdownFormField Widget

The GtDropdownFormField widget is used represent the Form field drop Down on the Screen with alng optional parameter.

- Benefits of GtDropdownFormField Widget
  - Handles the font size of the text in dynamic way based on the screen resolution when specified.
- Constructors:

```
   - [GtDropdownFormField](components.md#gtdropdownformfield-widget)({
         this.iconData,
         this.items,
         this.dropdownValue,
         this.onChangedhandler,
         this.onSavehandler,
         this.isRequired = false,
         this.label,
         this.textStyle,
         this.dropDownBackGround,
         this.valueTextStyle,
         this.isReadOnly = false,
         this.inputDecoration,
         this.validationHandler,
         this.itemType = GtDropDownFormFieldItemType.MAP,
         this.dropDownFormFieldIsCustom = GtDropDownFormFieldIsCustom.DEFAULT,
         this.itemCustomWidget,
         this.listLookupField,
         this.looupKeyVisibile = false,});
```

- Input Parameters of GtCheckboxFormField Widget
  - **iconData** - IconData - This is dropdown field icon.
  - **items** - Map<String, dynamic> - It is display field list in drop down.
  - **dropdownValue** - dynamic - It is display selected value of dropdown.
  - **onChangedHandler** - Function - It handle on change of checkbox.
  - **onSaveHandler** - Function - This is on saved handler.
  - **label** - String - This is Field label.
  - **isRequired** - bool - This is field is required or not.
  - **textStyle** - TextStyle - this is text styling in widget.
  - **dropDownBackGround** - Color - This is dropdown background color.
  - **valueTextStyle** - TextStyle - This is dropdown Text Style.
  - **isReadOnly** - bool - This is Field is Required or not.
  - **inputDecoration** - InputDecoration - The border, labels, icons, and styles used to decorate a Material Design.
  - **validationHandler** - Function(dynamic) - The user's input isn't valid the validate function condition for this widget
  - **itemType** - GtDropDownFormFieldItemType - This is dropdown Item data type enum to define DropDownMenuItem buildIn. Default type is GtDropDownFormFieldItemType.MAP.
  - **dropDownFormFieldIsCustom** - GtDropDownFormFieldIsCustom - This is dropdown Field MenuItems is Custom or default enum type. Default type is GtDropDownFormFieldIsCustom.DEFAULT.
  - **itemCustomWidget** - DropdownMenuItem<dynamic> Function(dynamic) - This is Custom widget return the DropDownMenuItem if GtDropDownFormFieldIsCustom.CUSTOM.
  - **listLookupField** - Map<String, dynamic> - This is Map parameter type for ItemType is List then it will required for and display as value and key.
  - **looupKeyVisibile** - bool - This is ItemType is List then listLookupField parameter map keys display when its true, default is false.
- Example

  - Step 1 : Import core in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtText widget and specify the textformattype for the text which is to be displayed.

  ```dart
        class TextDemo extends StatelessWidget {
           @override
           Widget build(BuildContext context) {
             return Scaffold(
                 appBar: GtAppBar(
                     backgroundColor: Color(0xff5a5278),
                     title: GtText(text: 'Customers')),
                 body: Container(
                   child:  GtDropdownFormField(
                       iconData: Icons.arrow_circle_down,
                       label: "Demo",
                       dropdownValue: "User1",
                       isRequired: false,
                       items: {"User1" : "User1", "User2": "User2"},
                       onChangedhandler: (data) {}
                    )
                 ));
           }
        }

  ```

  - Step 3 : Result :

    ![GtDropdownFormField](https://user-images.githubusercontent.com/64594463/124448490-23334300-dda0-11eb-9779-11de6773df7f.png)

    ![GtDropdownFormField](https://user-images.githubusercontent.com/64594463/124448563-39410380-dda0-11eb-9b61-4e9091bdac4d.png)

# GtRadioButtonFormField Widget

The GtRadioButtonFormField widget is used represent the Form field Redio options on the Screen with alng optional parameter.

- Benefits of GtRadioButtonFormField Widget
  - Handles the font size of the text in dynamic way based on the screen resolution when specified.
- Constructors:

```
   - [GtRadioButtonFormField](components.md#gtradiobuttonformfield-widget)({
         @required this.displayMapFields,
         @required this.selectedRadioButtonVal,
         @required this.onChangedHandler,
         this.onSaveHandler,
         this.label,
         this.isRequired = false,
         this.textStyle,
         this.validationMessage = true,
         this.activeColor});
```

- Input Parameters of GtRadioButtonFormField Widget
  - **displayMapFields** - Map<String, dynamic> - This is required parameter, It is display field Redio.
  - **selectedRadioButtonVal** - dynamic - This is required parameter, It is display selected Redio button value.
  - **onChangedHandler** - Function - This is required parameter, It handle on change of Redio button.
  - **onSaveHandler** - Function - This is on saved handler.
  - **label** - String - This is Field label.
  - **isRequired** - bool - This is field is required or not.
  - **textStyle** - TextStyle - this is text styling in widget.
  - **validationMessage** - bool - This is show vaidation message or not.
  - **activeColor** - Color - Color of active redio button.
- Example

  - Step 1 : Import core in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtRadioButtonFormField widget and specify the Redio button which is to be displayed.

  ```dart
        class RedioDemo extends StatelessWidget {
           @override
           Widget build(BuildContext context) {
             return Scaffold(
                 appBar: GtAppBar(
                     backgroundColor: Color(0xff5a5278),
                     title: GtText(text: 'Customers')),
                 body: Container(
                   child:  GtRadioButtonFormField(
                       label: "Demo",
                       isRequired: false,
                       selectedRadioButtonVal: "User1",
                       displayMapFields: {"User1" : "User1", "User2": "User2"},
                       onChangedHandler: (chk, data) {}
                    )
                 ));
           }
        }

  ```

  - Step 3 : Result :

    ![GtRadioButtonFormField](https://user-images.githubusercontent.com/64594463/124449969-99847500-dda1-11eb-822a-eb30acc1bba0.png)

# GtSwitchButtonFormField Widget

The GtSwitchButtonFormField widget is used represent the Form field Switch button on the Screen with alng optional parameter.

- Benefits of GtSwitchButtonFormField Widget
  - Handles the font size of the switch button in dynamic way based on the screen resolution when specified.
- Constructors:

```
   - [GtSwitchButtonFormField](components.md#gtswitchbuttonformfield-widget)({
         @required this.label,
         @required this.onChangedHandler,
         this.onSaveHandler,
         this.switchValue = false,
         this.isRequired = false,
         this.switchactiveColor,
         this.textStyle,
         this.validationMessage = true,
         this.crossAxisAlignment = CrossAxisAlignment.center});
```

- Input Parameters of GtSwitchButtonFormField Widget
  - **label** - String - This is required parameter, This is Field label.
  - **onChangedHandler** - Function - This is required parameter, It handle on change of Switch button.
  - **switchValue** - bool - It is display selected Switch button value.
  - **onSaveHandler** - Function - This is on saved handler.
  - **isRequired** - bool - This is field is required or not.
  - **textStyle** - TextStyle - this is text styling in widget.
  - **validationMessage** - bool - This is show vaidation message or not.
  - **switchactiveColor** - Color - Color of active switch button.
  - **crossAxisAlignment** - CrossAxisAlignment - This is alignment of cross axis alignment.
- Example

  - Step 1 : Import core in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtSwitchButtonFormField widget and specify the Switch button the which is to be displayed.

  ```dart
        class SwitchDemo extends StatelessWidget {
           @override
           Widget build(BuildContext context) {
             return Scaffold(
                 appBar: GtAppBar(
                     backgroundColor: Color(0xff5a5278),
                     title: GtText(text: 'Customers')),
                 body: Container(
                   child:  GtSwitchButtonFormField(
                       label: "Demo",
                       isRequired: false,
                       switchValue: true,
                       switchactiveColor: Colors.blue,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       onChangedHandler: (chk) { }
                    )
                 ));
           }
        }

  ```

  - Step 3 : Result :

    ![GtSwitchButtonFormField](https://user-images.githubusercontent.com/64594463/124451092-ace41000-dda2-11eb-9c3a-06500b708187.png)

# GtSurveyKit Widget

The GtSurveyKit widget is used represent the Survey.

- Benefits of GtSurveyKit Widget

  - Handles the font size way based on the screen resolution when specified.

- Android
- Make sure to add this line android:usesCleartextTraffic="true" in your <project-directory>/android/app/src/main/AndroidManifest.xml under application like this:

  ```dart
  <application
        android:usesCleartextTraffic="true">
  </application>

  ```

- Required Permissions are:
  <uses-permission android:name="android.permission.INTERNET" />
  <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
  <uses-permission android:name="android.permission.WAKE_LOCK" />

  ```

  ```

- IOS
- Add following code in your <project-directory>/ios/Runner/Info.plist
  ```dart
     <key>NSAppTransportSecurity</key>
     <dict>
        <key>NSAllowsArbitraryLoads</key> <true/>
     </dict>
     <key>io.flutter.embedded_views_preview</key> <true/>
  ```
- Constructors:
  ```
  - [GtSurveyKit](components.md#gtsurveykit-widget)({
        this.apiData = "",
        this.isHtml = true,
        this.submitData,});
  ```
- Input Parameters of GtSurveyKit Widget
  - **apiData** - String - This is Data of survey for question.
  - **isHtml** - bool - This is widget type is html or not.
  - **submitData** - Function(dynamic) - This Function It will return survey result.
- Example

  - Step 1 : Import core in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtSurveyKit widget and specify the Survey to be displayed.

  ```dart
        class SurveyDemo extends StatelessWidget {
           @override
           Widget build(BuildContext context) {
             return Scaffold(
                 appBar: GtAppBar(
                     backgroundColor: Color(0xff5a5278),
                     title: GtText(text: 'Survey')),
                 body: Container(
                    height: double.infinity,
                    width:  double.infinity,
                    child: GtSurveyKit(
                       apiData: '''{"title":"question12","description":"SURVEY DESCRIPTION","logoPosition":"right","pages":[{"name":"page1","elements":[{"type":"text","name":"question1","title":"question1 TITLE","description":"question1 Description","correctAnswer":"CORRECT ANSWER","isRequired":true},{"type":"text","name":"question2","title":"question2 TITLE","description":"question2 DESCRIPTION","correctAnswer":"CORRECT ANSWER","isRequired":true,"inputType":"datetime"},{"type":"checkbox","name":"question3","title":"question3 CHECKBOX","description":"question3 CHECKBOX DESC","correctAnswer":["item1","item2"],"choices":["item1","item2","item3"],"hasOther":true,"hasSelectAll":true,"maxSelectedChoices":12},{"type":"radiogroup","name":"question4","choices":["item1","item2","item3"]},{"type":"dropdown","name":"question5","choices":["item1","item2","item3"]},{"type":"rating","name":"question6"},{"type":"ranking","name":"question7","choices":["item1","item2","item3"]},{"type":"imagepicker","name":"question8","choices":[{"value":"lion","imageLink":"https://surveyjs.io/Content/Images/examples/image-picker/lion.jpg"},{"value":"giraffe","imageLink":"https://surveyjs.io/Content/Images/examples/image-picker/giraffe.jpg"},{"value":"panda","imageLink":"https://surveyjs.io/Content/Images/examples/image-picker/panda.jpg"},{"value":"camel","imageLink":"https://surveyjs.io/Content/Images/examples/image-picker/camel.jpg"}]},{"type":"image","name":"question9","imageLink":"https://surveyjs.io/Content/Images/examples/image-picker/lion.jpg"},{"type":"matrix","name":"question10","correctAnswer":{"Row 1":"Column 1","Row 2":"Column 1"},"columns":["Column 1","Column 2","Column 3"],"rows":["Row 1","Row 2"]},{"type":"matrixdropdown","name":"question11","columns":[{"name":"Column 1"},{"name":"Column 2"},{"name":"Column 3"}],"choices":[1,2,3,4,5],"rows":["Row 1","Row 2"]},{"type":"html","name":"question12"}],"questionTitleLocation":"top","title":"PAGE 1","description":"PAGE 1 Description"},{"name":"page2","title":"PAGE 2"}],"showPageNumbers":true,"showProgressBar":"top","progressBarType":"requiredQuestions","questionStartIndex":"1","maxTimeToFinish":12,"maxTimeToFinishPage":2,"showTimerPanel":"top"}''',
                       submitData: (data){
                          print("User Side data");
                          print(data);
                       },
                    ),
                 ));
           }
        }

  ```

  - Step 3 : Result :

    ![GtSurveyKit](https://user-images.githubusercontent.com/64594463/126281733-662cc42d-33ff-4903-891d-205de4632856.png)

    ![GtSurveyKit1](https://user-images.githubusercontent.com/64594463/126281839-d8149d79-4947-4c80-bce8-c6c172ef3754.png)

    ![GtSurveyKit2](https://user-images.githubusercontent.com/64594463/126282052-ce846ff7-d602-437b-be36-957acd9f4cb6.png)

# GtMarquee Widget

The gtmarquee widget is used represent the array of list scrolling vertical on the Screen with ontap return array index.

- Benefits of GtMarquee Widget
  - Handles the font size of the text in dynamic way based on the screen resolution when specified along with required text array.
- Constructors:

```
   - [GtMarquee](components.md#gtmarquee-widget)({Key key,
         this.textList = const [],
         this.textSpanList = const [],
         this.fontSize = 14.0,
         this.textColor,
         this.scrollDuration = const Duration(seconds: 1),
         this.stopDuration = const Duration(seconds: 3),
         this.tapToNext = false,
         this.controllerMar,});
```

- Input Parameters of GtMarquee Widget
  - **textList** - List<String> - This is string list as scroll the texts.
  - **textSpanList** - List<TextSpan> - It well show textSpan List in scrollig vertical.
  - **fontSize** - double - This is String List font size showing in UI, Default is 14.0.
  - **textColor** - Color - Its Showing text color.
  - **scrollDuration** - Duration - This is Scrolling duration for array of String list, Default is Duration(seconds: 1).
  - **stopDuration** - Duration - This is Scrolling Stoped duration for array of String list, Default is Duration(seconds: 3).
  - **tapToNext** - bool - Next scroll value is showing for it, Default is false.
  - **controllerMar** - MarqueeModel - This is model class its return position index.
- Example

  - Step 1 : Import core in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtMarquee widget.

  ```dart
        class ScrollDemo extends StatelessWidget {
           @override
           Widget build(BuildContext context) {
              var controller1 = MarqueeModel();
             return Scaffold(
                 appBar: GtAppBar(
                     backgroundColor: Color(0xff5a5278),
                     title: GtText(text: 'Scrolling Marquee widget')),
                 body: Column(
                    children:[
                       GestureDetector(
                          child: Container(
                             height: 40.0,
                             color: Colors.lightBlueAccent.shade100,
                             child: GtMarquee(
                                textList: ["ROCK ", "SAM", "VIN", "JJJ"],
                                scrollDuration: Duration(seconds: 3), // every scroll
                                stopDuration: Duration(milliseconds: 100), //every stop
                                tapToNext: false, // tap to next
                                controllerMar: controller1, // the controller can get the
                             ),
                          ),
                          onTap: (){
                             print(controller1.position);
                          }
                       ),
                    ]
                 ));
           }
        }

  ```

  - Step 3 : Result :

    ![GtMarquee](https://user-images.githubusercontent.com/64594463/131613045-4b296dca-9e44-4a31-94c4-0e324ac7e4d7.mp4)

# GtPdfWidget Widget

The gtpdfwidget widget It can create a full multi-pages document with graphics, images, and text using TrueType fonts. With the ease of use you.

- Add below Script paths Web/index.html file in your Project.

  ```dart
   <script src="//cdnjs.cloudflare.com/ajax/libs/pdf.js/2.8.335/pdf.min.js"></script>
   <script type="text/javascript">
         pdfjsLib.GlobalWorkerOptions.workerSrc = "//cdnjs.cloudflare.com/ajax/libs/pdf.js/2.8.335/pdf.worker.min.js";
   </script>

  ```

- a low-level Pdf creation library that takes care of the pdf bits generation.
- a Widgets system similar to Flutter's, for easy high-level Pdf creation.
- Constructors:

```
   - [GtPdfWidget](components.md#gtpdfwidget-widget)({
                  this.maxPageWidth,
                  @required this.pdfData,
                  this.onShared,
                  this.actions,
                  this.useActions = true,
                  this.allowPrinting = true,
                  this.allowSharing = true,
                  this.canChangeOrientation = true,
                  this.canChangePageFormat = true,
                  this.canDebug = true,
                  this.loadingWidget,
                  this.pdfPreviewPageDecoration,
                  this.pdfFileName,
                  this.pages,
                  this.padding,
                  this.scrollViewDecoration,
                  this.previewPageMargin,
                  this.onError,
                  this.onPrintError,
                  this.onPrinted,
                  this.dynamicLayout = true,
                  this.shouldRepaint = false,
                  this.initialPageFormat,
                  this.pageFormats = _defaultPageFormats,
                  this.shareActionExtraBody,
                  this.shareActionExtraSubject,
                  this.shareActionExtraEmails,});
```

- Input Parameters of GtPdfWidget Widget

  - maxPageWidth - maxPageWidth - This is Maximum width of the pdf document on screen.
  - pdfData - PdfData - This is class For Preparing PDf Preview in data.

    - PdfData Constructors:

      - [PdfData]()({
        @required this.baseColor,
        @required this.accentColor,
        this.pdfHeader,
        this.pdfFooter,
        @required this.data,
        @required this.pdfBody,
        this.pageMargin});

        - **baseColor** - PdfColor - This is color of pdf base color and this is required parameter.
        - **accentColor** - PdfColor - This is color of pdf accent color and This also required parameter.
        - **pdfHeader** - pdfHeader - This is class of pdfHeader for represent the header section ToMapJson.
          - PdfHeader Constructors:
            - [PdfHeader]({
              this.maxRow,
              this.maxColumn,
              this.pdfHeaderFields,
              });
              - **maxRow** - int - This is shows max rows of PdfHEaderFields.
              - **maxColumn** - int - This is shows max Columns of PdfHEaderFields.
              - **pdfHeaderFields** - PdfHeaderField - This is class of PdfHeaderField for represent header section toMapJson.
                - [PdfHeaderField]()({
                  this.row,
                  this.column,
                  this.valuePath,
                  this.defaultValue,
                  this.fieldType = GTHeaderFieldType.TITLE,
                  this.padding,
                  this.height,
                  this.alignment,
                  this.pdfTable,
                  this.valueTextStyle,
                  this.keyTextStyle,
                  this.displayKey = false,
                  this.tableCellAlignment = pw.Alignment.centerLeft,
                  this.tableHeaderDecoration = const pw.BoxDecoration(
                  borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
                  color: PdfColors.teal
                  ),
                  this.tableHeaderHeight = 25,
                  this.tableCellHeight = 20,
                  this.tableCellAlignments = const {
                  0: pw.Alignment.center,
                  1: pw.Alignment.center,
                  2: pw.Alignment.center,
                  3: pw.Alignment.center,
                  4: pw.Alignment.center,
                  },
                  this.tableHeaderStyle = const pw.TextStyle(fontSize: 10,),
                  this.tableCellStyle = const pw.TextStyle(fontSize: 10,),
                  this.tableRowDecoration = const pw.BoxDecoration(
                  border: pw.Border(
                  bottom: pw.BorderSide(
                  color: PdfColors.blueGrey900,
                  width: .5,
                  ),
                  ),
                  ),
                  this.lineDecoration = const pw.BoxDecoration(
                  border: pw.Border(top: pw.BorderSide(
                  )),
                  ),
                  this.imageProvider,
                  this.key = "",
                  this.headerFieldKeyValueFormat = GtHeaderFieldKeyValueFormat.COLUMN,
                  });
                  - **row** - int - This is contains where row have to display this field.
                  - **column** - int - This is contains where column have to display this field.
                  - **valuePath** - String - This is define which is Field map with valuePath.
                  - **defaultValue** - String - This disply default value.
                  - **fieldType** - GTHeaderFieldType - This is show field type, Defualt was GTHeaderFieldType.TITLE.
                  - **padding** - EdgeInsets - This is margin for field.
                  - **heigh**t - double - This is represented a field height.
                  - **alignment** - Alignment - This represented to align the field as field spacing.
                  - **pdfTable** - Map<String, PdfTable> - This toMapJson for table field as display field.
                    - pdfTable Constructors:
                      - [PdfTable]()({
                        this.valuePath,
                        this.padding,
                        this.height,
                        this.alignment,
                        this.pdfTableColumnType = GtPdfTableColumnType.STRING,
                        this.defualtCurrency = "",
                        });
                        - **valuePath** - String - This is define which is Field map with valuePath.
                        - **padding** - EdgeInsets - This is margin for field.
                        - **height** - double - This define table height.
                        - **alignment** - Alignment - This is represent to table alignment.
                        - **pdfTableColumnType** - GtPdfTableColumnType - This is enum parameter and it will define table field type like String or Currency, and default type is String.
                        - **defualtCurrency** - String - This is when pdfTableColumnType parameter passed GtPdfTableColumnType.CURRENCY then it will add defaultCurrency parametr before value.
                  - **valueTextStyle** - TextStyle - This is style for field value.
                  - **keyTextStyle** - TextStyle - This is style for field key.
                  - **displayKey** - bool - This is displayed field key when passed displayKey is true and default value is false.
                  - **tableCellAlignment** - Alignment - This is table cell alignment to display in aligned and defult align is Alignment.centerLeft.
                  - **tableHeaderDecoration** - BoxDecoration - This is for table header decoration.
                  - **tableHeaderHeight** - double - This represent table header height.
                  - **tableCellHeight** - double - This represent table cell height.
                  - **tableCellAlignments** - Map<int, Alignment> - This is table cell alignments.
                  - **tableHeaderStyle** - TextStyle - This represnt to table header field text style.
                  - **tableCellStyle** - TextStyle - This represnt to table cell field text style.
                  - **tableRowDecoration** - BoxDecoration - This parameter shows table rows decoration.
                  - **lineDecoration** - BoxDecoration - This parameter shows line decoration.
                  - **imageProvider** - ImageProvider - This is shows image to image Field type input.
                  - **key** - String - this display key when displayKey parameter is true then it will display as a key.
                  - **headerFieldKeyValueFormat** - GtHeaderFieldKeyValueFormat - This represented to how to display fields as Column or Row.
        - **pdfFooter** - pdfFooter - This is class of pdfFooter for represent the footer section ToMapJson.
          - pdfFooter Constructors:
            - [pdfFooter]({
              this.maxRow,
              this.maxColumn,
              this.pdfFooterFields,
              });
              - **maxRow** - int - This is shows max rows of PdfHEaderFields.
              - **maxColumn** - int - This is shows max Columns of PdfHEaderFields.
              - **pdfFooterFields** - PdfFooterField - This is class of PdfFooterField for represent header section toMapJson.
                - [pdfFooterFields]()({
                  this.row,
                  this.column,
                  this.valuePath,
                  this.defaultValue,
                  this.fieldType = GTFooterFieldType.TITLE,
                  this.padding,
                  this.height,
                  this.alignment,
                  this.pdfTable,
                  this.valueTextStyle,
                  this.keyTextStyle,
                  this.displayKey = false,
                  this.tableCellAlignment = pw.Alignment.centerLeft,
                  this.tableHeaderDecoration = const pw.BoxDecoration(
                  borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
                  color: PdfColors.teal
                  ),
                  this.tableHeaderHeight = 25,
                  this.tableCellHeight = 20,
                  this.tableCellAlignments = const {
                  0: pw.Alignment.center,
                  1: pw.Alignment.center,
                  2: pw.Alignment.center,
                  3: pw.Alignment.center,
                  4: pw.Alignment.center,
                  },
                  this.tableHeaderStyle = const pw.TextStyle(fontSize: 10,),
                  this.tableCellStyle = const pw.TextStyle(fontSize: 10,),
                  this.tableRowDecoration = const pw.BoxDecoration(
                  border: pw.Border(
                  bottom: pw.BorderSide(
                  color: PdfColors.blueGrey900,
                  width: .5,
                  ),
                  ),
                  ),
                  this.lineDecoration = const pw.BoxDecoration(
                  border: pw.Border(top: pw.BorderSide(
                  )),
                  ),
                  this.key = "",
                  this.footerFieldKeyValueFormat = GtFooterFieldKeyValueFormat.COLUMN,
                  });
                  - **row** - int - This is contains where row have to display this field.
                  - **column** - int - This is contains where column have to display this field.
                  - **valuePath** - String - This is define which is Field map with valuePath.
                  - **defaultValue** - String - This disply default value.
                  - **fieldType** - GTHeaderFieldType - This is show field type, Defualt was GTFooterFieldType.TITLE.
                  - **padding** - EdgeInsets - This is margin for field.
                  - **height** - double - This is represented a field height.
                  - **alignment** - Alignment - This represented to align the field as field spacing.
                  - **pdfTable** - Map<String, PdfTable> - This toMapJson for table field as display field.
                    - pdfTable Constructors:
                      - [PdfTable]()({
                        this.valuePath,
                        this.padding,
                        this.height,
                        this.alignment,
                        this.pdfTableColumnType = GtPdfTableColumnType.STRING,
                        this.defualtCurrency = "",
                        });
                        - **valuePath** - String - This is define which is Field map with valuePath.
                        - **padding** - EdgeInsets - This is margin for field.
                        - **height** - double - This define table height.
                        - **alignment** - Alignment - This is represent to table alignment.
                        - **pdfTableColumnType** - GtPdfTableColumnType - This is enum parameter and it will define table field type like String or Currency, and default type is String.
                        - **defualtCurrency** - String - This is when pdfTableColumnType parameter passed GtPdfTableColumnType.CURRENCY then it will add defaultCurrency parametr before value.
                  - **valueTextStyle** - TextStyle - This is style for field value.
                  - **keyTextStyle** - TextStyle - This is style for field key.
                  - **displayKey** - bool - This is displayed field key when passed displayKey is true and default value is false.
                  - **tableCellAlignment** - Alignment - This is table cell alignment to display in aligned and defult align is Alignment.centerLeft.
                  - **tableHeaderDecoration** - BoxDecoration - This is for table header decoration.
                  - **tableHeaderHeight** - double - This represent table header height.
                  - **tableCellHeight** - double - This represent table cell height.
                  - **tableCellAlignments** - Map<int, Alignment> - This is table cell alignments.
                  - **tableHeaderStyle** - TextStyle - This represnt to table header field text style.
                  - **tableCellStyle** - TextStyle - This represnt to table cell field text style.
                  - **tableRowDecoration** - BoxDecoration - This parameter shows table rows decoration.
                  - **lineDecoration** - BoxDecoration - This parameter shows line decoration.
                  - **key** - String - this display key when displayKey parameter is true then it will display as a key.
                  - **footerFieldKeyValueFormat** - GtFooterFieldKeyValueFormat - This represented to how to display fields as Column or Row.
        - **data** - dynamic - This is required parameter for showing tomapJson fields from data.
        - **pdfBody** - pdfBody - This is class of pdfBody for represent the body section ToMapJson.
          - pdfBody Constructors:
            - [pdfBody]({
              this.maxRow,
              this.maxColumn,
              this.pdfBodyFields,
              });
              - **maxRow** - int - This is shows max rows of PdfHEaderFields.
              - **maxColumn** - int - This is shows max Columns of PdfHEaderFields.
              - **pdfBodyFields** - pdfBodyFields - This is class of pdfBodyFields for represent header section toMapJson.
                - PdfBodyField({
                  this.row,
                  this.column,
                  this.valuePath,
                  this.defaultValue,
                  this.fieldType = GTBodyFieldType.TITLE,
                  this.padding,
                  this.height,
                  this.alignment,
                  this.pdfTable,
                  this.valueTextStyle,
                  this.keyTextStyle,
                  this.displayKey = false,
                  this.tableCellAlignment = pw.Alignment.center,
                  this.tableBodyDecoration = const pw.BoxDecoration(
                  borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
                  color: PdfColors.teal
                  ),
                  this.tableBodyHeight = 25,
                  this.tableCellHeight = 20,
                  this.tableCellAlignments = const {
                  0: pw.Alignment.center,
                  1: pw.Alignment.center,
                  2: pw.Alignment.center,
                  3: pw.Alignment.center,
                  4: pw.Alignment.center,
                  },
                  this.tableBodyStyle = const pw.TextStyle(fontSize: 10,),
                  this.tableCellStyle = const pw.TextStyle(fontSize: 10,),
                  this.tableRowDecoration = const pw.BoxDecoration(
                  border: pw.Border(
                  bottom: pw.BorderSide(
                  color: PdfColors.blueGrey900,
                  width: .5,
                  ),
                  ),
                  ),
                  this.lineDecoration = const pw.BoxDecoration(
                  border: pw.Border(top: pw.BorderSide(
                  )),
                  ),
                  this.cellDecoration,
                  this.key,
                  this.bodyFieldKeyValueFormat = GtBodyFieldKeyValueFormat.COLUMN,
                  this.decoration,
                  });
                  - **row** - int - This is contains where row have to display this field.
                  - **column** - int - This is contains where column have to display this field.
                  - **valuePath** - String - This is define which is Field map with valuePath.
                  - **defaultValue** - String - This disply default value.
                  - **fieldType** - GTHeaderFieldType - This is show field type, Defualt was GTBodyFieldType.TITLE.
                  - **padding** - EdgeInsets - This is margin for field.
                  - **height** - double - This is represented a field height.
                  - **alignment** - Alignment - This represented to align the field as field spacing.
                  - **pdfTable** - Map<String, PdfTable> - This toMapJson for table field as display field.
                    - pdfTable Constructors:
                      - [PdfTable]()({
                        this.valuePath,
                        this.padding,
                        this.height,
                        this.alignment,
                        this.pdfTableColumnType = GtPdfTableColumnType.STRING,
                        this.defualtCurrency = "",
                        });
                        - **valuePath** - String - This is define which is Field map with valuePath.
                        - **padding** - EdgeInsets - This is margin for field.
                        - **height** - double - This define table height.
                        - **alignment** - Alignment - This is represent to table alignment.
                        - **pdfTableColumnType** - GtPdfTableColumnType - This is enum parameter and it will define table field type like String or Currency, and default type is String.
                        - **defualtCurrency** - String - This is when pdfTableColumnType parameter passed GtPdfTableColumnType.CURRENCY then it will add defaultCurrency parametr before value.
                  - **valueTextStyle** - TextStyle - This is style for field value.
                  - **keyTextStyle** - TextStyle - This is style for field key.
                  - **displayKey** - bool - This is displayed field key when passed displayKey is true and default value is false.
                  - **tableCellAlignment** - Alignment - This is table cell alignment to display in aligned and defult align is Alignment.centerLeft.
                  - **tableHeaderDecoration** - BoxDecoration - This is for table header decoration.
                  - **tableHeaderHeight** - double - This represent table header height.
                  - **tableCellHeight** - double - This represent table cell height.
                  - **tableCellAlignments** - Map<int, Alignment> - This is table cell alignments.
                  - **tableHeaderStyle** - TextStyle - This represnt to table header field text style.
                  - **tableCellStyle** - TextStyle - This represnt to table cell field text style.
                  - **tableRowDecoration** - BoxDecoration - This parameter shows table rows decoration.
                  - **lineDecoration** - BoxDecoration - This parameter shows line decoration.
                  - **key** - String - this display key when displayKey parameter is true then it will display as a key.
                  - **decoration** - BoxDecoration - This is Field decoration to display.
                  - **bodyFieldKeyValueFormat** - GtBodyFieldKeyValueFormat - This represented to how to display fields as Column or Row.
        - **pageMargin** - pw.EdgeInsets - This is for page padding and margin on screen.

  - **onShared** - Function(BuildContext, PdfData) - Called if the user shares the pdf document.
  - **actions** - List<PdfPreviewAction> - Additionnal actions to add to the widget.
  - **useActions** - bool - This is Allow disable actions, and this is default true.
  - **allowPrinting** - bool - Add a button to print the pdf document, and this is default true.
  - **allowSharing** - bool - Add a button to print the pdf document, and this is default true.
  - **canChangeOrientation** - bool - Add a switch to change the page orientation, and this is default true.
  - **canChangePageFormat** - bool - Add a drop-down menu to choose the page format, and this is default true.
  - **canDebug** - bool - Add a switch to show debug view, and this is default true.
  - **loadingWidget** - Widget - Custom loading widget to use that is shown while PDF is being generated. If null, a [CircularProgressIndicator] is used instead.
  - **pdfPreviewPageDecoration** - Decoration - Decoration of PdfPreviewPage,
  - **pdfFileName** - String - Name of the PDF when sharing. It must include the extension.
  - **pages** - List<int> - Pages to display. Default will display all the pages.
  - **padding** - EdgeInsets - padding for the pdf_preview widget.
  - **scrollViewDecoration** - Decoration - Decoration of scrollView.
  - **previewPageMargin** - EdgeInsets - margin for the document preview page.
  - **onError** - Widget Function(BuildContext, Object) - Widget to display if the PDF document cannot be displayed.
  - **onPrintError** - Function(BuildContext, dynamic) - Called if an error creating the Pdf occured.
  - **onPrinted** - Function(BuildContext) - Called if the user prints the pdf document.
  - **dynamicLayout** - bool - Request page re-layout to match the printer paper and margins. Mitigate an issue with iOS and macOS print dialog that prevent any channel message while opened.
  - **shouldRepaint** - bool - Force repainting the PDF document.
  - **initialPageFormat** - PdfPageFormat - Pdf page format asked for the first display.
  - **pageFormats** - Map<String, PdfPageFormat> - List of page formats the user can choose.
  - **shareActionExtraBody** - String - extra text to share with Pdf document.
  - **shareActionExtraSubject** - String - email subject when email application is selected from the share dialog.
  - **shareActionExtraEmails** - List<String> - list of email addresses which will be filled automatically if the email application is selected from the share dialog. This will work only for Android platform.

- Example

  - Step 1 : Import UI KIT in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
     import 'package:pdf/pdf.dart';
     import 'package:printing/printing.dart';
     import 'package:pdf/widgets.dart' as pw;
  ```

  - Step 2 : Binding

  ```dart
     class PdfBinding extends Bindings {
        @override
        void dependencies() {
           Get.put(PdfViewController());
        }
     }
  ```

  - Step 3 : PdfViewController.

  ```dart
     import 'package:flutter/material.dart';
     import 'package:get/get.dart';
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
     import 'package:pdf/widgets.dart' as pw;

     class PdfViewController  extends GetxController with StateMixin<PdfData> {

     PdfViewController();
     late PdfData pdfData;
     late PdfHeader pdfHeader;
     @override
     void onInit() {
        fetchData();
        super.onInit();
     }


     fetchData() async {
        var data = {
                 "FOOTER1" : "PLEASE RETURN PALLET TO US.",
                 "Logo" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTiUcsj-qK63qtTWHVLjtPS_85rVsIOvI8Jg&usqp=CAU",
                 "Logo1" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkIqTOPtGnf2bb2ZUnFIx9umgPhUM4qaYqog&usqp=CAU",
                 "Status" : "CHECKING ACCOUNT STATEMENT",
                 "Title" : "MY FIRST BANK LTD",
                 "Address": "WEI-CHUAN U.S.A., INC 955 Norcross Industrial Ct STE A Norcross, GA 30071 TEL: (770) 840-668",
                 "Name": "Rahul K.",
                 "billto" : "ASIAN MARKET \nASHEVILLE 22 NEW LEICESTER HWY Asheville, NC  28806 TEL: (828) 785-1653 FAX:",
                 "tableHeaderDatabank" : [{
                 "statementperiod" : "2003-10-19 to 2003-11-08",
                 "accountno" : 1234566665654654,
                 }],
              "tableBodyDatabank" : [{
                 "date" : "2003-10-08",
                 "desc" : "Prevoius balance",
                 "ref" : "",
                 "with" : "",
                 "dep" : "",
                 "bal" : "0.55",
                 },{
                 "date" : "2003-10-14",
                 "desc" : "Payroll Deposit - HOTEL",
                 "ref" : "",
                 "with" : "",
                 "dep" : "694.30",
                 "bal" : "694.85",
                 },{
                 "date" : "2003-10-14",
                 "desc" : "Payroll Deposit - HOTEL",
                 "ref" : "",
                 "with" : "",
                 "dep" : "694.30",
                 "bal" : "694.85",
                 },{
                 "date" : "2003-10-14",
                 "desc" : "Payroll Deposit - HOTEL",
                 "ref" : "",
                 "with" : "",
                 "dep" : "694.30",
                 "bal" : "694.85",
                 },{
                 "date" : "2003-10-14",
                 "desc" : "Payroll Deposit - HOTEL",
                 "ref" : "",
                 "with" : "",
                 "dep" : "694.30",
                 "bal" : "694.85",
                 },
                 ],
              };

           pdfHeader = PdfHeader(
                 maxColumn: 2,
                 maxRow: 4,
                 pdfHeaderFields: [
                 PdfHeaderField(
                    column: 2,
                    row: 1,
                    defaultValue: "",
                    valuePath: "Title",
                    alignment: pw.Alignment.centerLeft,
                 ),
                 PdfHeaderField(
                    column: 1,
                    row: 2,
                    defaultValue: "",
                    valuePath: "Address",
                    fieldType: GTHeaderFieldType.SUBTITLE,
                    padding: const pw.EdgeInsets.only(right: 40),
                    alignment: pw.Alignment.centerLeft,
                    valueTextStyle: const pw.TextStyle(color: PdfColors.black, fontSize: 10,)
                 ),
                 PdfHeaderField(
                    column: 2,
                    row: 2,
                    defaultValue: "",
                    valuePath: "Status",
                    fieldType: GTHeaderFieldType.SUBTITLE,
                    alignment: pw.Alignment.centerRight,
                    valueTextStyle: const pw.TextStyle(color: PdfColors.black, fontSize: 10)
                 ),
                 PdfHeaderField(
                    column: 1,
                    row: 3,
                    defaultValue: "",
                    valuePath: "billto",
                    height: 100,
                    fieldType: GTHeaderFieldType.SUBTITLE,
                    padding: const pw.EdgeInsets.only(right: 70,top: 20,bottom: 20),
                    alignment: pw.Alignment.centerLeft,
                    keyTextStyle: const pw.TextStyle(color: PdfColors.red300, fontSize: 12),
                    valueTextStyle: const pw.TextStyle(color: PdfColors.black, fontSize: 12)
                 ),
                 PdfHeaderField(
                    column: 2,
                    row: 3,
                    defaultValue: "",
                    tableHeaderDecoration: const pw.BoxDecoration(
                       borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
                       color:  PdfColors.blueGrey200
                    ),
                    valuePath: "tableHeaderDatabank",
                    fieldType: GTHeaderFieldType.TABLE,
                    height: 100,
                    pdfTable: {
                       "Statement period" : PdfTable(
                       valuePath: "statementperiod",
                       ),
                       "Account No" : PdfTable(
                       valuePath: "accountno",
                       ),
                    }
                 ),
                 PdfHeaderField(
                    column: 1,
                    row: 1,
                    defaultValue: "",
                    valuePath: "Logo",
                    height: 50,
                    alignment: pw.Alignment.topRight,
                    fieldType: GTHeaderFieldType.IMAGE,
                 ),
                    PdfHeaderField(
                    column: 2,
                    row: 4,
                    defaultValue: "",
                    valuePath: "Logo1",
                    height: 50,
                    alignment: pw.Alignment.centerLeft,
                    fieldType: GTHeaderFieldType.IMAGE,
                 ),
                 ]
              );

           pdfHeader.pdfHeaderFields.forEach((element) async {
           if(element.fieldType  == GTHeaderFieldType.IMAGE){
              var value = Common.getValue(data,element.valuePath);
              element.imageProvider = await getImage(value);
           }
           });

           pdfData = PdfData(
              pageMargin: const pw.EdgeInsets.only(left: 60, right: 60,top: 20,bottom: 20),
              baseColor: PdfColors.black,
              accentColor: PdfColors.blueGrey900,
              data: data,
              pdfFooter: PdfFooter(
                 maxColumn: 1,
                 maxRow: 7,
                 pdfFooterFields: [
                    PdfFooterField(
                    column: 1,
                    row: 1,
                    defaultValue: "",
                    valuePath: "FOOTER1",
                    height: 12,
                    valueTextStyle: pw.TextStyle(fontSize: 8,color: PdfColors.black, fontWeight: pw.FontWeight.bold ),
                    alignment: pw.Alignment.centerLeft,
                    // fieldType: GTHeaderFieldType.IMAGE,
                 ),
                 ]
              ),
              pdfBody: PdfBody(
                 maxColumn: 1,
                 maxRow: 3,
                 pdfBodyFields: [
                 PdfBodyField(
                    column: 1,
                    row: 1,
                    defaultValue: "",
                    valuePath: "tableBodyDatabank",
                    fieldType: GTBodyFieldType.TABLE,
                    tableBodyDecoration: const pw.BoxDecoration(
                       borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
                       color:  PdfColors.blueGrey200
                    ),
                    pdfTable: {
                       "Date" : PdfTable(
                       valuePath: "date",
                       ),
                       "Description" : PdfTable(
                       valuePath: "desc",
                       ),
                       "Ref." : PdfTable(
                       valuePath: "ref",
                       ),
                       "Withdrawals" : PdfTable(
                       valuePath: "with",
                       ),
                       "Deposits" : PdfTable(
                       valuePath: "dep",
                       ),
                       "Balance" : PdfTable(
                       valuePath: "bal",
                       )
                    }
                 ),
                 PdfBodyField(
                    column: 1,
                    row: 1,
                    defaultValue: "",
                    valuePath: "billto",
                    fieldType: GTBodyFieldType.SUBTITLE,
                    padding: pw.EdgeInsets.all(20)

                 ),
                 ]
              ),
              pdfHeader: pdfHeader
           );
           change(pdfData, status: RxStatus.success());
     }
     Future<pw.ImageProvider> getImage(String value) async{
        return await flutterImageProvider(NetworkImage(value));
     }
     }
  ```

  - Step 4 : Used GtPdfWidget widget and specify the PdfPreviewPage to be displayed.

  ```dart
        import 'dart:convert';
        import 'package:flutter/material.dart';
        import 'package:get/get.dart';
        import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
        import 'package:pdf_widget_creator/pdf_controller.dart';
        import 'package:pdf/widgets.dart' as pw;
        import 'package:pdf/src/pdf/page_format.dart';

        class PdfPage extends GetView<PdfViewController> {

        @override
        Widget build(BuildContext context) {
           return Scaffold(
              appBar: AppBar(title: Text('PDF')),
              body: Container(
              child: controller.obx(
                 (state) => GtPdfWidget(
              initialPageFormat: PdfPageFormat.a4,
              maxPageWidth: 900,
              canChangeOrientation: false,
              pdfFileName: "samplePDF.pdf",
              actions: [
                 PdfPreviewAction(
                    icon: Icon(Icons.mail),
                    onPressed: (context, build, page) async {
                    final bytes = await build(page);
                    final Encoded = base64.encode(bytes); // returns base64 string
                    }
                 )
              ],
              pdfData: state,
              ),
                 onLoading: Center(child: CircularProgressIndicator()),
                 onError: (ss) => Center(
                    child: Text(
                    'Erro ao consultar os Estados do Brasil',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                    ),
                 ),
              ),
              ),
           );
        }
     }

  ```

  - Step 5 : Result :

    ![GtPdfWidget](https://user-images.githubusercontent.com/64594463/141726456-02b2e3cf-d152-4a76-816d-ed396cb12918.png)

# GtDropdownSearch Widget

The gtdropdownsearch widget is used represent the searchable dropdown array of list on the Screen with ontap.

- Benefits of GtDropdownSearch Widget
- Constructors:
  - [GtDropdownSearch](components.md#gtdropdownsearch-widget)({

```
      @required this.textEditingController,
      this.inputDecoration,
      this.onChangeHandler,
      this.suffixIcon,
      this.suffixOnPressed,
      this.itemDatawidget,
      this.itemOnTapHandler,
      this.dropDownResult,
      this.fieldLabel = "",
      this.textFieldOnTapHandler,
      this.dropdownWidth = 100,
      this.dropdownheight = 200,
      @required this.keyLabel,
      this.dropdownElevation = 1.0,
      this.dropDownBackgroundColor,
      this.dropDownShapeBorder,
      this.looupKeyVisibile = false,
      @required this.lookupFields,
      this.type = GtDropDownSearchIsCustom.DEFAULT,});
```

- Input Parameters of GtDropdownSearch Widget
  - **textEditingController** - TextEditingController - This is text form field controller to search the text.
  - **inputDecoration** - InputDecoration - It well show decoration for search dropdown widget.
  - **onChangeHandler** - Function(dynamic) - This is on change function for search text.
  - **suffixIcon** - Widget - Its Showing suffix widget for dropdown.
  - **suffixOnPressed** - Function(dynamic) - This is suffix widget on Pressed function.
  - **itemDatawidget** - Function(int, dynamic) - This is custom builder for each item for dropdown item.
  - **itemOnTapHandler** - Function(int) - This is dropdown item on tap handler.
  - **dropDownResult** - List<dynamic> - This is dropdown list.
  - **fieldLabel** - String - field label name for showing dropdown label.
  - **textFieldOnTapHandler** - Function - text field on tap handler for searchable dropdown field.
  - **dropdownWidth** - double - This is width of drop dwon showing in below.
  - **dropdownheight** - double - This is height of drop dwon showing in below.
  - **keyLabel** - String - This is key for each widget have diffrenet and unique key.
  - **dropdownElevation** - double - This is elevation for dropdown.
  - **dropDownBackgroundColor** - Color - This is background color for dropdown.
  - **dropDownShapeBorder** - ShapeBorder - This is Shape border for UI design.
  - **looupKeyVisibile** - bool - This is Lookup key define to display key for field.
  - **lookupFields** - Map<String, String> - This is for which field have to display in dropdown.
  - **type** - GtDropDownSearchIsCustom - This is type to show dropdown content is CUSTOM or Default.
- Example

  - Step 1 : Import UI KIT in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtDropdownSearch widget.

  ```dart
        class DropDownSearchable extends StatelessWidget {
           @override
           Widget build(BuildContext context) {
              var controller1 = MarqueeModel();
             return Scaffold(
                 appBar: GtAppBar(
                     backgroundColor: Color(0xff5a5278),
                     title: GtText(text: 'Scrolling Marquee widget')),
                 body: Column(
                    children:[
                       GtDropdownSearch(
                          textEditingController: TextEditingController(),
                          dropDownResult: ["fsdshbdc", "sachadgbc", "advcsadf"],
                          itemOnTapHandler: (i){},
                          suffixOnPressed: (data){},
                          textFieldOnTapHandler: (){},
                       ),
                    ]
                 ));
           }
        }

  ```

  - Step 3 : Result :

    ![GtDropdownSearch](https://user-images.githubusercontent.com/64594463/143400038-15a46064-4d03-4a53-8331-d94668d74629.png)

# GtBackDropListView Widget

The gtbackdroplistview widget Can be used to customize the behaviour of the backdrop animation.

- Benefits of GtBackDropListView Widget
- Constructors:

```
   - [GtBackDropListView](components.md#gtbackdroplistview-widget)({
      this.title = '',
      @required this.backLayer,
      @required this.frontLayer,
      this.isPrimary = true,
      this.stickyFrontLayer = true,
      this.headerHeight = 100.0,
      @required this.actionwidgets,
      @required this.scaffoldKey,
      this.isBackDrop = false,
      this.changeBackDrop,
      this.backdropAppBar,
      this.isFilterApplied = false});
```

- Input Parameters of GtBackDropListView Widget
  - **title** - String - This is backdrop AppBar Title text to display.
  - **backLayer** - Widget - This Content that should be displayed on the back layer.
  - **frontLayer** - Widget - The widget that is shown on the front layer.
  - **isPrimary** - bool - See [Scaffold.primary]. Defaults to true.
  - **stickyFrontLayer** - bool - Indicates the front layer should minimize to the back layer's bottom edge. Otherwise, see [headerHeight] to specify this value. Defaults to false. This parameter has no effect if the back layer's measured height is greater than or equal to the screen height.
  - **actionwidgets** - List<Widget> - See [AppBar.actions].
  - **scaffoldKey** - GlobalKey<ScaffoldState> - A key to use when building the [Scaffold].
  - **isBackDrop** - bool - This is backdrop backlay is on then it will true and frontlayer is displayed then it will changes as false.
  - **changeBackDrop** - Function(bool) - This is Change backlayer and FrontLayer function.
  - **backdropAppBar** - BackdropAppBar - See [Scaffold.appBar].
  - **isFilterApplied** - bool - This is when filter is applied on any field it will be true and default value is false.
- Example

  - Step 1 : Import UI KIT in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : Used GtBackDropListView widget.

  ```dart
        class BackDropListView extends StatelessWidget {
           @override
           Widget build(BuildContext context) {
             return Scaffold(
                 appBar: GtAppBar(
                     backgroundColor: Color(0xff5a5278),
                     title: GtText(text: '')),
                 body: Column(
                    children:[
                        GtBackDropListView(
                          frontLayer: GtListPage(
                             rowsCount: 2,
                             leadingIcon: GtIcon(
                             icondata: Icons.account_circle_rounded,
                             ),
                             isLeadingShow: false,
                             listItems: [{"Id": 2093,"CompanyId": 0,"Code": "GT0521","FName": "DEMO USER",},
                             {"Id": 2093,"CompanyId": 0,"Code": "GT011","FName": "DEMO MANAGER",}],
                             viewtype: ViewType.list,
                             toMapjson: {
                             'Name': GtTileField(
                                valuePath: 'FName',
                                row: 1,
                                flex: 4,
                                mobileRow: 1,
                                mobileFlex: 3,
                                cardRow: 1,
                                type: GtFieldType.STRING,
                                keyTextStyle: TextStyle(color: Colors.black,fontSize: 15),
                                valueTextStyle: TextStyle(color: Colors.black,fontSize: 16),
                                keyTextAlign: TextAlign.start,
                                valueTextAlign: TextAlign.end,
                                displayKey: true,
                                keyValueBetween: " : ",
                             ),
                             'Code': GtTileField(
                                valuePath: 'Code',
                                row: 1,
                                flex: 4,
                                mobileRow: 2,
                                mobileFlex: 3,
                                cardRow: 1,
                                type: GtFieldType.STRING,
                                keyTextStyle: TextStyle(color: Colors.black,fontSize: 15),
                                valueTextStyle: TextStyle(color: Colors.black,fontSize: 16),
                                keyTextAlign: TextAlign.start,
                                valueTextAlign: TextAlign.end,
                                displayKey: true,
                                keyValueBetween: " : ",
                             ),
                             },
                             tag: "Task",
                             isSpaceInRecords: true,
                             isleadingIconPosition: false,
                             size: Get.size,
                             cardColor: Colors.blueGrey[200],
                             backButtonColor: Colors.white,
                          ),
                          backLayer: GtText(text: "BACK LAYER", textStyle: TextStyle(fontSize: 30),),
                          backdropAppBar: BackdropAppBar(
                             title: GtText(text: "LISTVIEW"),
                          ),
                       )
                    ]
                 ));
           }
        }

  ```

  - Step 3 : Result :

    ![GtDropdownSearch](https://user-images.githubusercontent.com/64594463/144994509-82f17b3f-7ddb-4db1-bd2a-b910b1fece85.png)

    ![GtDropdownSearch](https://user-images.githubusercontent.com/64594463/144994523-d4892026-7f9a-4ba8-9121-a0e86317f84e.png)

# GtListFilter Widget

The GtListFilter widget is used represent the Filter field for the Listview.

- Benefits of gtlistfilter Widget
- Constructors:

```
   - [GtListFilter](components.md#gtlistfilter-widget)({
      this.filterHandler,
      this.isFilterProcessing,
      this.rangeFilterDivisions = 10,
      this.rangeFilterLimits,
      this.toMapjson,
      this.listItems,
      this.onFilterClearHandler,
      this.selectedlookupData,
      this.lookupData,
      this.onDeleteHandler,
      this.getSuggestions,
      this.setselectedLookupDataValues,
      this.scrollController,
      this.isBackDropController = false,
      this.advanceFilterFields,
      this.isAdvanceFilterEnable = false,
      this.advanceFilterTitle = "Advanced Filter",
      this.addButtonText = "Add",
      this.quickFilterTitle = "Quick Filter",
      this.filterTitle = "Filter",
      this.applyButtonText = "Apply",
      this.clearButtonText = "Clear All",
      this.operatorString,
      this.operatorCommon,
      this.operatorNumeric,
      this.changeBackDrop,
      @required this.keyLabel,
      this.isBackDrop = false,
      this.filterData,});
```

- Input Parameters of GtListFilter Widget
  - **filterHandler** - Function(Map<String, dynamic>, List<Map<String, dynamic>>) - This is handle the Listview response as changes quick filter and Advnace Filter data.
  - **isFilterProcessing** - bool - This Indicates Filter applyed is processing flag.
  - **rangeFilterDivisions** - int - This is Rage Filter Divisions Typically used with [labels] to show the current discrete values.
  - **rangeFilterLimits** - Map<String, RangeValues> - This Shows Range Filter Limits with name and RageValue.
  - **toMapjson** - Map<String, dynamic> - This represent the Filters fields to Filter the Listview on change.
  - **listItems** - List<dynamic> - This is Listview data to handle Filter as Filter applied.
  - **onFilterClearHandler** - Function(Map<String, dynamic>, List<Map<String, dynamic>>) - This function handle the clear all the Filter conditions.
  - **selectedlookupData** - Map<String, RxList<dynamic>> - This indicates the GtFilterType.LOOK_UP_FILTER type selected lookup values to display .
  - **lookupData** - RxMap<String, dynamic> - Used to store the lookup data to show the suggetions.
  - **onDeleteHandler** - Function(String, dynamic, {String fieldKey, FocusNode focusNode, bool ismultiSelect, String valuePath}) - This Function is related to GtFilterType.LOOK_UP_FILTER type to delete selected Lookup fields.
  - **getSuggestions** - Function(String, String, Map<String, String>) - It returns the suggestions list for the suggestion form fields.
  - **setselectedLookupDataValues** - Function(String, dynamic, {String fieldKey, bool fromOnChanged, bool ismultiSelect, String valuePath}) - This is Look up Field type to set up the drop down Data.
  - **isBackDrop** - bool - This is flag to display is backdrop is open or close, default is false.
  - **controller** - ScrollController - This An object that can be used to control the position to which this scroll view is scrolled.
  - **changeBackDrop** - Function(bool) - This is change the isBackDrop variable value as per backdrop open and close.
  - **isBackDropController** - bool - It will show backdrop controller is open or close.
  - **advanceFilterFields** - List<GtAdvanceFilterField> - This is Advance filter fields to display in drop down with the type of operators on Add Button click.
  - **isAdvanceFilterEnable** - bool - This is show Advance filter flag to display, and Default value is false.
  - **advanceFilterTitle** - String - This is Advance Filter title text.
  - **addButtonText** - String - This is Advance Filter add button text.
  - **quickFilterTitle** - String - This is Quick Filter title text.
  - **filterTitle** - String - This is main title text.
  - **applyButtonText** - String - This is Apply button text.
  - **clearButtonText** - String - This is Clear button text.
  - **operatorString** - List<GtAdvanceFilterOperator> - This is for String Fields operators.
  - **operatorCommon** - List<GtAdvanceFilterOperator> - This is for Common Fields operators.
  - **operatorNumeric** - List<GtAdvanceFilterOperator> - This is for Numeric Fields operators.
  - **keyLabel** - String - This is for Key label each Widget unique key for controller.
  - **filterData** - Map<String, dynamic> - This will show default selected quick filter.
  - **advanceFilterBlankMessage** - String - This is Valid Fields or Operators not present message.
- Example

  - Step 1 : Import UI KIT in files that it will be used:

  ```dart
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
  ```

  - Step 2 : ListviewFilterController With Quick Filter and Advance Filter.

  ```dart
     import 'package:flutter/material.dart';
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
     import 'package:core/core.dart';
     class ListviewFilterController  extends GetxController with StateMixin {

        ListviewFilterController();

        Rx<List> customerList = Rx<List>([]);
        RxBool isBackDrop =  new RxBool(false);
        List<GtAdvanceFilterOperator> operatorString = new List<GtAdvanceFilterOperator>.empty(growable: true);
        List<GtAdvanceFilterOperator> operatorNumeric = new List<GtAdvanceFilterOperator>.empty(growable: true);
        List<GtAdvanceFilterOperator> operatorCommon = new List<GtAdvanceFilterOperator>.empty(growable: true);
        List<GtAdvanceFilterField> advanceFilterFields = new List<GtAdvanceFilterField>.empty(growable: true);
        RxMap<String, GtTileField> toMapfilterjson = RxMap<String, GtTileField>();
        RxMap<String, dynamic> filtersData = RxMap<String, dynamic>();
        RxBool isFilterApplied = new RxBool(false);
        @override
        void onInit() {
            operatorString = [
              GtAdvanceFilterOperator(
                 label: "LIKE",
                 value: "_like",
                 type: GtAdvanceFilterOperatorType.STRING
              ),
              GtAdvanceFilterOperator(
                 label: "ILIKE",
                 value: "_ilike",
                 type: GtAdvanceFilterOperatorType.STRING
              )
              ];
              operatorNumeric = [
              GtAdvanceFilterOperator(
                 label: "GTE",
                 value: "_gte",
                 type: GtAdvanceFilterOperatorType.NUMERIC
              ),
              GtAdvanceFilterOperator(
                 label: "LTE",
                 value: "_lte",
                 type: GtAdvanceFilterOperatorType.NUMERIC
              )
              ];
              operatorCommon = [
              GtAdvanceFilterOperator(
                 label: "EQUAL",
                 value: "_eq",
                 type: GtAdvanceFilterOperatorType.COMMON
              ),
              GtAdvanceFilterOperator(
                 label: "NEQ",
                 value: "_neq",
                 type: GtAdvanceFilterOperatorType.COMMON
              )
              ];
              advanceFilterFields = [
              GtAdvanceFilterField(
                 label: "FName",
                 value: "FName",
                 type: GtAdvanceFilterFieldOperatorType.STRING
              ),
              GtAdvanceFilterField(
                 label: "code",
                 value: "Code",
                 type: GtAdvanceFilterFieldOperatorType.STRING
              ),
              GtAdvanceFilterField(
                 label: "Id",
                 value: "Id",
                 type: GtAdvanceFilterFieldOperatorType.NUMERIC
              ),
              GtAdvanceFilterField(
                 label: "IsActive",
                 value: "isActive",
                 type: GtAdvanceFilterFieldOperatorType.SELECT,
                 options: [{"TRUE":"true"}, { "FALSE" : "false"}]
              ),
              ];
              toMapfilterjson.value = {
                 "Code": GtTileField(
                    valuePath: "Code",
                    type: GtFieldType.FILTER,
                    filterType: GtFilterType.TEXT_FILTER,
                    filterValue: 'Code',
                    filterLabel: 'Customer Code',
                    textEditingController: new TextEditingController()),
                 "FName": GtTileField(
                    valuePath: "FName",
                    type: GtFieldType.FILTER,
                    filterType: GtFilterType.TEXT_FILTER,
                    filterValue: 'Name',
                    filterLabel: 'Customer Name',
                    textEditingController: new TextEditingController()),
                 "IsActive" : GtTileField(
                    valuePath: "isActive",
                    type: GtFieldType.FILTER,
                    filterType: GtFilterType.RADIO_BUTTON_FILTER,
                    filterItems: {'All': null, 'Active': "true", 'InActive': "false"},
                    filterValue: 'isActive',
                    filterLabel: 'isActive',
                 ),
                 "SortFilter" : GtTileField(
                    filterLabel: "Sort By Field",
                    type: GtFieldType.FILTER,
                    filterType: GtFilterType.SORT_FILTER,
                    filterItems: {
                       'Code': 'Code',
                       'FName': 'FName',
                    },
                    filterValue: 'order_by'
                 ),
              };
           filtersData.value = {"Code": {"_ilike": "%1%"}};

           super.onInit();
        }
        void filterHandlerFunction(Map<String, dynamic> filterDataApply, List<Map<String, dynamic>>  selectedFilterAdvance){
           /// This variables pass to API 
           Map<String, dynamic>? variables = {
        "where": {"_and": []}
      };
           var filterselected = [];
           if(filterDataApply.isEmpty && selectedFilterAdvance.isEmpty){
              isFilterApplied.value = false;
           }
           else{
              isFilterApplied.value = true;
           }
           print(filterDataApply);
           print(selectedFilterAdvance);
            /// Check here For Nasted Filter
           selectedFilterAdvance.forEach((data) {
           if (data["isNastedFilter"] == true) {
           filterselected.add(data["filterNasted"]);
           } else {
           filterselected.add({
              "${data["fieldName"]}": {
                 data["operator"]: data["fieldValue"],
              }
           });
           }
           /// Quick Filter applied map and sort filter
           if (filterDataApply != {} && fromOnInit == false) {
            List<dynamic> quickFilter = new List<dynamic>.empty(growable: true);
            toMapfilterjson.forEach((key, gttilefield) {
              switch (gttilefield.filterType) {
                case GtFilterType.SORT_FILTER:
                  var sortfield = filterDataApply![gttilefield.filterValue];
                  var sortOrder = filterDataApply['sort'];
                  sortFieldFilter = {
                    sortfield: sortOrder.toString().toLowerCase()
                  };
                  break;
              }
            });
            quickFilter = filterDataApply!.entries.map((MapEntry mapEntry) {
              if (mapEntry.key == "sort" || mapEntry.key == "order_by") {
                return {};
              } else {
                return {"${mapEntry.key}": mapEntry.value};
              }
            }).toList();
            print(quickFilter);
            filterselected.addAll(quickFilter);
          }
          variables["where"]["_and"] = filterselected;
        });
        }
        void filterClearHandlerFunction(Map<String, dynamic> filterDataApply, List<Map<String, dynamic>> selectedFilterAdvance ){
           if(filterDataApply.isEmpty && selectedFilterAdvance.isEmpty){
              isFilterApplied.value = false;
           }
           else{
              isFilterApplied.value = true;
           }
           print(filterDataApply);
           print(selectedFilterAdvance);
        }
        void changeBackDrop(bool isback){
           isBackDrop.value = isback;
        }
     }
  ```
   - Step 2 : ListviewFilterController With Quick Filter and Nasted Advance Filter.

  ```dart
     import 'package:flutter/material.dart';
     import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
     import 'package:core/core.dart';
     class ListviewFilterController  extends GetxController with StateMixin {

        ListviewFilterController();

        Rx<List> customerList = Rx<List>([]);
        RxBool isBackDrop =  new RxBool(false);
        List<GtAdvanceFilterOperator> operatorString = new List<GtAdvanceFilterOperator>.empty(growable: true);
        List<GtAdvanceFilterOperator> operatorNumeric = new List<GtAdvanceFilterOperator>.empty(growable: true);
        List<GtAdvanceFilterOperator> operatorCommon = new List<GtAdvanceFilterOperator>.empty(growable: true);
        List<GtAdvanceFilterField> advanceFilterFields = new List<GtAdvanceFilterField>.empty(growable: true);
        RxMap<String, GtTileField> toMapfilterjson = RxMap<String, GtTileField>();
        RxMap<String, dynamic> filtersData = RxMap<String, dynamic>();
        RxBool isFilterApplied = new RxBool(false);
        @override
        void onInit() {
            operatorString = [
              GtAdvanceFilterOperator(
                 label: "LIKE",
                 value: "_like",
                 type: GtAdvanceFilterOperatorType.STRING
              ),
              GtAdvanceFilterOperator(
                 label: "ILIKE",
                 value: "_ilike",
                 type: GtAdvanceFilterOperatorType.STRING
              )
              ];
              operatorNumeric = [
              GtAdvanceFilterOperator(
                 label: "GTE",
                 value: "_gte",
                 type: GtAdvanceFilterOperatorType.NUMERIC
              ),
              GtAdvanceFilterOperator(
                 label: "LTE",
                 value: "_lte",
                 type: GtAdvanceFilterOperatorType.NUMERIC
              )
              ];
              operatorCommon = [
              GtAdvanceFilterOperator(
                 label: "EQUAL",
                 value: "_eq",
                 type: GtAdvanceFilterOperatorType.COMMON
              ),
              GtAdvanceFilterOperator(
                 label: "NEQ",
                 value: "_neq",
                 type: GtAdvanceFilterOperatorType.COMMON
              )
              ];
              advanceFilterFields = [
              GtAdvanceFilterField(
                 label: "FName",
                 value: "FName",
                 type: GtAdvanceFilterFieldOperatorType.STRING
              ),
              /// This is nasted filter field
              GtAdvanceFilterField(
                 label: "City",
                 isNastedFilter: true,
                 value: "address.City",
                 type: GtAdvanceFilterFieldOperatorType.STRING
              ),
              GtAdvanceFilterField(
                 label: "Id",
                 value: "Id",
                 type: GtAdvanceFilterFieldOperatorType.NUMERIC
              ),
              GtAdvanceFilterField(
                 label: "IsActive",
                 value: "isActive",
                 type: GtAdvanceFilterFieldOperatorType.SELECT,
                 options: [{"TRUE":"true"}, { "FALSE" : "false"}]
              ),
              ];
              toMapfilterjson.value = {
                 "Code": GtTileField(
                    valuePath: "Code",
                    type: GtFieldType.FILTER,
                    filterType: GtFilterType.TEXT_FILTER,
                    filterValue: 'Code',
                    filterLabel: 'Customer Code',
                    textEditingController: new TextEditingController()),
                 "FName": GtTileField(
                    valuePath: "FName",
                    type: GtFieldType.FILTER,
                    filterType: GtFilterType.TEXT_FILTER,
                    filterValue: 'Name',
                    filterLabel: 'Customer Name',
                    textEditingController: new TextEditingController()),
                  /// This is nasted filter field 
                  "City": GtTileField(
                    valuePath: "City",
                    type: GtFieldType.FILTER,
                    filterType: GtFilterType.TEXT_FILTER,
                    filterValue: 'address.City',
                    filterLabel: 'City',
                    isNastedFilter: true,
                    textEditingController: new TextEditingController()),
                 "IsActive" : GtTileField(
                    valuePath: "isActive",
                    type: GtFieldType.FILTER,
                    filterType: GtFilterType.RADIO_BUTTON_FILTER,
                    filterItems: {'All': null, 'Active': "true", 'InActive': "false"},
                    filterValue: 'isActive',
                    filterLabel: 'isActive',
                 ),
                 "SortFilter" : GtTileField(
                    filterLabel: "Sort By Field",
                    type: GtFieldType.FILTER,
                    filterType: GtFilterType.SORT_FILTER,
                    filterItems: {
                       'Code': 'Code',
                       'FName': 'FName',
                    },
                    filterValue: 'order_by'
                 ),
              };
           filtersData.value = {"Code": {"_ilike": "%1%"}};

           super.onInit();
        }
        void filterHandlerFunction(Map<String, dynamic> filterDataApply, List<Map<String, dynamic>>  selectedFilterAdvance){
           /// This variables pass to API 
           Map<String, dynamic>? variables = {
        "where": {"_and": []}
      };
           var filterselected = [];
           if(filterDataApply.isEmpty && selectedFilterAdvance.isEmpty){
              isFilterApplied.value = false;
           }
           else{
              isFilterApplied.value = true;
           }
           print(filterDataApply);
           print(selectedFilterAdvance);
            /// Check here For Advance Nasted Filter
           selectedFilterAdvance.forEach((data) {
           if (data["isNastedFilter"] == true) {
           filterselected.add(data["filterNasted"]);
           } else {
           filterselected.add({
              "${data["fieldName"]}": {
                 data["operator"]: data["fieldValue"],
              }
           });
           }
           /// Quick Filter applied map and sort filter
           if (filterDataApply != {} && fromOnInit == false) {
            List<dynamic> quickFilter = new List<dynamic>.empty(growable: true);
            toMapfilterjson.forEach((key, gttilefield) {
              switch (gttilefield.filterType) {
                case GtFilterType.SORT_FILTER:
                  var sortfield = filterDataApply![gttilefield.filterValue];
                  var sortOrder = filterDataApply['sort'];
                  sortFieldFilter = {
                    sortfield: sortOrder.toString().toLowerCase()
                  };
                  break;
              }
            });
            quickFilter = filterDataApply!.entries.map((MapEntry mapEntry) {
              if (mapEntry.key == "sort" || mapEntry.key == "order_by") {
                return {};
              } else {
                return {"${mapEntry.key}": mapEntry.value};
              }
            }).toList();
            print(quickFilter);
            filterselected.addAll(quickFilter);
          }
          variables["where"]["_and"] = filterselected;
        });
        }
        void filterClearHandlerFunction(Map<String, dynamic> filterDataApply, List<Map<String, dynamic>> selectedFilterAdvance ){
           if(filterDataApply.isEmpty && selectedFilterAdvance.isEmpty){
              isFilterApplied.value = false;
           }
           else{
              isFilterApplied.value = true;
           }
           print(filterDataApply);
           print(selectedFilterAdvance);
        }
        void changeBackDrop(bool isback){
           isBackDrop.value = isback;
        }
     }
  ```

  - Step 3 : Used GtListFilter widget.

  ```dart
        class ListFilterExample extends StatelessWidget {
           @override
           Widget build(BuildContext context) {
             return Scaffold(
                 appBar: GtAppBar(
                     backgroundColor: Color(0xff5a5278),
                     title: GtText(text: '')),
                 body: Column(
                    children:[
                        GtBackDropListView(
                          frontLayer: GtListPage(
                             rowsCount: 2,
                             leadingIcon: GtIcon(
                             icondata: Icons.account_circle_rounded,
                             ),
                             isLeadingShow: false,
                             listItems: [{"Id": 2093,"CompanyId": 0,"Code": "GT0521","FName": "DEMO USER","address" : {"City": "Mumbai"}},
                             {"Id": 2093,"CompanyId": 0,"Code": "GT011","FName": "DEMO MANAGER","address" : {"City": "Pune"}}],
                             viewtype: ViewType.list,
                             toMapjson: {
                             'Name': GtTileField(
                                valuePath: 'FName',
                                row: 1,
                                flex: 4,
                                mobileRow: 1,
                                mobileFlex: 3,
                                cardRow: 1,
                                type: GtFieldType.STRING,
                                keyTextStyle: TextStyle(color: Colors.black,fontSize: 15),
                                valueTextStyle: TextStyle(color: Colors.black,fontSize: 16),
                                keyTextAlign: TextAlign.start,
                                valueTextAlign: TextAlign.end,
                                displayKey: true,
                                keyValueBetween: " : ",
                             ),
                             'Code': GtTileField(
                                valuePath: 'Code',
                                row: 1,
                                flex: 4,
                                mobileRow: 2,
                                mobileFlex: 3,
                                cardRow: 1,
                                type: GtFieldType.STRING,
                                keyTextStyle: TextStyle(color: Colors.black,fontSize: 15),
                                valueTextStyle: TextStyle(color: Colors.black,fontSize: 16),
                                keyTextAlign: TextAlign.start,
                                valueTextAlign: TextAlign.end,
                                displayKey: true,
                                keyValueBetween: " : ",
                             ),
                             },
                             tag: "Task",
                             isSpaceInRecords: true,
                             isleadingIconPosition: false,
                             size: Get.size,
                             cardColor: Colors.blueGrey[200],
                             backButtonColor: Colors.white,
                          ),
                          backLayer: Obx(() => GtListFilter(
                             isBackDrop: true,
                             isFilterProcessing: false,
                             filterHandler: controller.filterHandlerFunction,
                             onFilterClearHandler: controller.filterClearHandlerFunction,
                             toMapjson: controller.toMapfilterjson,
                             changeBackDrop: controller.changeBackDrop,
                             isBackDropController : controller.isBackDrop.value,
                             advanceFilterFields: controller.advanceFilterFields,
                             isAdvanceFilterEnable: true,
                             operatorCommon: controller.operatorCommon,
                             operatorNumeric: controller.operatorNumeric,
                             operatorString: controller.operatorString,
                             keyLabel: "CustomerFilter",
                             filterData: controller.filtersData.value,
                          )),
                          backdropAppBar: BackdropAppBar(
                             title: GtText(text: "LISTVIEW"),
                          ),
                          isFilterApplied: controller.isFilterApplied.value
                       )
                    ]
                 ));
           }
        }

  ```

  - Step 3 : Result :

    ![GtListFilter](https://user-images.githubusercontent.com/64594463/145522898-d7f79fa6-ded8-45db-9f91-1e966aea40de.png)

    ![GtListFilter](https://user-images.githubusercontent.com/64594463/145522926-27a0bf05-8375-45c8-9f2d-e5cf759d11ab.png)
