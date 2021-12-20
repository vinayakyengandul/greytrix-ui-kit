import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './list_view.dart';
import './grid_view.dart';
import 'dart:math' as math;
import '../../../greytrix_ui_kit.dart';

class GtListPage extends StatelessWidget {
  GtListPage({
    Key key,
    this.title,
    @required this.listItems,
    this.enablefilter = false,
    this.viewtype,
    this.backNavigation = false,
    this.selectAllcheckbox,
    this.selectallRecords = false,
    this.showStats,
    this.leadingIcon,
    this.trailingIcon,
    this.onDetailsNavigateHandler,
    this.onSelectionHandler,
    this.gtTileRowCrossAxisAlignment = CrossAxisAlignment.center,
    this.gtTileRowMainAxisAlignment = MainAxisAlignment.center,
    this.rowsCount = 2,
    this.cardAspectRatio = 1.5,
    this.cardCrossAxisSpacing = 8,
    this.cardMainAxisSpacing = 12,
    this.tag,
    this.filterHandler,
    this.rangeFilterLimits,
    this.rangeFilterDivisions = 10,
    this.toMapjson,
    this.isFilterProcessing = false,
    this.pathNavigation = "",
    this.isSpaceInRecords = false,
    this.filtersData,
    this.onHoverHandler,
    this.toggleListGridView,
    this.backgroundcolor,
    this.onDeleteHandler,
    this.quantityInitialValue,
    this.incrementHandler,
    this.decrementHandler,
    @required this.size,
    this.entity,
    this.isleadingIconPosition = true,
    this.listViewTableType = GTListViewTableType.Normal,
    this.primaryColor,
    this.checkboxactiveColor,
    this.checkboxcheckColor,
    this.checkboxfocusColor,
    this.selectedRowColor,
    this.jsonHeader,
    this.filterBottomSheet,
    this.isLeadingShow = true,
    this.cardColor,
    this.swipeToOption,
    this.swipeIcon = Icons.delete,
    this.swipeBackgroundColor = Colors.red,
    this.swipeIconColor = Colors.white,
    this.mobileHeader = false,
    this.backButtonColor,
    //this.swipeConfirmMessage = "Are you sure you wish to delete this item?",
    this.swipeConfirmMessageTextWidget,
    //this.swipeConfirmButtonText = "DELETE",
    this.swipeConfirmButtonTextWidget,
    this.swipeCancelButtontextWidget,
    this.cardMarginEdgeInsets =
        const EdgeInsets.only(top: 1, bottom: 1, left: 1, right: 1),
    this.spaceBetweenKeyValue = false,
    this.horizinalScrollable = false,
    this.listItemPadding =
        const EdgeInsets.only(left: 5.0, top: 8.0, bottom: 8.0, right: 5.0),
    this.itemDatawidget,
    this.swipeSnackBartextWidget,
    this.mainCardMargin = const EdgeInsets.all(8),
    this.cardElevation = 1.0,
    this.noListFoundText = "No Records Found",
    this.customGridviewItemBuilder,
    this.listCustomWidgetType = GtListCustomWidgetType.NONE,
    this.currentListViewType = GtCurrentListViewType.LIST,
    this.cardItemElevation = 3.0,
    this.isBannerLeading = false,
  })  : assert(listItems != null),
        assert(rowsCount != null),
        assert((listCustomWidgetType == GtListCustomWidgetType.NONE &&
                toMapjson != null) ||
            (listCustomWidgetType == GtListCustomWidgetType.LIST &&
                itemDatawidget != null) ||
            (listCustomWidgetType == GtListCustomWidgetType.GRID &&
                customGridviewItemBuilder != null)),
        super(key: key);

  final Map<String, dynamic> filtersData;
  final String tag;
  final Widget title;
  final List<dynamic> listItems;
  final bool enablefilter;
  final ViewType viewtype;
  final bool backNavigation;
  final Function selectAllcheckbox;
  final Function showStats;
  final bool selectallRecords;
  final Widget leadingIcon;
  final Widget trailingIcon;
  final Function(bool value, dynamic record) onHoverHandler;

  ///TOGGLES BETWEEN THE LIST AND GRID VIEW
  final Function toggleListGridView;
  final Function(bool isSelected, dynamic item) onSelectionHandler;
  final Function(dynamic item, String path) onDetailsNavigateHandler;
  final CrossAxisAlignment gtTileRowCrossAxisAlignment;
  final MainAxisAlignment gtTileRowMainAxisAlignment;
  final int rowsCount;
  final double cardAspectRatio;
  final double cardCrossAxisSpacing;
  final double cardMainAxisSpacing;
  final bool isSpaceInRecords;
  final Function({
    Map<String, dynamic> filterData,
    bool fromFilter,
  }) filterHandler;
  final Map<String, RangeValues> rangeFilterLimits;
  final int rangeFilterDivisions;
  final Map<String, dynamic> toMapjson;
  final bool isFilterProcessing;
  final String pathNavigation;
  final Color backgroundcolor;
  final Size size;
  final Color cardColor;

// FOR CART FUNCTIONALITY
  final int quantityInitialValue;
  final Function(
    int index,
  ) incrementHandler;
  final Function(
    int index,
  ) decrementHandler;
  final Function(String key, dynamic object) onDeleteHandler;
  final String entity;
  final bool isleadingIconPosition;

  //FIELDS FOR LISTVIEWTYPE
  final GTListViewTableType listViewTableType;
  final Color primaryColor;
  final Color checkboxactiveColor;
  final Color checkboxcheckColor;
  final Color checkboxfocusColor;
  final Color selectedRowColor;
  final List<dynamic> jsonHeader;

  // FILTER BOTTOM SHEET FOR MOBILE
  final Function filterBottomSheet;
  //leading Icon SHOW OR NOR
  final bool isLeadingShow;
  //Swipe To OPtion
  final Function(dynamic, int) swipeToOption;
  final IconData swipeIcon;
  final Color swipeBackgroundColor;
  final Color swipeIconColor;

  // MOBILE HEADER
  final bool mobileHeader;
  // BACK BUTTON COLOR
  final Color backButtonColor;

  //final String swipeConfirmMessage;
  //final String swipeConfirmButtonText;

  final Widget swipeConfirmMessageTextWidget;
  final Widget swipeConfirmButtonTextWidget;
  final Widget swipeCancelButtontextWidget;
  final Widget swipeSnackBartextWidget;

  /// Records Card Margin
  final EdgeInsets cardMarginEdgeInsets;

  /// Record Key and Value SpaceBetween
  final bool spaceBetweenKeyValue;
  final bool horizinalScrollable;

  /// List Item Padding
  final EdgeInsets listItemPadding;

  ///Record Item data Widget from User
  final Function(int index, dynamic obj) itemDatawidget;
  final EdgeInsets mainCardMargin;

  /// Card Elevation
  final double cardElevation;

  /// NO LIST FOUND TEXT
  final String noListFoundText;

  /// GRID VIEW CUSTOM ITEM BUILDER
  final Function(int index, dynamic obj) customGridviewItemBuilder;

  /// CUSTOM ITEM WIDGET
  final GtListCustomWidgetType listCustomWidgetType;

  /// Selected list type for gtListPage
  final GtCurrentListViewType currentListViewType;
  /// Card Item Elevation
  final double cardItemElevation;
  /// Card Item banner postiton
  final bool isBannerLeading;

  // GETS TRAILING WIDGET
  Widget getTrailingWidget(int index) {
    print('getTrailingWidget');
    return trailingIcon != null
        ? Container(
            width: size.width > 450 ? 30.0 : 65.0,
            padding: size.width > 450
                ? EdgeInsets.only(right: 30)
                : EdgeInsets.only(right: 0.2),
            child: Row(
              children: [
                Container(
                    child: Padding(
                  padding: size.width > 450
                      ? EdgeInsets.only(right: 30)
                      : EdgeInsets.only(right: 0.2),
                  child: InkWell(
                    child: trailingIcon,
                    onTap: () =>
                        {onDeleteHandler(entity ?? '', listItems[index])},
                  ),
                ))
              ],
            ),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    ///RETURNS THE LEADING WIDGET
    Widget getLeadingWidget(int index, bool isImage, String valuePath) {
      return isLeadingShow
          ? selectAllcheckbox != null
              ? isImage
                  ? Container(
                      width: size.width > 450 ? 30.0 : 65.0,
                      // screen.isPhone ? 65.0 : 30.0,
                      padding:
                          EdgeInsets.only(right: size.width > 450 ? 0.2 : 30),
                      //EdgeInsets.only(right: screen.isPhone ? 0.2 : 30),
                      child: Row(
                        children: [
                          Container(
                            child: listViewTableType ==
                                    GTListViewTableType.Normal
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4.0, right: 25.0),
                                    child: Checkbox(
                                      value: listItems[index]['IsSelected'],
                                      onChanged: (value) => {
                                        if (onSelectionHandler != null)
                                          onSelectionHandler(
                                              !listItems[index]['IsSelected'],
                                              listItems[index])
                                      },
                                      checkColor: checkboxcheckColor,
                                      activeColor: checkboxactiveColor,
                                      focusColor: checkboxfocusColor,
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.0, right: 20.0),
                                    child: Center(
                                        child: GtCustomCheckbox(
                                      isChecked: listItems[index]['IsSelected'],
                                      onchanged: (value) => {
                                        if (onSelectionHandler != null)
                                          onSelectionHandler(
                                              !listItems[index]['IsSelected'],
                                              listItems[index])
                                      },
                                      selectedColor: primaryColor,
                                      selectedIconColor: Colors.white,
                                      size: 17,
                                      iconSize: 11,
                                    )),
                                  ),
                          ),
                          if (isleadingIconPosition)
                            listItems[index][valuePath].toString() == "" ||
                                    listItems[index][valuePath] == null
                                ? Container(
                                    width: 30.0,
                                    height: 30.0,
                                    child: Image(
                                      image: AssetImage(
                                        'assets/images/no_image_available.png',
                                        package: 'greytrix_ui_kit',
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 30.0,
                                    height: 30.0,
                                    child: Image(
                                      image: NetworkImage(
                                          listItems[index][valuePath]),
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace stackTrace) {
                                        return Image(
                                          image: AssetImage(
                                            'assets/images/no_image_available.png',
                                            package: 'greytrix_ui_kit',
                                          ),
                                        );
                                      },
                                    )),
                        ],
                      ),
                    )
                  : isleadingIconPosition
                      ? GtIconCheckbox(
                          backgroundColor: backgroundcolor ??
                              Theme.of(context).backgroundColor,
                          icon: Icons.perm_identity,
                          iconcolor: checkboxcheckColor,
                          selected: listItems[index]['IsSelected'],
                          onchanged: (value) => {
                            if (onSelectionHandler != null)
                              onSelectionHandler(value, listItems[index])
                          },
                          checkboxactiveColor: checkboxactiveColor,
                          checkboxcheckColor: checkboxcheckColor,
                          checkboxfocusColor: checkboxfocusColor,
                        )
                      : Padding(
                          padding: EdgeInsets.only(
                              left: 4.0,
                              right: listViewTableType ==
                                      GTListViewTableType.STRIPED
                                  ? 0.0
                                  : 25.0),
                          child: Center(
                              child: GtCustomCheckbox(
                            isChecked: listItems[index]['IsSelected'],
                            onchanged: (value) => {
                              if (onSelectionHandler != null)
                                onSelectionHandler(
                                    !listItems[index]['IsSelected'],
                                    listItems[index])
                            },
                            selectedColor: primaryColor,
                            selectedIconColor: Colors.white,
                            size: 17,
                            iconSize: 11,
                          )),
                        )
              : isImage && listItems[index][valuePath].toString() == ""
                  ? Container(
                      width: 50.0,
                      height: 50.0,
                      child: Image(
                        image: AssetImage(
                          'assets/images/no_image_available.png',
                          package: 'greytrix_ui_kit',
                        ),
                      ),
                    )
                  : leadingIcon != null
                      ? CircleAvatar(
                          child: leadingIcon,
                          backgroundColor: Get.context.theme.colorScheme.onPrimary,
                        )
                      : Container(
                          width: 50.0,
                          height: 50.0,
                          child: Image(
                            image: NetworkImage(listItems[index][valuePath]),
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace stackTrace) {
                              return Image(
                                image: AssetImage(
                                  'assets/images/no_image_available.png',
                                  package: 'greytrix_ui_kit',
                                ),
                              );
                            },
                          ))
          : Container();
    }

    Widget returnNastedScroll() {
      return NotificationListener<ScrollNotification>(
        child: currentListViewType == GtCurrentListViewType.LIST
            ? GtListView(
                listItems: listItems,
                gtTileRowCrossAxisAlignment: gtTileRowCrossAxisAlignment,
                gtTileRowMainAxisAlignment: gtTileRowMainAxisAlignment,
                onDetailsNavigateHandler: onDetailsNavigateHandler,
                rowsCount: rowsCount,
                selectAllcheckbox: selectAllcheckbox,
                toMapjson: toMapjson,
                getLeadingWidget: getLeadingWidget,
                onHoverHandler: onHoverHandler,
                pathNavigation: pathNavigation,
                isSpaceInRecords: isSpaceInRecords,
                quantityInitialValue: quantityInitialValue,
                decrementHandler: decrementHandler,
                incrementHandler: incrementHandler,
                trailingIcon: trailingIcon,
                getTrailingWidget: getTrailingWidget,
                isleadingIconPosition: isleadingIconPosition,
                listViewTableType: listViewTableType,
                selectedRowColor:
                    selectedRowColor ?? Theme.of(context).selectedRowColor,
                rowColors: cardColor ?? Theme.of(context).cardColor,
                isLeadingShow: isLeadingShow,
                swipeToOption: swipeToOption,
                swipeBackgroundColor: swipeBackgroundColor,
                swipeIcon: swipeIcon,
                swipeIconColor: swipeIconColor,
                swipeConfirmButtontextWidget: swipeConfirmButtonTextWidget,
                swipeConfirmMessagetextWidget: swipeConfirmMessageTextWidget,
                swipeCancelButtontextWidget: swipeCancelButtontextWidget,
                // swipeConfirmButtonText: swipeConfirmButtonTextWidget,
                // swipeConfirmMessage: swipeConfirmMessage,
                cardMarginEdgeInsets: cardMarginEdgeInsets,
                spaceBetweenKeyValue: spaceBetweenKeyValue,
                horizinalScrollable: horizinalScrollable,
                listItemPadding: listItemPadding,
                itemDatawidget: itemDatawidget,
                isCustomItemWidget:
                    listCustomWidgetType == GtListCustomWidgetType.LIST,
                swipeSnackBartextWidget: swipeSnackBartextWidget,
                mainCardMargin: mainCardMargin,
                cardItemElevation: cardItemElevation,
                isBannerLeading: isBannerLeading,
              )
            : GtGridView(
                cardAspectRatio: cardAspectRatio,
                cardCrossAxisSpacing: cardCrossAxisSpacing,
                cardMainAxisSpacing: cardMainAxisSpacing,
                listItems: listItems,
                onDetailsNavigateHandler: onDetailsNavigateHandler,
                onSelectionHandler: onSelectionHandler,
                rowsCount: rowsCount,
                toMapjson: toMapjson,
                getLeadingWidget: getLeadingWidget,
                onHoverHandler: onHoverHandler,
                pathNavigation: pathNavigation,
                customGridviewItemBuilder: customGridviewItemBuilder,
                isCustomItemGridView:
                    listCustomWidgetType == GtListCustomWidgetType.GRID,
              ),
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            print('In Next Paged event');

            if (filterHandler != null)
              filterHandler(
                filterData: filtersData,
                fromFilter: false,
              );
          }
          return true;
        },
      );
    }

    Widget returnColumn() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          listViewTableType == GTListViewTableType.STRIPED
              ? Container(
                  margin: mainCardMargin,
                  width: !horizinalScrollable ? double.infinity : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (backNavigation)
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: backButtonColor,
                                //Get.context.theme.iconTheme.color,
                              ),
                              onPressed: () {
                                // Get.back();
                                Navigator.pop(context);
                              }),
                        ),
                      if (selectAllcheckbox != null)
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Checkbox(
                            value: selectallRecords,
                            activeColor: primaryColor,
                            onChanged: (value) => {selectAllcheckbox(value)},
                          ),
                        ),
                      if (jsonHeader != null)
                        ...Common.getListViewHeaderWidget(
                            headerFields: jsonHeader,
                            priColor: primaryColor,
                            headerMobile: size.width < 450
                                ? mobileHeader
                                    ? false
                                    : true
                                : false,
                            horizinalScrollable: horizinalScrollable,
                            isMobileScreen: size.width < 450),
                      !horizinalScrollable
                          ? Expanded(
                              child: Container(),
                            )
                          : Container(),
                      size.width < 450
                          ? enablefilter || viewtype == ViewType.both
                              ? PopupMenuButton(
                                  color: Colors.white,
                                  offset: Offset(0, 35),
                                  tooltip: "More Actions",
                                  icon: Icon(Icons.more_vert),
                                  itemBuilder: (BuildContext context) =>
                                      <PopupMenuEntry>[
                                    if (enablefilter)
                                      PopupMenuItem(
                                        child: ListTile(
                                          leading: Icon(Icons.filter_list),
                                          title: GtText(
                                            text: 'Filter',
                                            // texttype: TextformatType.bodyText1,
                                            textStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.5,
                                              fontStyle: FontStyle.normal,
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.pop(context);
                                            if (filterBottomSheet != null)
                                              filterBottomSheet();
                                          },
                                        ),
                                      ),
                                    if (viewtype == ViewType.both)
                                      PopupMenuItem(
                                        child: ListTile(
                                          leading: currentListViewType ==
                                                  GtCurrentListViewType.LIST
                                              ? Icon(
                                                  Icons.dashboard,
                                                )
                                              : Icon(
                                                  Icons.list,
                                                ),
                                          title: GtText(
                                            text: currentListViewType ==
                                                    GtCurrentListViewType.LIST
                                                ? 'Card'
                                                : 'List',
                                            // texttype: TextformatType.bodyText1,
                                            textStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.5,
                                              fontStyle: FontStyle.normal,
                                            ),
                                          ),
                                          onTap: () {
                                            toggleListGridView();
                                          },
                                        ),
                                      ),
                                  ],
                                )
                              : Container()
                          : Row(children: [
                              if (viewtype == ViewType.both)
                                IconButton(
                                    icon: currentListViewType ==
                                            GtCurrentListViewType.LIST
                                        ? Icon(
                                            Icons.dashboard,
                                          )
                                        : Icon(
                                            Icons.list,
                                          ),
                                    onPressed: () => {
                                          toggleListGridView(),
                                        }),
                            ]),
                    ],
                  ))
              : Container(),
          Expanded(
              child: listItems.length == 0
                  ? GtNoListFound(
                      text: noListFoundText,
                    )
                  : horizinalScrollable
                      ? Container(
                          child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(children: [
                                returnNastedScroll(),
                              ])))
                      : returnNastedScroll()),
        ],
      );
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              listViewTableType == GTListViewTableType.Normal
                  ? Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 2,
                                  color: backButtonColor ??
                                      Theme.of(context).disabledColor))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (backNavigation)
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: backButtonColor,
                                    //Get.context.theme.iconTheme.color,
                                  ),
                                  onPressed: () {
                                    // Get.back();
                                    Navigator.pop(context);
                                  }),
                            ),
                          if (selectAllcheckbox != null)
                            Padding(
                                padding: size.width > 450
                                    //screen.isPhone
                                    ? EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)
                                    : EdgeInsets.fromLTRB(30.0, 0.0, 5.0, 0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                          width: 1.0, color: Colors.black),
                                      left: BorderSide(
                                          width: 1.0, color: Colors.black),
                                      right: BorderSide(
                                          width: 1.0, color: Colors.black),
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  child: Checkbox(
                                    value: selectallRecords,
                                    activeColor: primaryColor,
                                    onChanged: (value) =>
                                        {selectAllcheckbox(value)},
                                  ),
                                  height: 20,
                                  width: 20,
                                )),
                          Expanded(
                            flex: 6,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: this.title,
                            ),
                          ),
                          // screen.isPhone
                          // SizeConfig.isMobilePortrait
                          //     ? Padding(
                          //         padding: const EdgeInsets.all(0.5),
                          //         child: IconButton(
                          //           onPressed: () {
                          //             if (showStats != null) showStats();
                          //           },
                          //           icon: Icon(Icons.arrow_drop_down),
                          //         ),
                          //       )
                          //     : SizedBox(
                          //         height: 1.0,
                          //       ),
                          // screen.isPhone
                          size.width < 450
                              ? enablefilter || viewtype == ViewType.both
                                  ? PopupMenuButton(
                                      color: Colors.white,
                                      offset: Offset(0, 100),
                                      tooltip: "More Actions",
                                      icon: Icon(Icons.more_vert),
                                      itemBuilder: (BuildContext context) =>
                                          <PopupMenuEntry>[
                                        if (enablefilter)
                                          PopupMenuItem(
                                            child: ListTile(
                                              leading: Icon(Icons.filter_list),
                                              title: GtText(
                                                text: 'Filter',
                                                // texttype: TextformatType.bodyText1,
                                                textStyle: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.5,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                        if (viewtype == ViewType.both)
                                          PopupMenuItem(
                                            child: ListTile(
                                              leading: currentListViewType ==
                                                      GtCurrentListViewType.LIST
                                                  ? Icon(
                                                      Icons.dashboard,
                                                    )
                                                  : Icon(
                                                      Icons.list,
                                                    ),
                                              title: GtText(
                                                text: currentListViewType ==
                                                        GtCurrentListViewType
                                                            .LIST
                                                    ? 'Card'
                                                    : 'List',
                                                // texttype: TextformatType.bodyText1,
                                                textStyle: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.5,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                              ),
                                              onTap: () {
                                                toggleListGridView();
                                              },
                                            ),
                                          ),
                                      ],
                                    )
                                  : Container()
                              : Row(children: [
                                  if (viewtype == ViewType.both)
                                    IconButton(
                                        icon: currentListViewType ==
                                                GtCurrentListViewType.LIST
                                            ? Icon(
                                                Icons.dashboard,
                                              )
                                            : Icon(
                                                Icons.list,
                                              ),
                                        onPressed: () => {
                                              toggleListGridView(),
                                            }),
                                ]),
                        ],
                      ),
                    )
                  : Container(),

              ///MAIN CONTENT
              Expanded(
                  flex: 4,
                  child: Container(
                    child: Card(
                        elevation: cardElevation,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        margin: mainCardMargin,
                        color: backgroundcolor ??
                            Theme.of(context).backgroundColor,
                        child: horizinalScrollable
                            ? SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: returnColumn())
                            : returnColumn()),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
