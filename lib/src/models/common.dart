import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './gt_tile_field.dart';
import '../models/enums.dart';
import '../widgets/index.dart';

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
  }) {
    return GtText(
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
            GtText(
              text: '$key : ',
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
                      // texttype: gtTileField.webTextFormatType,
                      textStyle: gtTileField.textStyle,
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

            ///PREPARING THE SINGLE STRING TYPE WIDGET
            _widgetList.add(
              GtText(
                text: '$value',
                // texttype: gtTileField.webTextFormatType,
                textStyle: gtTileField.textStyle,
                textOverflow: gtTileField.textOverFlow,
              ),
            );
            _widgetContainer = Container(
              child: Wrap(
                children: _widgetList,
              ),
            );
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
                  child: Padding(
                    padding: EdgeInsets.only(right: 4.0),
                    child: _widgetContainer,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(right: 4.0),
                  child: _widgetContainer,
                ),
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
        return Expanded(
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
        );
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
        List<Widget> _chipsList = List<Widget>();
        _chipsList = [];

        ///PREPARING THE LIST OF WIDGETS FOR THE STRING AND LIST TYPE TO USE LIST FOR ROW OR A WRAP AS A CHILDRENS
        List<Widget> _widgetList = [
          if (gtTileField.displayKey == true)
            Padding(
              padding: EdgeInsets.only(top: 2.0),
              child: GtText(
                text: '$key :',
                //texttype: gtTileField.keyTextFormatType,
                textStyle: gtTileField.textStyle,
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
        return Expanded(
            flex: isMobilePortrait ? 1 : gtTileField.flex,
            child: InkWell(
              onHover: (value) {},
              onTap: () {
                if (navigationHandler != null) navigationHandler();
              },
              child: Container(
                child: Wrap(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (gtTileField.displayKey == true)
                      GtText(
                        text: '$key : ',
                        //texttype: gtTileField.keyTextFormatType,
                        textStyle: gtTileField.textStyle,
                      ),
                    value != "" && value != false
                        ? PhysicalModel(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: gtTileField.statusField[value.toString()],
                            elevation: 5.0,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 8, right: 8, bottom: 4, top: 4),
                              child: GtText(
                                text: value == true
                                    ? gtTileField.valuePath
                                    : '$value',
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          )
                        : Container(),
                  ],
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
                    text: '$key : ',
                    //texttype: gtTileField.keyTextFormatType,
                    textStyle: gtTileField.textStyle,
                  ),
                //getDateFormatGtText(gtTileField, key, value),
              ],
            ),
          ),
        );
        break;

      case GtFieldType.AVATAR:
        return Expanded(
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
        );
        break;

      case GtFieldType.CURRENCY:
        return Expanded(
          flex: isMobilePortrait ? 1 : gtTileField.flex,
          child: Container(
            child: Row(
              children: [
                if (gtTileField.displayKey == true)
                  GtText(
                    text: '$key : ',
                    textStyle: gtTileField.textStyle,
                  ),
                value != ""
                    ? Expanded(
                        child: GtCurrency(
                        amountTextStyle: gtTileField.textStyle,
                        amount: value.toString(),
                        currency: '\$',
                      ))
                    : Container(),
              ],
            ),
          ),
        );
        break;

      case GtFieldType.BUTTON:
        return Expanded(
          flex: isMobilePortrait ? 1 : gtTileField.flex,
          child: Container(
            child: Wrap(
              children: [
                if (gtTileField.displayKey == true)
                  GtText(
                    text: '$key : ',
                    textStyle: gtTileField.textStyle,
                  ),
                value != "" && value != false
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
                        text: value.toString(),
                        onPressed: () {
                          if (gtTileField.buttonOnPressed != null)
                            gtTileField.buttonOnPressed(itemData);
                        },
                      )
                    : Container(),
              ],
            ),
          ),
        );
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
      bool isMobileScreen = false}) {
    List<Widget> widgets;
    widgets = [];
    headerFields.forEach((e) => {
          if ((e.type == GtListViewHeaderFieldType.BUTTON && isMobileScreen) ||
              !isMobileScreen)
            widgets.add(getHeaderWidget(headerFields: e, priColor: priColor))
        });
    return widgets;
  }

  static Widget getHeaderWidget(
      {dynamic headerFields, Color priColor = Colors.blue}) {
    Widget widget;
    switch (headerFields.type) {
      case GtListViewHeaderFieldType.STRING:
        widget = Expanded(
          flex: headerFields.flex,
          child: GtText(
            text: headerFields.textValue,
            textStyle: TextStyle(color: headerFields.textColor),
            textAlign: TextAlign.center,
          ),
          //child: GtCurrency(labelTextStyle: TextStyle(color: headerFields.textColor,fontWeight: FontWeight.w200),amountTextStyle: TextStyle(color: headerFields.textColor,fontWeight: FontWeight.bold)),
        );
        break;
      case GtListViewHeaderFieldType.BUTTON:
        widget = Expanded(
            flex: headerFields.flex,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xffe8769f)),
                        overlayColor:
                            MaterialStateProperty.all<Color>(priColor),
                      ),
                      onPressed: () {},
                      child: GtText(text: 'ADD NEW')),
                ),
              ],
            ));
        break;
      case GtListViewHeaderFieldType.ICON:
        widget = Expanded(
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
}
