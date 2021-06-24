import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './gt_tile_field.dart';
import '../models/enums.dart';
import '../widgets/index.dart';
import '../../greytrix_ui_kit.dart';

class Common {
  ///FUNCTION TO RETRIEVE THE VALUE FROM THE MAP BASED ON PATH
  static dynamic getValue(dynamic obj, String path) {
    dynamic _obj = null;

    ///HERE IT SPLITS THE PATH TO CHECK PATH DEPTH
    List<String> _path = path.split('/');
    if (_path.length > 1) {
      if (path.indexOf('/', 0) != -1) {
        ///GETTING THE SUB PATH WHICH IS NOT ITERATED YET
        String _subPath =
            path.substring((path.indexOf('/', 0)) + 1, path.length);

        ///IF OBJECT IS THE LIST THEN EXPECTS THE _PATH CONTENT TO BE INDEX
        if (obj is List) {
          ///HERE IF LIST OBJECT LENGTH IS GREATER THAN 0 THEN ONLY PROCEEDING FURTHER TO GET VALUE
          if (obj.length > 0)
            _obj = getValue(obj[int.parse(_path[0])], _subPath);
          else
            _obj = null;
        } else if (obj != null && obj[_path[0]] != null) {
          _obj = getValue(obj[_path[0]], _subPath);
        }
      }
    } else {
      ///IF OBJECT IS THE LIST THEN EXPECTS THE _PATH CONTENT TO BE INDEX
      if (obj is List) {
        ///HERE IF LIST OBJECT LENGTH IS GREATER THAN 0 THEN ONLY PROCEEDING FURTHER TO GET VALUE
        if (obj.length > 0) {
          ///GETTING THE SUB PATH WHICH IS NOT ITERATED YET
          String _subPath1 =
              path.substring((path.indexOf('/', 0)) + 1, path.length);
          _obj = getValue(obj[int.parse(_path[0])], _subPath1);
        } else
          _obj = null;
      } else {
        ///AS REACHED THE END OF THE PATH THEN READING VALUE DIRECTLY FROM MAP
        _obj = obj[path] != null ? obj[path] : null;
      }
    }
    return _obj;
  }

  ///IT DIVIDES ALL GT_FIELD WIDGETS LIST INTO ROW'S CHILDREN
  static List<Widget> getRows({
    @required List<Widget> widgets,
    @required int splitSize,
    bool isExpandedRows = false,
  }) {
    List<Widget> results = [];
    for (int i = 0; i < widgets.length; i += splitSize) {
      int end =
          (i + splitSize) > widgets.length ? widgets.length : (i + splitSize);
      Row _row = Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [...widgets.sublist(i, end)]);
      results.add(
        isExpandedRows ? Expanded(child: _row) : _row,
      );
    }
    return results;
  }

  static Widget getGtText(
    GtTileField value,
    String key,
    dynamic data, {
    TextStyle textStyle,
    bool horizhontalScrollable = false,
    bool isMobileScreen = false,
  }) {
    return horizhontalScrollable ? SizedBox(
      width: isMobileScreen ? value.mobileFlex * 100.0: value.flex * 100.0, 
      child:GtText(
      text: '${value.displayKey == true ? (key + ' : ') : ''}$data',
      // texttype: value.webTextFormatType,
      textOverflow: value.textOverFlow,
      textStyle: textStyle,
      fontFamily: value.fontFamily,
    )) : GtText(
      text: '${value.displayKey == true ? (key + ' : ') : ''}$data',
      // texttype: value.webTextFormatType,
      textOverflow: value.textOverFlow,
      textStyle: textStyle,
      fontFamily: value.fontFamily,
    );
  }

  static Widget getdynamicGtText(
    GtTileField value,
    String key,
    dynamic data, {
    TextStyle labeltextStyle,
    TextStyle datatextStyle,
  }) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: GtText(
              text: '$key :',
              textOverflow: value.textOverFlow,
              textStyle: labeltextStyle,
              fontFamily: value.fontFamily,
            )),
        Align(
            alignment: Alignment.centerLeft,
            child: GtText(
              text: '$data',
              textOverflow: value.textOverFlow,
              textStyle: datatextStyle,
              fontFamily: value.fontFamily,
            )),
      ],
    );
  }

  // USED WITH GTLISTPAGE FOR LISTVIEW AND CARDVIEW(GRIDVIEW)
  static Widget getListWidget(
    GtTileField gtTileField,
    String key,
    dynamic value,
    Function navigationHandler, {
    GtValueType gtValueType = GtValueType.STRING,
    bool isMobileScreen = false,
    int quantityInitialValue,
    Function incrementHandler,
    Function decrementHandler,
    dynamic itemData,
    bool spaceBetweenKeyValue,
    bool horizinalScrollable = false,
  }) {
    bool isMobilePortrait = isMobileScreen;

    switch (gtTileField.type) {
      case GtFieldType.STRING:
        Widget _widgetContainer;
        List<Widget> _textWidgetList = List<Widget>.empty(growable: true);
        _textWidgetList = [];

        ///PREPARING THE LIST OF WIDGETS FOR THE STRING AND LIST TYPE TO USE LIST FOR ROW OR A WRAP AS A CHILDRENS
        List<Widget> _widgetList = [
          if (gtTileField.displayKey == true)
          spaceBetweenKeyValue ? 
            Expanded(child:GtText(
              text: '$key' + gtTileField.keyValueBetween,
              textStyle: gtTileField.keyTextStyle,
              textAlign: gtTileField.keyTextAlign,
              //texttype: gtTileField.keyTextFormatType,
            )) :GtText(
              text: '$key' + gtTileField.keyValueBetween,
              textStyle: gtTileField.keyTextStyle,
              textAlign: gtTileField.keyTextAlign,
              //texttype: gtTileField.keyTextFormatType,
            ),
        ];

        switch (gtValueType) {
          case GtValueType.LIST:
            if (gtValueType == GtValueType.LIST && value != null) {
              ///PREPARING LIST OF TEXT WIDETS IF THE VALUE TYPE IS LIST
              value.forEach(
                (e) => {
                  _textWidgetList.add(
                    GtText(
                      text: '${e[gtTileField.listFieldValuePath]}',
                      textStyle: gtTileField.valueTextStyle,
                      // texttype: gtTileField.webTextFormatType,
                      // textStyle: gtTileField.textStyle,
                       textAlign: gtTileField.valueTextAlign,
                      textOverflow: gtTileField.textOverFlow,
                    ),
                  )
                },
              );

              _widgetList.addAll(_textWidgetList);
              _widgetContainer = _widgetContainer =
                  Container(child: Wrap(children: _widgetList));
            }
            break;

          case GtValueType.STRING:
                Widget widget = GtText(
                text: '$value',
                textStyle: gtTileField.valueTextStyle,
                 textAlign: gtTileField.valueTextAlign,
                // texttype: gtTileField.webTextFormatType,
                // textStyle: gtTileField.textStyle,
                textOverflow: gtTileField.textOverFlow,
              );
            ///PREPARING THE SINGLE STRING TYPE WIDGET
            _widgetList.add(
              spaceBetweenKeyValue ?
              Expanded(child: widget,
            ):widget);
            _widgetContainer = Container(
              child: spaceBetweenKeyValue ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: _widgetList,
              ) : Wrap(
                children: _widgetList,
              ),
            );
            break;
          default:
            break;
        }

        return !horizinalScrollable ? Expanded(
          flex: isMobilePortrait ? gtTileField.mobileFlex : gtTileField.flex,
          child: gtTileField.pathNavigation != null
              ? InkWell(
                  onHover: (value) {},
                  onTap: () {
                    if (navigationHandler != null) navigationHandler();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 4.0),
                    child: _widgetContainer,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(right: 4.0),
                  child: _widgetContainer,
                ),
        ) : gtTileField.pathNavigation != null
              ? InkWell(
                  onHover: (value) {},
                  onTap: () {
                    if (navigationHandler != null) navigationHandler();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 4.0),
                    child: SizedBox(
                      width: isMobileScreen ? gtTileField.mobileFlex * 100.0: gtTileField.flex * 100.0, 
                      child:Wrap(children :_widgetList))
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.only(right: 4.0),
                                  child: SizedBox(
                      width: isMobileScreen ? gtTileField.mobileFlex * 100.0: gtTileField.flex * 100.0, 
                      child:Wrap(children :_widgetList))
                );
        break;

      case GtFieldType.EMAIL:
        return Expanded(
          flex: isMobilePortrait ? 1 : gtTileField.flex,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.email,
                  size: 10.0,
                  // (AppTheme.getTextstyle(
                  //         textformatType: gtTileField.webTextFormatType))
                  //     .fontSize)
                ),
                SizedBox(width: 5.0),

                ///IF MOBILE VIEW THEN NOT SHOWING THE EMAIL TEXT IN MOBILE
                if (!isMobileScreen)
                  Padding(
                    padding: EdgeInsets.only(right: 6.0),
                    child: getGtText(gtTileField, key, value),
                  ),
              ],
            ),
          ),
        );
        break;

      case GtFieldType.QUANTITY:
        return !horizinalScrollable ? Expanded(
          flex: isMobilePortrait ? 1 : gtTileField.flex,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GtCartQuantity(
                  initialValue: value,
                  decrementHandler: decrementHandler,
                  incrementHandler: incrementHandler,
                )
              ],
            ),
          ),
        ): SizedBox(
            width: isMobileScreen ? gtTileField.mobileFlex * 100.0: gtTileField.flex * 100.0, 
            child:Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GtCartQuantity(
                  initialValue: value,
                  decrementHandler: decrementHandler,
                  incrementHandler: incrementHandler,
                )
              ],
            ),
          ));
        break;

      case GtFieldType.PHONE:
        return Expanded(
          flex: isMobilePortrait ? 1 : gtTileField.flex,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.phone, size: 10.0
                    // (AppTheme.getTextstyle(
                    //         textformatType: gtTileField.webTextFormatType))
                    //     .fontSize
                    ),
                SizedBox(width: 5.0),

                ///IF MOBILE VIEW THEN NOT SHOWING THE PHONE TEXT IN MOBILE
                if (!isMobileScreen)
                  Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: getGtText(gtTileField, key, value),
                  ),
              ],
            ),
          ),
        );
        break;

      case GtFieldType.CHIP:
        List<Widget> _chipsList = List<Widget>.empty(growable: true);
        _chipsList = [];

        ///PREPARING THE LIST OF WIDGETS FOR THE STRING AND LIST TYPE TO USE LIST FOR ROW OR A WRAP AS A CHILDRENS
        List<Widget> _widgetList = [
          if (gtTileField.displayKey == true)
            Padding(
              padding: EdgeInsets.only(top: 2.0),
              child: GtText(
                text: '$key' + gtTileField.keyValueBetween,
                 textStyle: gtTileField.keyTextStyle,
                textOverflow: gtTileField.textOverFlow,
                //texttype: gtTileField.keyTextFormatType,
                // textStyle: gtTileField.textStyle,
              ),
            ),
        ];

        ///PREPARING THE LIST TYPE WIDGET
        Widget _widgetContainer;

        switch (gtValueType) {
          case GtValueType.LIST:
            if (gtValueType == GtValueType.LIST && value != null) {
              ///PREPARING LIST OF WIDETS IF THE VALUE TYPE IS LIST
              value.forEach(
                (e) => {
                  _chipsList.add(
                    GTChip(
                      shapeBorder: gtTileField.chipFieldShape,
                      backgroundColor: gtTileField.fieldTextBackgroundColor,
                      label: '${e[gtTileField.listFieldValuePath]}',
                      // textFormatType: gtTileField.keyTextFormatType,
                      textStyle: TextStyle(
                        color: gtTileField.fieldTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                },
              );

              _widgetList.addAll(_chipsList);
              _widgetContainer = _widgetContainer = Container(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: _widgetList,
                ),
              );
            }
            break;

          case GtValueType.STRING:

            ///PREPARING THE STRING TYPE WIDGET
            _widgetList.add(
              GTChip(
                shapeBorder: gtTileField.chipFieldShape,
                backgroundColor: gtTileField.fieldTextBackgroundColor,
                label: '$value',
                // textFormatType: gtTileField.keyTextFormatType,
                textStyle: TextStyle(
                  color: gtTileField.fieldTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
            _widgetContainer = Container(
                child: Wrap(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: _widgetList,
            ));
            break;
          default:
            break;
        }

        return Expanded(
          flex: isMobilePortrait ? gtTileField.mobileFlex : gtTileField.flex,
          child: gtTileField.pathNavigation != null
              ? InkWell(
                  onHover: (value) {},
                  onTap: () {
                    if (navigationHandler != null) navigationHandler();
                  },
                  child: _widgetContainer,
                )
              : _widgetContainer,
        );
        break;

      case GtFieldType.STATUS:
      Widget keyWidget = GtText(
            text: '$key' + gtTileField.keyValueBetween,
              textStyle: gtTileField.keyTextStyle,
          );
      Widget valueWidget = value != "" && value != false
            ? PhysicalModel(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: gtTileField.statusField[value.toString()],
                elevation: gtTileField.buttonElevation,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 8, right: 8, bottom: 4, top: 4),
                  child: GtText(
                    text: value == true
                        ? gtTileField.valuePath
                        : '$value',
                          textStyle: gtTileField.valueTextStyle,
                          textAlign: TextAlign.center,
                    // textStyle: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 12,
                    //     fontWeight: FontWeight.w700),
                  ),
                ),
              )
            : Container();
      List<Widget> listWidget = [
        if (gtTileField.displayKey == true)
        spaceBetweenKeyValue ? 
            Expanded(child: keyWidget): keyWidget,
        spaceBetweenKeyValue ? 
            Expanded(child: valueWidget): valueWidget,
      ];
        return Expanded(
            flex: isMobilePortrait ? 1 : gtTileField.flex,
            child: InkWell(
              onHover: (value) {},
              onTap: () {
                if (navigationHandler != null) navigationHandler();
              },
              child: Container(
                child: spaceBetweenKeyValue ? Row(children: listWidget,)
                : Wrap(
                  children: listWidget,
                ),
              ),
            ));
        break;

      case GtFieldType.DATE:
        return Expanded(
          flex: isMobilePortrait ? 1 : gtTileField.flex,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (gtTileField.displayKey == true)
                  GtText(
                    text: '$key' + gtTileField.keyValueBetween,
                    //texttype: gtTileField.keyTextFormatType,
                    // textStyle: gtTileField.textStyle,
                     textStyle: gtTileField.keyTextStyle,
                  ),
                //getDateFormatGtText(gtTileField, key, value),
              ],
            ),
          ),
        );
        break;

      case GtFieldType.AVATAR:
        return !horizinalScrollable ? Expanded(
          flex: isMobilePortrait ? gtTileField.mobileFlex : gtTileField.flex,
          child: Container(
            child: Row(
              mainAxisAlignment: isMobilePortrait
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GtAvatar(
                  radius: 16,
                  //backgroundColor: gtTileField,
                  backGroundImage: gtTileField.isAssert
                      ? AssetImage(
                          '$value',
                          package: 'core',
                        )
                      : NetworkImage('$value'),
                )
              ],
            ),
          ),
        ) : SizedBox(
                      width: isMobileScreen ? gtTileField.mobileFlex * 100.0: gtTileField.flex * 100.0, 
                      child:Container(
            child: Row(
              mainAxisAlignment: isMobilePortrait
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GtAvatar(
                  radius: 16,
                  //backgroundColor: gtTileField,
                  backGroundImage: gtTileField.isAssert
                      ? AssetImage(
                          '$value',
                          package: 'core',
                        )
                      : NetworkImage('$value'),
                )
              ],
            ),
          ));
        break;

      case GtFieldType.CURRENCY:
        return !horizinalScrollable ? Expanded(
          flex: isMobilePortrait ? 1 : gtTileField.flex,
          child: Container(
            child: Row(
              children: [
                if (gtTileField.displayKey == true)
                  spaceBetweenKeyValue ? 
                  Expanded(child:GtText(
                    text: '$key' + gtTileField.keyValueBetween,
                    // textStyle: gtTileField.textStyle,
                     textStyle: gtTileField.keyTextStyle,
                     textAlign: gtTileField.keyTextAlign,
                  )):GtText(
                    text: '$key' + gtTileField.keyValueBetween,
                    // textStyle: gtTileField.textStyle,
                     textStyle: gtTileField.keyTextStyle,
                  ),
                value != ""
                    ? !spaceBetweenKeyValue ? Expanded(
                        child: GtCurrency(
                        amountTextStyle: gtTileField.valueTextStyle,
                        amount: value.toString(),
                        currency: '\$',
                      )): Align(alignment: Alignment.centerRight,child: GtCurrency(
                        amountTextStyle: gtTileField.valueTextStyle,
                        amount: value.toString(),
                        currency: '\$',
                      ),)
                    : Container(),
              ],
            ),
          ),
        ) : SizedBox(
              width: isMobileScreen ? gtTileField.mobileFlex * 100.0: gtTileField.flex * 100.0, 
              child: GtCurrency(
                amountTextStyle: gtTileField.valueTextStyle,
                amount: value.toString(),
                currency: '\$',
              ));
        break;

      case GtFieldType.BUTTON:
      Widget widget = GtText(
          text: '$key' + gtTileField.keyValueBetween,
          // textStyle: gtTileField.textStyle,
          textStyle: gtTileField.keyTextStyle,
        );
        Widget btnWidget = value != "" && value != false
          ? GtButton(
              buttonStyle: gtTileField.buttonStyle != null
                  ? gtTileField.buttonStyle
                  : ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(
                              Colors.blue),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(
                              Colors.white)),
                    // Button Value is true than show KEY value
              text: value == true ? '$key' : value.toString(),
              onPressed: () {
                if (gtTileField.buttonOnPressed != null)
                  gtTileField.buttonOnPressed(itemData);
              },
            )
          : Container();
      List<Widget> listwidget = [
      if (gtTileField.displayKey == true)
        spaceBetweenKeyValue ? 
            Expanded(child: widget): widget,
      spaceBetweenKeyValue ? 
            Expanded(child: btnWidget): btnWidget,
      ];
        return !horizinalScrollable ? Expanded(
          flex: isMobilePortrait ? 1 : gtTileField.flex,
          child: Container(
            child: spaceBetweenKeyValue ? Row(
              children: listwidget,
            ): Wrap(children: listwidget,),
          ),
        ): SizedBox(
              width: isMobileScreen ? gtTileField.mobileFlex * 100.0: gtTileField.flex * 100.0, 
              child:  Container(child:Wrap(children:[btnWidget])));
        break;

      default:
        return Container();
    }
  }

  /// TO HANDLE NULL VALUES FOR PARSING AND CONVERSION
  static dynamic parseValue({dynamic value, GtDataType type}) {
    try {
      switch (type) {
        case GtDataType.DOUBLE:
          return value != null ? value.toDouble() : null;
          break;
        default:
          break;
      }
    } catch (e) {
      print('error in parseValue');
      print(e);
    }
  }

  static Widget getDateFormatGtText(
    GtTileField value,
    String key,
    dynamic data, {
    TextStyle textStyle,
  }) {
    return GtText(
      text: GtDateFormat(data: data, dateType: value.tileDateFormat),
      // texttype: value.webTextFormatType,

      textOverflow: value.textOverFlow,
      textStyle: textStyle,
      fontFamily: value.fontFamily,
    );
  }

  static String GtDateFormat({String data, GtTileDateFormat dateType}) {
    if (data == null || data == "") {
      data = "";
    } else {
      switch (dateType) {
        case GtTileDateFormat.DDMMYYYY:
          data = DateFormat('dd-MM-yyyy')
              .format(DateTime.parse(data.substring(0, data.lastIndexOf(':'))));
          break;
        case GtTileDateFormat.DDMMYYYY_HHMM:
          data = DateFormat('dd-MM-yyyy hh:mm')
              .format(DateTime.parse(data.substring(0, data.lastIndexOf(':'))));
          break;
        default:
          data;
          break;
      }
    }
    return data;
  }

  // GET LISTVIEW STRIPED HEADER FIELD
  static List<Widget> getListViewHeaderWidget(
      {dynamic headerFields,
      Color priColor = Colors.blue,
      bool headerMobile = false,
      bool horizinalScrollable = false,
      bool isMobileScreen = false}) {
    List<Widget> widgets;
    widgets = [];
    headerFields.forEach((e) => {
          if ((e.type == GtListViewHeaderFieldType.BUTTON && headerMobile) ||
              !headerMobile)
            widgets.add(getHeaderWidget(headerFields: e, priColor: priColor,horizinalScrollable: horizinalScrollable,isMobileScreen: isMobileScreen))
        });
    return widgets;
  }

  static Widget getHeaderWidget(
      {dynamic headerFields, Color priColor = Colors.blue,bool horizinalScrollable = false,bool isMobileScreen = false}) {
    Widget widget;
    switch (headerFields.type) {
      case GtListViewHeaderFieldType.STRING:
        widget = horizinalScrollable ? SizedBox(
          width: isMobileScreen ?headerFields.mobileFlex * 100 : headerFields.flex * 100,
          child: GtText(
            text: headerFields.textValue,
            textStyle: headerFields.textStyle,
            textAlign: headerFields.textAlign,
          //child: GtCurrency(labelTextStyle: TextStyle(color: headerFields.textColor,fontWeight: FontWeight.w200),amountTextStyle: TextStyle(color: headerFields.textColor,fontWeight: FontWeight.bold)),
        )) : Expanded(
          flex: headerFields.flex,
          child: GtText(
            text: headerFields.textValue,
            textStyle: headerFields.textStyle,
            textAlign: headerFields.textAlign,
          ),
          //child: GtCurrency(labelTextStyle: TextStyle(color: headerFields.textColor,fontWeight: FontWeight.w200),amountTextStyle: TextStyle(color: headerFields.textColor,fontWeight: FontWeight.bold)),
        );
        break;
      case GtListViewHeaderFieldType.BUTTON:
        widget = horizinalScrollable ? SizedBox(
          width:isMobileScreen ?headerFields.mobileFlex * 100 : headerFields.flex * 100,
          child:Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(headerFields.buttonColor),
                        overlayColor:
                            MaterialStateProperty.all<Color>(headerFields.buttonHovorColor),
                      ),
                      onPressed: () {
                        if(headerFields.buttonOnPressed != null) headerFields.buttonOnPressed();
                      },
                      child: GtText(text: headerFields.buttonText,textStyle: headerFields.textStyle,)),
                ),
              ],
            )) : Expanded(
            flex: headerFields.flex,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(headerFields.buttonColor),
                        overlayColor:
                            MaterialStateProperty.all<Color>(headerFields.buttonHovorColor),
                      ),
                      onPressed: () {
                        if(headerFields.buttonOnPressed != null) headerFields.buttonOnPressed();
                      },
                      child: GtText(text: headerFields.buttonText,textStyle: headerFields.textStyle,)),
                ),
              ],
            ));
        break;
      case GtListViewHeaderFieldType.ICON:
        widget =horizinalScrollable ? SizedBox(
          width: isMobileScreen ?headerFields.mobileFlex * 100 : headerFields.flex * 100,
          child:GtIcon(
            icondata: headerFields.iconData,
            color: headerFields.iconColor,
        )): Expanded(
          flex: headerFields.flex,
          child: GtIcon(
            icondata: headerFields.iconData,
            color: headerFields.iconColor,
          ),
        );
        break;
      default:
        widget;
        break;
    }
    return widget;
  }

   ///IT RETURNS THE FORM_FIELD WIDET FOR THE FORM VIEW
  static Widget getFormViewWidget(
    String controllerTag,
    GtFormField gtFormField,
    String key, {
    Function formFieldOnChangeHandler,
    Function setFieldValues,
    Function getFieldValues,
    Function setFormCheckboxFieldValues,
    Function setselectedLookupDataValues,
    Function setAddLookupFormKey,
    Map<String, dynamic> fieldValues,
    bool forLookupForm = false,
    TextStyle textStyle,
    TextStyle valueTextStyle,
    bool validationMessage = true,
    dynamic obx,
  }) {
    textStyle = textStyle == null ? TextStyle(fontSize: 12,) : textStyle;
    EdgeInsets _formFieldPadding = EdgeInsets.all(5.0);
    bool isMobilePortrait = false;
    switch (gtFormField.type) {
      case GtFormFieldType.INPUT:
      
        return Expanded(
          flex: isMobilePortrait ? gtFormField.mobileFlex : gtFormField.flex,
          child: Container(
            padding: _formFieldPadding,
            child: GtTextFormField(
              textInputType: gtFormField.textInputType,
              labeltextStyle: textStyle,
              textStyle: valueTextStyle,
              fieldLabel: key,
              isReadOnly: gtFormField.isreadOnly,
              isRequired: gtFormField.isRequired,
              onChangeHandler: (changedVal) {
                ///ON_CHANGE HANDLER
                formFieldOnChangeHandler(
                  gtFormField.fieldKey,
                  changedVal,
                  forLookupForm: forLookupForm,
                  fromOnChanged: true,
                );
              },
              
              textEditingController: fieldValues[gtFormField.fieldKey] != null ? TextEditingController(text: fieldValues[gtFormField.fieldKey].toString()) : gtFormField.textEditingController,
            ),
          ),
        );
        break;

      case GtFormFieldType.DROPDOWN:
        return Expanded(
          flex: isMobilePortrait ? gtFormField.mobileFlex : gtFormField.flex,
          child: Container(
            padding: _formFieldPadding,
            child: 
            // Obx(() =>
             GtDropdownFormField(
                dropdownValue: getFieldValues(
                  gtFormField.fieldKey,
                  forLookupForm: forLookupForm,
                ),
                iconData: Icons.arrow_drop_down,
                items: gtFormField.dropdownItems,
                dropDownBackGround: gtFormField.dropDownBackgroundColor,
                textStyle: textStyle,
                valueTextStyle: valueTextStyle,
                isReadOnly: gtFormField.isreadOnly,
                onChangedhandler: !gtFormField.isreadOnly ? (val) => {
                  setFieldValues(
                    gtFormField.fieldKey,
                    val,
                    fromOnChanged: true,
                    forLookupForm: forLookupForm,
                  ),

                  ///ON_CHANGE HANDLER
                  formFieldOnChangeHandler(
                    gtFormField.fieldKey,
                    val,
                    forLookupForm: forLookupForm,
                    fromOnChanged: true,
                  ),
                }: null,
                isRequired: gtFormField.isRequired,
                
                label: key,
              ),
            // ),
          
        ));
        break;

      case GtFormFieldType.LOOKUP:
        List<dynamic> templist = [];
        templist = [];

        ///HERE SETTING THE LOOKUP SUGGESTIONS LIST TO EMPTY FOR FIRST TIME
        //controller.setLookupDataValues(gtFormField.nodeKey, templist);
        // Rx<List<dynamic>> _tmp;
        // _tmp = new Rxn<List<dynamic>>();
        List<dynamic> _tmp;
        _tmp = new List<dynamic>.empty(growable: true);
        _tmp = [];

        ///HERE SETTING THE SELECTED LOOKUP DATA VALUES LIST TO EMPTY FOR FIRST TIME
        setselectedLookupDataValues(gtFormField.nodeKey, _tmp);
        return Expanded(
            flex: isMobilePortrait ? gtFormField.mobileFlex : gtFormField.flex,
            child: Container(
                padding: _formFieldPadding,
                child: 
                // Obx(() => 
                GtTagTextField(
                    displayInFieldLabel: gtFormField.displayInFieldLabel,
                    fieldLabel: key,
                    isRequired: gtFormField.isRequired,
                    onSavedHander: (savedVal) {},
                    allowMultiselection: gtFormField.isMultiselect,
                    addNewHandler: (_val) {
                      if (gtFormField.lookupAddFormFields != null) {
                        ///SETS THE FORM KEY FOR DIALOG
                        // setAddLookupFormKey(
                        //   key,
                        //   new GlobalKey<FormState>(),
                        // );

                        ///OPENS UP THE DIALOG FOR THE LOOKUP DATA INSERTION
                        // Get.dialog(
                        //   GtLookupAddFormView(
                        //     tag: controllerTag,
                        //     dialogTitle: key,
                        //     formKey: controller.addLookupFormKeys[key],
                        //     fromMapjson: gtFormField.lookupAddFormFields,
                        //     parentFormFieldKey: key,
                        //     lookupAddNodeKey: gtFormField.lookupAddNodeKey,
                        //     lookupNodeKey: gtFormField.nodeKey,
                        //     isMultiselect: gtFormField.isMultiselect,
                        //     parentFieldKey: gtFormField.fieldKey,
                        //     parentValuePath: gtFormField.valuePath,
                        //     parentTextEditingController:
                        //         gtFormField.textEditingController,
                        //   ),
                        // );
                      }
                    },
                    looupKeyVisibile: gtFormField.looupKeyVisibile,
                    lookupFields: gtFormField.lookupFields,
                    //selectedTaglist: selectedlookupData[gtFormField.nodeKey].value,
                    onSuggestionSelected: (_val, isMutli) {
                      setselectedLookupDataValues(
                        gtFormField.nodeKey,
                        _val,
                        fromOnChanged: true,
                        ismultiSelect: isMutli,
                        fieldKey: gtFormField.fieldKey,
                        valuePath: gtFormField.valuePath,
                      );
                    },
                    suggestionsCallback: (pattern) {
                      // return getSuggestions(
                      //   pattern,
                      //   gtFormField.nodeKey,
                      //   gtFormField.lookupFields,
                      // );
                    },
                    textEditingController: gtFormField.textEditingController,
                    //taglist: lookupData[gtFormField.nodeKey],
                    onDeleted: (val) => {
                      // onDeleteHandler(
                      //   gtFormField.nodeKey,
                      //   val,
                      //   ismultiSelect: gtFormField.isMultiselect,
                      //   fieldKey: gtFormField.fieldKey,
                      //   valuePath: gtFormField.valuePath,
                      //   focusNode: gtFormField.focusNode,
                      // )
                    },
                    focusNode: gtFormField.focusNode,
                  ),
                )
                // )
                );
        break;

      case GtFormFieldType.DATETIME:
        return Expanded(
            flex: isMobilePortrait ? gtFormField.mobileFlex : gtFormField.flex,
            child: Container(
              padding: _formFieldPadding,
              child: GtDate(
                iconColor: textStyle.color,
                selectedTextStyle: textStyle,
                labeltextStyle: textStyle,
                timetextStyle: textStyle,
                label: key,
                isRequired: gtFormField.isRequired,
                type: gtFormField.dateTimeType,
                isReadOnly: gtFormField.isreadOnly,
                initialDate: fieldValues[gtFormField.fieldKey] ?? DateTime.now(),
                firstDate: gtFormField.firstDate ?? DateTime(1990),
                lastDate: gtFormField.lastDate ?? DateTime(2100),
                prefixDateIcon: gtFormField.prefixDateIcon,
                prefixTimeIcon: gtFormField.prefixTimeIcon,
                suffixDateIcon: gtFormField.suffixDateIcon,
                suffixTimeIcon: gtFormField.suffixTimeIcon,
                datefieldLabel: gtFormField.dateFieldText,
                timefieldLabel: gtFormField.timeFieldText,
                dateTextEditingController:
                    gtFormField.dateTextEditingController,
                timeTextEditingController:
                    gtFormField.timeTextEditingController,
                onDateSubmitted:
                    (dynamic date, GtDateTimeType type, dynamic standardDate) {
                  setFieldValues(
                    gtFormField.fieldKey,
                    standardDate,
                    fromOnChanged: true,
                    forLookupForm: forLookupForm,
                  );

                  ///ON_CHANGE HANDLER
                  formFieldOnChangeHandler(
                    gtFormField.fieldKey,
                    standardDate,
                    forLookupForm: forLookupForm,
                    fromOnChanged: true,
                  );
                },
              
          ),
        ));
        break;

      case GtFormFieldType.CHECKBOX:
        return Expanded(
            flex: isMobilePortrait ? gtFormField.mobileFlex : gtFormField.flex,
            child: Container(
          padding: _formFieldPadding,
          child: 
          GtCheckboxFormField(
              isRequired: gtFormField.isRequired,
              label: key,
              displayMapFields: gtFormField.displayMapFields,
              selectedCheckboxValues: 
                   getFieldValues(gtFormField.fieldKey, forLookupForm: forLookupForm),
              onChangedHandler: (isChecked, _val) {
                ///HERE CALLING CONTROLLER FUNCTION FOR SETTINGTHE CHECBOX FIELD CHECKED AND UNCHECKED DATA
                setFormCheckboxFieldValues(
                  gtFormField.fieldKey,
                  _val,
                  isChecked,
                  fieldKey: gtFormField.fieldKey,
                  forLookupForm: forLookupForm,
                  setApiVariables: true,
                );
              },
              textStyle: textStyle,
              validationMessage: validationMessage,
              )
        ));
        break;

      case GtFormFieldType.RADIO_BUTTON:
        return Expanded(
            flex: isMobilePortrait ? gtFormField.mobileFlex : gtFormField.flex,
            child: Container(
          padding: _formFieldPadding,
          child: 
          //  Obx(() => 
          GtRadioButtonFormField(
              isRequired: gtFormField.isRequired,
              label: key,
              displayMapFields: gtFormField.displayMapFields,
              selectedRadioButtonVal: 
                  getFieldValues(gtFormField.fieldKey, forLookupForm: forLookupForm),
              onChangedHandler: (isChecked, _val) {
                setFieldValues(
                  gtFormField.fieldKey,
                  _val,
                  forLookupForm: forLookupForm,
                  fromOnChanged: true,
                );

                ///HANDLING RADIO BUTTON ON CHANGE EVENT
                formFieldOnChangeHandler(
                  gtFormField.fieldKey,
                  _val,
                  forLookupForm: forLookupForm,
                  fromOnChanged: true,
                );
              },
              textStyle: textStyle,
              validationMessage: validationMessage,
             ),
          // ),
        ));
        break;

      case GtFormFieldType.SWITCH_BUTTON:
        return Expanded(
            flex: isMobilePortrait ? gtFormField.mobileFlex : gtFormField.flex,
            child: Container(
          padding: _formFieldPadding,
          child: Align(
            alignment: Alignment.bottomRight,
            child:
          GtSwitchButtonFormField(
              isRequired: gtFormField.isRequired,
              label: key,
              validationMessage: validationMessage,
              crossAxisAlignment: CrossAxisAlignment.start,
              textStyle: textStyle,
              switchValue: getFieldValues(
                gtFormField.fieldKey,
                forLookupForm: forLookupForm,
              ),
              onChangedHandler: (onChangedVal) {
                setFieldValues(
                  gtFormField.fieldKey,
                  onChangedVal,
                  forLookupForm: forLookupForm,
                  fromOnChanged: true,
                );

                ///HANDLING RADIO BUTTON ON CHANGE EVENT
                formFieldOnChangeHandler(
                  gtFormField.fieldKey,
                  onChangedVal,
                  forLookupForm: forLookupForm,
                  fromOnChanged: true,
                );
              },
            ),)
        ));
        break;

      default:
        return Container();
    }
  }  
}
