import 'package:flutter/material.dart';
import '../../greytrix_ui_kit.dart';
import './list_view.dart';
import './grid_view.dart';
import 'dart:math' as math;
import 'gt_iconcheckbox.dart';
import 'no_list_found.dart';

class GtListPageGeneric extends StatelessWidget {
  GtListPageGeneric({
    Key key,
    this.title,
    this.listItems,
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
    this.isListView,
    this.backgroundcolor,
  })  : assert(listItems != null),
        assert(rowsCount != null),
        super(key: key);

  final Map<String, dynamic> filtersData;
  final bool isListView;
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

  ///RETURNS THE LEADING WIDGET
  Widget getLeadingWidget(int index, bool isImage, String valuePath) {
    return selectAllcheckbox != null
        ? isImage
            ? Container(
                width: SizeConfig.isMobilePortrait ? 65.0 : 30.0,
                // screen.isPhone ? 65.0 : 30.0,
                padding: EdgeInsets.only(
                    right: SizeConfig.isMobilePortrait ? 0.2 : 30),
                //EdgeInsets.only(right: screen.isPhone ? 0.2 : 30),
                child: Row(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4.0, right: 25.0),
                        child: Checkbox(
                          value: listItems[index]['IsSelected'],
                          onChanged: (value) => {
                            if (onSelectionHandler != null)
                              onSelectionHandler(
                                  !listItems[index]['IsSelected'],
                                  listItems[index])
                          },
                          checkColor: Colors.grey,
                          //Get.context.theme.accentIconTheme.color,
                          activeColor: Colors.blueGrey,
                          //Get.context.theme.secondaryHeaderColor,
                          focusColor: Colors.lightBlue,
                          //Get.context.theme.secondaryHeaderColor,
                        ),
                      ),
                    ),
                    listItems[index][valuePath].toString() == ""
                        ? Container(
                            width: 30.0,
                            height: 30.0,
                            child: Image(
                              image: AssetImage(
                                'assets/images/no_image_available.png',
                                package: 'core',
                              ),
                            ),
                          )
                        : Container(
                            width: 30.0,
                            height: 30.0,
                            child: Image(
                              image: NetworkImage(listItems[index][valuePath]),
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace stackTrace) {
                                return Image(
                                  image: AssetImage(
                                    'assets/images/no_image_available.png',
                                    package: 'core',
                                  ),
                                );
                              },
                            )),
                  ],
                ),
              )
            : GtIconCheckbox(
                backgroundColor: backgroundcolor,
                icon: Icons.perm_identity,
                selected: listItems[index]['IsSelected'],
                onchanged: (value) => {
                  if (onSelectionHandler != null)
                    onSelectionHandler(value, listItems[index])
                },
              )
        : leadingIcon != null
            ? CircleAvatar(child: leadingIcon, backgroundColor: Colors.white
                //Get.context.theme.colorScheme.onPrimary,
                )
            : leadingIcon;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(width: 2, color: Colors.white)
                            // Get.context.theme.colorScheme.onPrimary),
                            )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (backNavigation)
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              //Get.context.theme.iconTheme.color,
                            ),
                            onPressed: () {
                              // Get.back();
                              Navigator.pop(context);
                            }),
                      ),
                    if (selectAllcheckbox != null)
                      Padding(
                          padding: SizeConfig.isMobilePortrait
                              //screen.isPhone
                              ? EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)
                              : EdgeInsets.fromLTRB(30.0, 0.0, 5.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                top:
                                    BorderSide(width: 1.0, color: Colors.black),
                                left:
                                    BorderSide(width: 1.0, color: Colors.black),
                                right:
                                    BorderSide(width: 1.0, color: Colors.black),
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
                              ),
                            ),
                            child: Checkbox(
                              value: selectallRecords,
                              activeColor: Colors.amberAccent,
                              onChanged: (value) => {selectAllcheckbox(value)},
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
                    SizeConfig.isMobilePortrait
                        ? Padding(
                            padding: const EdgeInsets.all(0.5),
                            child: IconButton(
                              onPressed: () {
                                if (showStats != null) showStats();
                              },
                              icon: Icon(Icons.arrow_drop_down),
                            ),
                          )
                        : SizedBox(
                            height: 1.0,
                          ),
                    // screen.isPhone
                    SizeConfig.isMobilePortrait
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
                                    leading: isListView == true
                                        ? Icon(
                                            Icons.dashboard,
                                          )
                                        : Icon(
                                            Icons.list,
                                          ),
                                    title: GtText(
                                      text:
                                          isListView == true ? 'Card' : 'List',
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
                        : Row(children: [
                            if (viewtype == ViewType.both)
                              IconButton(
                                  icon: isListView
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
              ),

              ///MAIN CONTENT
              Expanded(
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 4,
                            child: Container(
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 6.0,
                                  child:
                                      //Obx(() =>
                                      Column(
                                    children: [
                                      Flexible(
                                        child: listItems.length == 0
                                            ? GtNoListFound()
                                            : NotificationListener<
                                                ScrollNotification>(
                                                child: isListView == true
                                                    ? GtListView(
                                                        listItems: listItems,
                                                        gtTileRowCrossAxisAlignment:
                                                            gtTileRowCrossAxisAlignment,
                                                        gtTileRowMainAxisAlignment:
                                                            gtTileRowMainAxisAlignment,
                                                        onDetailsNavigateHandler:
                                                            onDetailsNavigateHandler,
                                                        rowsCount: rowsCount,
                                                        selectAllcheckbox:
                                                            selectAllcheckbox,
                                                        toMapjson: toMapjson,
                                                        getLeadingWidget:
                                                            getLeadingWidget,
                                                        onHoverHandler:
                                                            onHoverHandler,
                                                        pathNavigation:
                                                            pathNavigation,
                                                        isSpaceInRecords:
                                                            isSpaceInRecords,
                                                      )
                                                    : GtGridView(
                                                        cardAspectRatio:
                                                            cardAspectRatio,
                                                        cardCrossAxisSpacing:
                                                            cardCrossAxisSpacing,
                                                        cardMainAxisSpacing:
                                                            cardMainAxisSpacing,
                                                        listItems: listItems,
                                                        onDetailsNavigateHandler:
                                                            onDetailsNavigateHandler,
                                                        onSelectionHandler:
                                                            onSelectionHandler,
                                                        rowsCount: rowsCount,
                                                        toMapjson: toMapjson,
                                                        getLeadingWidget:
                                                            getLeadingWidget,
                                                        onHoverHandler:
                                                            onHoverHandler,
                                                        pathNavigation:
                                                            pathNavigation,
                                                      ),
                                                onNotification:
                                                    (ScrollNotification
                                                        scrollInfo) {
                                                  if (scrollInfo
                                                          .metrics.pixels ==
                                                      scrollInfo.metrics
                                                          .maxScrollExtent) {
                                                    print(
                                                        'In Next Paged event');

                                                    if (filterHandler != null)
                                                      filterHandler(
                                                        filterData: filtersData,
                                                        fromFilter: false,
                                                      );
                                                  }
                                                  return true;
                                                },
                                              ),
                                      ),
                                    ],
                                  )
                                  //),
                                  ),
                            )),
                      ],
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
