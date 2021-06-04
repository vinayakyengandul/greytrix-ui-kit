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

 
 
 
# GtText Widget
  
 The gttext widget is used represent the text on the Screen with alng icons as optional parameter.
   - Benefits of GtText Widget
      - Handles the font size of the text in dynamic way based on the screen resolution when specified along with required TextformatType.
    - Used the GtTextwidget along textoverflow property.
        TextOverflow - ellipsis,clip,visible,fade
    - Also show a icons along with Text.(Optional)
        
   - Constructors: 
      - [GtText](components.md#gttext-widget)({@required this.text,
                     this.textOverflow,
                     this.textStyle,
                     this.fontFamily,
                     this.iconData,
                     this.iconSize,
                     this.iconColor,
                     this.position = GtPosition.PREFIX,});
           
   - Input Parameters of GtText Widget
      - text - String - This is required parameter, it well show text.
      - textStyle - TextformatType - It well show text type form TextformatType. Default value is TextformatType.bodytext.
      - textOverflow - TextOverflow - How visual overflow should be handled. Types : TextOverflow - ellipsis,clip,visible,fade
      - fontFamily - String - Provide a Fontfamily for the text.
      - iconData - IconData - Provide icon which is to be displayed with the text.
      - iconSize - double - Provide a size for the Icon.
      - iconColor - Color - Provide  a color for the Icon.
      - position - GtPosition - Provide aposition for the icon to be displayed before or after the text.
      
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
      - [GtIcon](components.md#gticon-widget)({@required this.icondata, this.size, this.color});
              
   - Input Parameters of GtText Widget
      - icondata - IconData - The icon to display. The available icons are described in Icons. This is required parameter.
      - size - double - The size of the icon in logical pixels. Icons occupy a square with width and height equal to size.
      - color - Color - The color to use when drawing the icon. Defaults to the current IconTheme color, if any.
             
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
    - Handles the checbox functionality on the click of the icon (i.e the Icon is displayed initially but when the click / tap event is fired it flips the widget with   checkbox.)
    - Best suited to used in the leading parameter fo Listtile Widget.
    
  - Constructors: 
    - [GtIconCheckbox](components.md#gticoncheckbox-widget){@required this.icon, this.selected = false, @required this.onchanged});
    
  - Input Parameters of GtIconCheckbox Widget
    - icon - Icondata - Expects the Icons data which is used to displayed.
    - selected - bool - Bool value to flip between the checkbox and Icon widget
    - onchanged - Function - Function to that handles the On changed event of both the widgets.
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
      - [GtTextFormField](components.md#gttextformfield-widget)({@required this.fieldLabel, this.maxLength = 1000, this.maxLines = 1, this.minLines = 1,
            this.isReadOnly = false, this.textEditingController, this.textInputType = TextInputType.text,
            this.isRequired = false, this.onChangeHandler, this.padding = const EdgeInsets.all(0.0),
            this.obscureText = false, this.onSaveHandler});
             
   - Input Parameters of GtTextFormField Widget
      - fieldLabel - String - This is required parameter, it well show field label name.
      - maxLength - int - It shows max length of text field and its default max length is 1000.
      - maxLines - int - It show max lines of text field and its default max line is 1.
      - minLines - int - It show min lines of text field and its default min line is 1.
      - isReadOnly - bool - When this is set to true, the text cannot be modified by any shortcut or keyboard operation. The text is still selectable. Defaults to false. Must not be null.
      - textEditingController - TextEditingController - Controls the text being edited. If null, this widget will create its own TextEditingController and initialize its TextEditingController.text with initialValue.
      - textInputType - TextInputType - This parameter is used to text input type, Defualt type was TextInputType.text.
      - isRequired - bool - It contains Field is Required or not, if isRequired is true than we have to Enter the value in text field. Default is false.
      - padding - EdgeInsets - This gives padding to text fields and its default value is const EdgeInsets.all(0.0).
      - obscureText - bool - Whether to hide the text being edited (e.g., for passwords). Defaults to false.
      - onChangeHandler - Function(dynamic val) - Signature for callbacks that report that an underlying value has changed.
      - onSaveHandler - Function(dynamic val) - An optional method to call with the final value when the form is saved.
      
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
       - [GTChip](components.md#gtchip-widget)({this.label,this.backgroundColor,
                this.textFormatType = TextformatType.subtitle2});
             
   - Input Parameters of GTChip Widget
       - label - String - The primary content of the GTChip. It shows text in chip.
       - backgroundColor - Color - It will use in background color in GtChip widget.
       - textFormatType - TextformatType - GTChip widget text format is taking from TextformatType and its default value is TextformatType.subtitle2. 
      
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
     
     
     
     
     
     

  
 The GtHeader widget is used represent the ListTile on the Screen with responsive sizing handle in the core package.
   - Benefits of GtHeader Widget
      - Handles the font size of the text in dynamic way based on the screen resolution.
    
   - Constructors:
      - [GtHeaderWidget](components.md#gtheader-widget)({this.listItemsheader, this.enableCheckbox = false});
      
   - Input Parameters of GtHeaderWidget Widget   
      - listItemsheader - List<Widget> - Is will contains List of widgets in GtHeaderWidget. Used in ListTile title.
      - enableCheckbox - bool - If is true than it shows checkbox widget in ListTile Leading property. default value is false.
   
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
         - [CustomPopup](components.md#custompopup-widget)({@required this.isItemSelected, @required this.items,
                      @required this.getOptionText,@required this.getAvatarWidgetContent,
                      @required this.onTapHandler,@required this.showMoreOption,
                      @required this.showMoreHandler,this.top,this.bottom,this.left,this.right});
                      
   - Input Parameters of CustomPopup Widget   
         - isItemSelected - Function(dynamic obj) - This is a method with parameter which is used to value is selected or not. And it is a required parameter.
         - items - List<dynamic> - Used to List of dymanic to Custompopup value. And its required parameter.
         - getOptionText - Function(dynamic obj) - This is a method with parameter. its shows text in each card in CustomPopup. And its required parameter.
         - getAvatarWidgetContent - Function(dynamic obj) - This is a method with parameter. its shows leading text in each card in CustomPopup. And its required parameter.
         - onTapHandler - Function - It Called when the user taps this List tile. 
         - showMoreOption - bool - Used for when showMoreOption is true it will show Show More option in CustomPopup Widget.
         - showMoreHandler - Function - This function is used for when user click on showMoreOption it will open all CustomPopup items open in new dialog.
         - top - double - Used for CustomPopup Widget Positioned in top.
         - bottom - double - Used for CustomPopup Widget Positioned in bottom.
         - left - double - Used for CustomPopup Widget Positioned in left.
         - right - double - Used for CustomPopup Widget Positioned in right.
      
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
      - [GtNavigationRails](components.md#gtnavigationrails-widget)({this.nrdlist,
          this.selectedindex, this.setindex, this.isShowLable = true, this.trailing});
              
   - Input Parameters of GtNavigationRails Widget   
      - nrdlist - List<Rails> - Defines the appearance of the button items that are arrayed within the navigation rail. The value must be a list of two or more.
      - selectedindex - selectedindex - The index into destinations for the current selected NavigationRailDestination.
      - setindex - Function - Called when one of the destinations is selected.
      - isShowLable - bool - Defines the layout and behavior of the labels for the default, unextended NavigationRail. When a navigation rail is extended, the labels are always shown.
      - trailingWidget - List<Widget> - The trailing List of widget is placed bottom of the rails last NavigationRailDestination. It's location is affected by groupAlignment.
      
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
      - [SearchDialog](components.md#searchdialog-widget)({@required this.isItemSelected, @required this.items,
            @required this.getOptionText,@required this.getAvatarWidgetContent,@required this.onTapHandler,
            @required this.dialogTitle,this.searchBox = false,this.searchOnChangeHandler,this.dialogHeight = 350});  
            
   - Input Parameters of SearchDialog Widget   
      - isItemSelected - Function(dynamic obj) - This is a method with parameter which is used to value is selected or not. And it is a required parameter.
      - items - Rx<List<dynamic>> - Used to List of dymanic to SearchDialog value. And its required parameter.
      - getOptionText - Function(dynamic obj) - This is a method with parameter. its shows text in each card in CustomPopup. And its required parameter.
      - getAvatarWidgetContent - Function(dynamic obj) - This is a method with parameter. its shows leading text in each card in CustomPopup. And its required parameter.
      - onTapHandler - Function - It Called when the user taps this List tile.                 
      - dialogTitle - String - This contains dialog title text.                
      - searchBox - bool - This is option for search box is given or not by bool. default is false.                 
      - searchOnChangeHandler - Function - This function is when we search any key in search box that items list is filter by searchOnChangeHandler funation.                  
      - dialogHeight - double - This will define dialog height. Default height is 350.               
                           
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
      - [GtAppBar](components.md#gtappbar-widget)({Key key,this.primary = true,this.leading,
            this.automaticallyImplyLeading = true,this.title,this.actions,this.bottom,});
             
   - Input Parameters of GtAppBar Widget
      - key - Key - A new widget will only be used to update an existing element if its key is the same as the key of the current widget associated with the element.
      - primary - bool - Whether this app bar is being displayed at the top of the screen. Default value is true.
      - leading - Widget - A widget to display before the title. Typically the leading widget is an Icon or an IconButton. Becomes the leading component of the NavigationToolbar built by this widget.
      - automaticallyImplyLeading - bool - Controls whether we should try to imply the leading widget if null. Default value is true.
      - title - Widget - The primary widget displayed in the app bar.
      - actions - List<Widget> - Widgets to display in a row after the title widget.
      - bottom - PreferredSizeWidget - A size whose height is the sum of toolbarHeight and the bottom widget's preferred height. Scaffold uses this size to set its app bar's height.
      
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
      - [CoreListView](components.md#/corelistview-widget)({this.title,this.toMapjson,this.rowsCount = 2,this.cardAspectRatio = 1,
                this.viewType = ViewType.list,this.leadingIcon,this.trailingIcon,this.tag,this.enablefilter = false,this.backNavigation = false,
                this.pathNavigation = "",this.isSpaceInRecords = false,this.postfixtitleText,this.prefixtitleText,this.titletextValuePath,
                this.selectAllcheckboxOption = true,});

   - Input Parameters of CoreListView Widget
      - title - String - The contains ListView Title name.
      - rowsCount - int - Called to obtain the number of rows to tell the ListView or GridView. Default value is 2.
      - cardAspectRatio - double - The ratio of the cross-axis to the main-axis extent of each child. Default value is 1.
      - viewType - ViewType (Enum) - This is for how View is showing (both, list, card). If both is selected than we get both view. Default is ViewType.list.
      - leadingIcon - IconData - There is only we have to pass IconData that showing in ListView.
      - trailingIcon - IconData - There is only we have to pass IconData that showing in ListView.
      - tag - String - This String value taken unique Key as define which View is showing.
      - enablefilter - bool - It is used for the filter option, If true we get Filter option in ListView. Default value is false.
      - backNavigation - bool - This containes back navigation arrow button for listview, Default value is false.
      - pathNavigation - String - It used for navigate form listview record to given navigation path. if children path is "navigation/:id" this have to pass only "navigation/" this.
      - isSpaceInRecords - bool - Listview record between space indicate, Default is spacing value is false.
      - titletextValuePath - String - When we have to take Listview title from Response, have to pass this value path.
      - selectAllcheckboxOption - bool - This show Listview All Select checkBox, Default is true.
      - prefixtitleText - String - It`s containe Listview title prefix text.
      - postfixtitleText - String - It`s containe Listview title postfix text. 
      - toMapjson - Map<String, dynamic> - This contains which fields we have to show in ListView of each row. And we used GtTileField widget check below.
         - Constructor of GtTileField
      
            - GtTileField({this.row, this.mobileRow, this.value, this.iconData, this.flex = 1, this.mobileFlex = 1,
                this.textOverFlow, this.displayKey = false, this.type = GtFieldType.STRING, this.webTextFormatType = TextformatType.caption,
                this.mobileTextFormatType = TextformatType.caption, this.keyTextFormatType = TextformatType.caption,
                this.isCardTitle = false, this.isCardSubTitle = false, this.isBannerField = false, this.cardRow, this.filterType,
                this.filterItems, this.valuePath, this.filterValue, this.filterLabel, this.rangeStart, this.rangeEnd, this.bannerItems});
      
         - Input Parameters of GtTileField Widget
      
            - row - int - This is contains which row have to display this field in web. 
            - mobileRow - int - This is contains which row have to display this field in mobile.
            - value - dynamic - This contains value of the field.
            - iconData- IconData - Showing Icon start of the field.
            - flex - int - The flex factor to use for this child. This is for Web.
            - mobileFlex - int -  The mobileFlex factor to use for this child. This is for mobile.
            - textOverFlow- TextOverflow - Defaults to retrieving the value from the nearest DefaultTextStyle ancestor.
            - displayKey - bool - This is for Display field label name, If displaykey is true than field name is showing with value. Default is false.
            - type - GtFieldType - Type of field is define like Enum(STRING,EMAIL,PHONE,CHIP,BANNER,FILTER).
            - webTextFormatType - TextformatType - This will define which text format is taken. Default is TextformatType.caption for web.
            - mobileTextFormatType - TextformatType - This will define which text format is taken. Default is TextformatType.caption for mobile.
            - keyTextFormatType - TextformatType - This will define which text format is taken. Default is TextformatType.caption for label.
            - isCardTitle - bool - This contains field is showing in title or not in Card. Default false.
            - isCardSubTitle - bool - This contains field is showing in SubTitle or not in Card. Default false.
            - isBannerField - bool - This used for A banner displays a prominent message and related field. Default value is false. 
            - cardRow- int -  This is contains which row have to display this field in card. 
            - filterType - GtFilterType - This field is used for which type is filter like (  RADIO_BUTTON_FILTER,  CHECKBOX_BUTTON_FILTER,  RANGE_FILTER,  SORT_FILTER,)
            - filterItems - Map<String, dynamic> - This is Sort the List as per given sort fields. And also Display the fields in UI. 
            - valuePath - String - This is define which is Field map with valuePath.
            - filterValue - String - This value is send to the API for this field.
            - filterLabel - String - It will show in UI in this filter field.    
            - rangeStart- String - This is Range Start field name.
            - rangeEnd - String - This is Range End field name.
            - bannerItems - Map<String, dynamic> - It will show banner Items.
      
   - Constructor of CoreBinding: 
         - [CoreBinding](components.md#/corelistview-widget)({this.entityGQL,this.nodeName,this.isList = false,this.headers,this.setHeaders,
                this.enableDefaultHeader = false,this.tag,this.filterRangePath,this.lookupGQL,this.addLookupDataGQL,
                this.controllerType = ControllerType.LIST,this.addFormGQL,this.toMapfilterjson,this.valuePath,
                this.inputType = GtListInputType.GRAPHQL,this.inputData});
    
   - Input Parameters of CoreBinding Widget
      - entityGQL - String - This used for query for Listview data fetch from server, this field is mandatory.
      - nodeName - String - It indicates unique key for Listview entityname.
      - headers - Map<String, dynamic> - When we have to pass headers to API this will be used.
      - setHeaders - Function - This will be function to set headers to API.
      - enableDefaultHeader - bool - This is indicated for Headers taken or not, If value is true than DefaultHeader will taken. Default value is false.
      - tag - String -  It is used for when you want multiple different instance of a same Listview must be unique.
      - filterRangePath - Map<String, Map<String, String>> -  This is Filter used for RangeValues Filter have to pass Response Key will get data.
      - lookupGQL - Map<String, String> - It is used for lookUp data have to pass Query in this lookupGQL.
      - addLookupDataGQL - Map<String, String> - It is used for add lookUp data have to pass Query in this addLookupDataGQL.
      - controllerType - enum {LIST,FORM} - This is indicate to show Listview or Form, Default is LIST.
      - addFormGQL - String - This have to add form view pass GQL Query in this.
      - toMapfilterjson - Map<String, GtTileField> - It will show Filter Fields In Filter.
      - valuePath - String - This used for particular response data have to taken than pass Path of that response. 
                
      
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
          - [GtUserMenuBar](components.md#gtusermenubar-widget)(
      {this.userImage,
      this.greetingText,
      this.greetingTextStyle,
      @required this.userName,
      this.userNameTextStyle,
      this.iconWidgets,
      this.leadingOnTap,
      this.leadingAvatar = true});
  
   - Input Parameters of GtUserMenuBar Widget   
      - userImage - dynamic - It is type of dynamic to support Asset and Network Image for User profile image.
      - greetingText - String - Provide a greeting text to be displayed.
      - greetingTextStyle - TextStyle - Provide a TextStyle for the Greeting Text.
      - userName - String -  Provide a userName text to be displayed.
      - userNameTextStyle - TextStyle - This is use for text font which we have to take.
      - iconWidgets - List<Widget> - Provide a List of Icons Widgets to displayed along with user details along with its on click handling.
      - leadingOnTap - Function - Provide a function to perform some action on the click event of the UserImage.
      - leadingAvatar - bool - To show the leading Avatar before the Username.
         
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
          - [GtTab](components.md#gttab-widget)(
      {@required this.tabPages,
       @required this.tablist,
       @required this.pageController,
       this.selectedColor,
       this.unselectedColor,
       this.selectedTab,
       this.onPressed,
  });
  
   - Input Parameters of GtTab Widget   
      - tabPages - List<Widget> - Provide the Tabpages/Content of tab displayed for each each tab in list of Widgets .
      - tablist - List<String> - Provide tabs list of titles to be displayed for the tabPages.
      - pageController - PageController - Provide a page Controller for handling the transition of tabs/page.
      - selectedColor - Color -  Provide a color to be displayed for selected tab.
      - unselectedColor - Color - Provide a color to be displayed for unselected tab.
      - selectedTab - int - Provide a initial select default index which can used in handling the selection of page/tab.
      - onPressed - Function - Provide a function to perform some action on the click event of the tabs based on the above selectedTab parameter.
        
         
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
          - [GtBottomBar](components.md#gtbottombar-widget)(
            {@required this.bottombarItems,
            this.selectedIconThemedata,
            this.unselectedIconThemedata,
            this.backgroundColor,
            this.showSelectedLabels = false,
            this.showUnselectedLabels = false,
            this.bartype = BottomNavigationBarType.fixed,
            this.onTaphandler,
            this.elevation});
  
   - Input Parameters of GtBottomBar Widget   
     - bottombarItems - List<BottomNavigationBarItem> - Provide the list of widgets of BottomNavigationBarItem type.
     - selectedIconThemedata - IconThemeData - Provide theme data for selectedIcon  to be displayed for the Icon.
     - unselectedIconThemedata - IconThemeData - Provide theme data for unselectedIcon to be displayed for the Icon.
     - backgroundColor - Color -  Provide a color to be displayed for background of bottombar.
     - showSelectedLabels - bool - Provide a bool value to whether  displayed labels for selected icons.
     - showUnselectedLabels - bool - Provide a bool value to whether  displayed labels for unselected icons.
     - bartype - BottomNavigationBarType - Provide a BottomNavigationBarType for navigationbar type.
     - onTaphandler - Function(int)  - Provide a function to perform some action on the click event of the bottomnavigationbar.
     - elevation - double - Provide a double type value to set the elevation.
        
         
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
  
 The GtImageCard widget is used represent the UI with  card to display a image.
   - Benefits of GtImageCard Widget
      - For ease use of Image to display image with with default image handler.
      - Supports both network images and handle with asset image with image not found.
      
      
   - Constructors: 
          - [GtImageCard](components.md#gtimagecard-widget)(
            {  this.boxFit = BoxFit.fill,
               this.imgHeight,
               this.imageURL,
               this.backgroundcolor,
               this.height,
               this.width,
                   });
  
   - Input Parameters of GtImageCard Widget   
      - boxFit - BoxFit - Provide the list of widgets of BottomNavigationBarItem type.
      - imgHeight - double - Provide height for the Image.
      - imageURL - String - Provide theme data for unselectedIcon to be displayed for the Icon.
      - backgroundcolor - Color -  Provide a color to be displayed for background of bottombar.
      - height - double - Provide a bool value to whether  displayed labels for selected icons.
      - width - double - Provide a bool value to whether  displayed labels for unselected icons.
         
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
                            });
  
   - Input Parameters of GtCard Widget   
      - cardColor - Color - Sets a color for the card.
      - shadowColor - Color - Sets a shadow color for the card .
      - label - String - Sets the text/label below the image.
      - shape - ShapeBorder - Sets the shape of the card.
      - elevation - double -  Sets the elevation of the card.
      - imageURL - dynamic - Sets the ImageURL for netwoek Image or Asset
      - cardwidth - double - Sets the width of the card.
      - cardheight - double - Sets the height of the card.
      - imageWidth - double - Sets the width of the image.
      - imageheight - double - Sets the height of the image.
      - boxFit - BoxFit - Sets filling type of the image i.e contains,fill,etc.
      - textStyle - TextStyle - Sets the textstyle for the label.
         
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
                            });
  
   - Input Parameters of GtDate Widget   
      - type - GtDateTimeType - Sets a type  for the widget to show either date/time or both.
      - label - String - Sets a label for the widget.
      - initialDate - DateTime - Sets the initial date before the widget to displayed when widget is opened.
      - firstDate - DateTime - Sets the min date range of the calendar.
      - lastDate - DateTime -  Sets the max date range of the calendar.
      - prefixIcon - Icon - Sets the ImageURL for netwoek Image or Asset
      - onDateSubmitted - Function(dynamic val, GtDateTimeType type, dynamic date) - Sets the width of the card.
      - onSaveHandler - Function(dynamic val, GtDateTimeType type) - Sets the height of the card.
      - dateTextEditingController - TextEditingController - To handle the textfield for date.
      - timeTextEditingController - TextEditingController - To handle the textfield for time.
      - datePickerEntryMode - DatePickerEntryMode - Sets datepickerentry mode i.e calendar or input.
      - initialEntryMode - DatePickerMode - Sets the DatePickerMode i.e year or month.
         
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
          - [GtCalendar](components.md#gtcalendar-widget)(
            {  this.initialDate,
               this.firstDate,
               this.lastDate,
               this.onDateChanged,
                            });
  
   - Input Parameters of GtCalendar Widget   
      - initialDate - DateTime - Sets the initial date before the widget to displayed when widget is opened.
      - firstDate - DateTime - Sets the min date range of the calendar.
      - lastDate - DateTime -  Sets the max date range of the calendar.
      - onDateChanged - Function(DateTime date) - Function to handle Onchange event of date..
         
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
          - [GtCurrency](components.md#gtcurrency-widget)(
            {  this.amount,
               this.label,
               this.currency,
               this.labelTextStyle,
               this.amountTextStyle,
               this.horizontalView = false
                            });
  
   - Input Parameters of GtCurrency Widget   
      - amount - String - Sets the initial date before the widget to displayed when widget is opened.
      - currency - String - Sets the min date range of the calendar.
      - labelTextStyle - TextStyle -  Sets the max date range of the calendar.
      - amountTextStyle - TextStyle - Function to handle Onch- 
         - horizontalView - bool - Decide the position of label.
         
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
               this.imagewidth
                            });
  
   - Input Parameters of GtButton Widget   
      - buttonStyle - ButtonStyle - Sets the initial date before the widget to displayed when 
      - iconColor - Color - Sets the min date range of the calendar.
      - iconPosition - TextStyle -  Sets the max date range of the calendar.
      - iconSize - TextStyle - Function to handle Onch- 
      - icondata - IconData - Set the icon based provided icon data.
      - onPressed - Function - Function to call events on pressed event of the button.
      - text - String - Text to be display as label of the button
      - textStyle - TextStyle - TextStyle for the label text.
      - buttonType - GtButtonType - Identifier to set the required typr of button.
      - value - dynamic - To set the value for radio button.
      - groupValue - dynamic - To set the value for the radio button.
      - onChanged - Function - Function to perform actions on changed event of the radio button.
      - toggleable - bool - To toggle the widget behaviour based on bool value. 
      - activeColor - Color - Sets the active color of the radio button.
      - imagebackgroundcolor - Color - sets the background color for the image container.
      - imageboxFit - BoxFit - sets the boxFit options for the image.
      - imageURL - String -  URL to load the Image.
      - imageonClick - Function - Function perform actions on Click event of the image button.
      - imageheight - double - Sets the height for the image container. 
      - imagewidth - double -  Sets the weight for the image container.


         
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

      - We can use vertical space of mobile screens optimally because most of the users in most cases use portraint   mode of app orientation against landscape mode.

      - SideBar can cover a number of navigation opetions campared to tiny main navigation bar situated either on the top or bottm of the app Even users cna scroll it further to access hidden buttons or content.

      - SideBar can provide clear and clutter free desing.
     
      
   - Constructors: 
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
  
   - Input Parameters of GtAppSideBar Widget 
      - listApps - List<dynamic> - This is fine for short list but not for a long list.
      - trailingWidget - List<Widget> - List are made up of multiple rows of items, which include text, buttons, toggles, icons, thumbnails, and many more.
      - selectedindex - int - The index into destinations for the current selected
      - onTapHandler - Function - Function to call ListApp onTapHandler.
      - navigationBackGroundColor - Color - To set navigationBackGroundColor.
      - selectedRowColor - Color - Provide Row color selected row. 
      - selectedRowDarkColor - Color - Set Row color dark selected row.
      - iconColor - Color - To set the icon color.
      - isItemSelected - Function(dynamic obj) - To call function which item selected.
      - getAvatarWidgetContent - Function(dynamic obj) - To call getAvatarWidgetContent function. 
      - toolTipMessageContent - Function(dynamic obj) - To call toolTipMessageContent function. 
      - leadingWidget - Widget- A widget to display before the toolbar's title.
      - backGroundColor - Color - To sets backgroundcolor.
      - width - double - To set width in double data type.
      - railTextWidget - Function(dynamic obj) - To call railTextWidget function.

         
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
          - [GtDynamicView](components.md#gtbutton-widget)(
            {  
               key key,
               this.listItems,
               this.title,
               this.gtTileRowCrossAxisAlignment,
               this.gtTileRowMainAxisAlignment,
               this.toMapjson,
               this.rowsCount = 1,
               this.headertextStyle
            });
  
   - Input Parameters of GtDynamicView Widget 
      - rowsCont - int - To set the number of row.
      - toMapjson - Map<String, dynamic>- A Map object is a key-value pair to store string or any dynamic data.
      - listItem - dynamic - To set the data in listItems.
      - gtTileRowCrossAxisAlignment - CrossAxisAlignment - To set ho items are align on the other axis
      - gtTileRowMainAxisAlignment - MainAxisAlignment - To set how items are aligned on that axis.
      - title - String - To set the Title. 
      - headertextStyle - TextStyle - Sets the heardertextStyle which you want.
      - datatextStyle - TextStyle - Sets the datatextStyle which you want. 

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
          - [GtSignature](components.md#gtsignature-widget)(
            {  this.color = Colors.black,
               this.strokeWidth = 2.0,
               this.changeColorOnPressed,
               this.changeStrokeWidthOnPressed,
               this.saveSignOnPressed,
               this.backgroundColor = Colors.white54,
               this.signaturePadBackgroundColor = Colors.white70,
               this.sign,
               this.signClearOnPressed,});
   - Input Parameters of GtCurrency Widget   
      - color - Color - signature color.
      - strokeWidth - double - width of signature line. Default value is 2.0.
      - changeColorOnPressed - Function -  Change Color of signature function.
      - changeStrokeWidthOnPressed - Function - Change signature width function. Example Below. 
      ```dart
        void changeStrokeWidthOnPressed(){
            int min = 1;
            int max = 10;
            int selection = min + (Random().nextInt(max - min));
            strokeWidth = selection.roundToDouble();
        }
      ```
      - saveSignOnPressed - Function - Save the signature of draw function. Example is below.
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
      - backgroundColor - Color - Widget background Color. 
      - signaturePadBackgroundColor - Color - Signature Pad background Color. 
      - sign - GlobalKey<SignatureState> - Global key for widget. Example below.
      ```dart
         final sign = GlobalKey<SignatureState>();
      ```
      - signClearOnPressed - Function - clear pad signature function. Example below.
      ```dart
         void signClearOnPressed(){
            final sign1 = sign.currentState;
            sign1.clear();
         }
      ```
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
               this.extensions,});
   - Input Parameters of GtFileUpload Widget   
      - backgroundColor - Color - Back Ground color of widget, Default color is White.
      - borderColor - Color - Widget border color, Default color is black.
      - onPressed - Function(dynamic) -  This function return browse files  or Drag file. Example Below.
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
      - selectedFiles - String - This reperesent the selected files name show in UI.
      - iconUpload - IconData - Icon for upload files, Default Icon is Icons.cloud_upload.
      - iconColor - Color - Icon color, Default color is grey.
      - iconSize - double - Size of icon and default size is 100.0.
      - fileNameShow - bool - Selected Files name show or not in UI, Default is true.
      - buttonColor - Color - Browse Button color Default color is blue.
      - iconShow - bool - Icon is shown or not in UI, Default is true.
      - fontSize - double - Size of Fonts in UI, Default size is 20.
      - extensions - String - This is Allow to Which Files is Taken from Browse. Pass the extension in string like "pdf,jpg,doc".
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






