enum TextformatType {
  headline1,
  headline2,
  headline3,
  headline4,
  headline5,
  headline6,
  subtitle1,
  bodyText1,
  bodyText2,
  caption,
  subtitle2,
  overline,
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
  imageCaption,
  cardtitlewithopacity,
  textwithopacity,
  textwithbold
}

enum GtMobileFieldVisibility {
  VISIBLE,
  DISABLE,
  PARTIALLY_DISABLE,
}

enum WidgetType {
  PRE_TITLE,
  TITLE,
  TITLE_POSTFIX,
  SUBTITLE,
  SUBTITLE_POSTFIX,
  DISABLE,
}

enum GtFieldType {
  STRING,
  EMAIL,
  PHONE,
  CHIP,
  BANNER,
  FILTER,
  IMAGE,
  STATUS,
  DATE,
  QUANTITY,
  AVATAR,
  CURRENCY
}

enum GtCartFieldType { STRING, TITLE, IMAGE, AMOUNT }

enum GtValueType { STRING, LIST }

enum ViewType { both, list, card }

enum GtFilterType {
  RADIO_BUTTON_FILTER,
  CHECKBOX_BUTTON_FILTER,
  RANGE_FILTER,
  SORT_FILTER,
  LOOK_UP_FILTER,
}

enum GtFormFieldType {
  INPUT,
  LOOKUP,
  DROPDOWN,
  DATETIME,
  CHECKBOX,
  RADIO_BUTTON,
  SWITCH_BUTTON,
}
enum GtDateTimeType {
  DATE,
  TIME,
  BOTH,
}

enum ControllerType {
  LIST,
  FORM,
}

/// ADDED FOR HANDLING NULL VALUES BASED ON DATA TYPE
enum GtDataType { DOUBLE, STRING, INT }

/// ADDED FOR LISTVIEW INPUT TYPE
enum GtListInputType { GRAPHQL, HTTP, STATIC }

/// ADDED FOR LISTVIEW DATE FORMATE TYPE
enum GtTileDateFormat { DDMMYYYY, DDMMYYYY_HHMM }

enum ButtonType { PRIMARY, PLAIN }

// ADDED FOR THE POSITION OF WIDGET
enum GtPosition { PREFIX, POSTFIX }

enum GtButtonType { BUTTON, RADIO, IMAGE }

// ADDED FOR LISTVIEW TABLE TYPES
enum GTListViewTableType { Normal, STRIPED }

/// LISTVIEW HEADER FILED FIELD TYPE
enum GtListViewHeaderFieldType {
  STRING,
  BUTTON,
  ICON,
}
