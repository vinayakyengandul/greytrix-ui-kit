import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/core_controller.dart';
import 'dart:math' as math;
import '../../greytrix_ui_kit.dart';

class CoreListView extends GetResponsiveView<CoreController> {
  CoreListView({
    this.title,
    this.toMapjson,
    this.rowsCount = 2,
    this.cardAspectRatio = 1,
    this.viewType = ViewType.list,
    this.leadingIcon,
    this.trailingIcon,
    this.tag,
    this.backNavigation = false,
    this.pathNavigation = "",
    this.enablefilter = false,
    this.isSpaceInRecords = false,
    this.postfixtitleText,
    this.prefixtitleText,
    this.titletextValuePath,
    this.selectAllcheckboxOption = true,
    this.isleadingIconPos = true,
    this.listViewTableType = GTListViewTableType.Normal,
    this.jsonHeader,
    this.cardElevation = 1.0,
    this.noListFoundText = "No Records Found",
  });

  @override
  final String tag;
  final String title;
  final String prefixtitleText;
  final String postfixtitleText;
  final String titletextValuePath;
  final Map<String, dynamic> toMapjson;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final ViewType viewType;
  final double cardAspectRatio;
  final int rowsCount;
  final bool enablefilter;
  final bool backNavigation;
  final String pathNavigation;
  final bool isSpaceInRecords;
  final bool selectAllcheckboxOption;
  final bool isleadingIconPos;
  final GTListViewTableType listViewTableType;
  final List<dynamic> jsonHeader;
  final double cardElevation;
  final String noListFoundText;

  
  @override
  Widget builder() {
    void modelBottomSheet() {
    if (Get.isOverlaysOpen) Navigator.pop(Get.context);
    controller.changeBottomSheetName("FILTER");
    Get.bottomSheet(GtListFilter(
      filterHandler: controller.fetchDataCoreList,
      isFilterProcessing: controller.isprocessingRequest,
      listItems: controller.state,
      rangeFilterDivisions: 10,
      rangeFilterLimits: controller.setRangefilterlimits(),
      toMapjson: controller.toMapfilterjson,
      // filtersData: controller.filtersData,
      // setFilterField: controller.setFilterField,
      selectedlookupData: controller.selectedlookupData,
      setselectedLookupDataValues: controller.setselectedLookupDataValues,
      onFilterClearHandler: controller.filterClearButton,
      getSuggestions: controller.getSuggestions,
      onDeleteHandler: controller.onDeleteHandler,
      lookupData: controller.lookupData,
    ));
  }

    Size size = Get.size;
    return Container(
      child: Center(
        child: controller.obx(
          (state) {
            return Stack(children: [
              Row(
                children: [
                  Expanded(
                      child: GtListPage(
                    rowsCount: rowsCount,
                    enablefilter: enablefilter,
                    title: GtText(
                      text: controller.getTitleText(
                        postfixtext: postfixtitleText,
                        prefixText: prefixtitleText,
                        title: title,
                        titleTextValuePath: titletextValuePath,
                      ),
                      //title,
                      //texttype: TextformatType.title,
                    ),
                    leadingIcon: GtIcon(
                      icondata: leadingIcon,
                    ),
                    trailingIcon: trailingIcon != null
                        ? GtIcon(icondata: trailingIcon)
                        : null,
                    listItems: state,
                    selectAllcheckbox: selectAllcheckboxOption
                        ? controller.checkallitem
                        : null,
                    selectallRecords: controller.isSelecteditem(),
                    onSelectionHandler: controller.selectionHandler,
                    viewtype: viewType,
                    cardAspectRatio: cardAspectRatio,
                    toMapjson: toMapjson,
                    tag: tag,
                    filterHandler: controller.fetchdata,
                    rangeFilterLimits: controller.setRangefilterlimits(),
                    isFilterProcessing: controller.isprocessingRequest,
                    gtTileRowMainAxisAlignment: MainAxisAlignment.center,
                    gtTileRowCrossAxisAlignment: CrossAxisAlignment.center,
                    onDetailsNavigateHandler:
                        controller.onDetailsNavigateHandler,
                    backNavigation: backNavigation,
                    pathNavigation: pathNavigation,
                    isSpaceInRecords: isSpaceInRecords,
                    onHoverHandler: controller.onHoverHandler,
                    isleadingIconPosition: isleadingIconPos,
                    size: size,
                    listViewTableType: listViewTableType,
                    primaryColor: Get.theme.appBarTheme.shadowColor,
                    checkboxcheckColor: Get.context.theme.accentIconTheme.color,
                    checkboxactiveColor: Get.context.theme.secondaryHeaderColor,
                    checkboxfocusColor: Get.context.theme.secondaryHeaderColor,
                    selectedRowColor: Get.context.theme.selectedRowColor,
                    backgroundcolor: Get.context.theme.secondaryHeaderColor,
                    jsonHeader: jsonHeader,
                    filterBottomSheet: modelBottomSheet,
                    cardColor:
                        Get.context.theme.buttonTheme.colorScheme.surface,
                    cardElevation: cardElevation,
                    noListFoundText: noListFoundText,
                  )),
                  if (enablefilter &&
                      !screen.isPhone &&
                      controller.toMapfilterjson != null)
                    Obx(() => controller.isFilterOpen.value
                        ? Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30))),
                            elevation: 6.0,
                            child: Container(
                              width: 250,
                              height: double.infinity,
                              child: GtListFilter(
                                filterHandler: controller.fetchDataCoreList,
                                isFilterProcessing:
                                    controller.isprocessingRequest,
                                listItems: state,
                                rangeFilterDivisions: 10,
                                rangeFilterLimits:
                                    controller.setRangefilterlimits(),
                                toMapjson: controller.toMapfilterjson,
                                // filtersData: controller.filtersData,
                                // setFilterField: controller.setFilterField,
                                selectedlookupData:
                                    controller.selectedlookupData,
                                setselectedLookupDataValues:
                                    controller.setselectedLookupDataValues,
                                onFilterClearHandler:
                                    controller.filterClearButton,
                                getSuggestions: controller.getSuggestions,
                                onDeleteHandler: controller.onDeleteHandler,
                                lookupData: controller.lookupData,
                              ),
                            ))
                        : Container()),
                ],
              ),
              if (enablefilter &&
                  !SizeConfig.isMobilePortrait &&
                  controller.toMapfilterjson != null)
                Obx(() => Positioned(
                    top: 300,
                    right: controller.isFilterOpen.value ? 240 : 0,
                    child: InkWell(
                        onTap: () {
                          controller.filteropenclose();
                        },
                        child: Container(
                            decoration: new BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 50.0,
                                    offset: Offset(0.0, 0.75))
                              ],
                            ),
                            child: controller.isFilterOpen.value
                                ? Icon(
                                    Icons.double_arrow,
                                    size: 25,
                                    color: Get
                                        .theme.buttonTheme.colorScheme.primary,
                                  )
                                : Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(math.pi),
                                    child: Icon(
                                      Icons.double_arrow,
                                      size: 25,
                                      color: Get.theme.buttonTheme.colorScheme
                                          .primary,
                                    ),
                                  ))))),
            ]);
          },
          onLoading: CircularProgressIndicator(),
          onError: (err) => Container(
            height: double.infinity,
            width: double.infinity,
            color: Get.theme.backgroundColor,
            child: Center(
              child:
                  Obx(() => controller.errormessage.value != ""
                      ? GtSomethingWentWrong(
                          message: controller
                                      .errormessage
                                      .value ==
                                  "API SERVICE ERROR"
                              ? "Server under Maintenance.. Please try again after sometime"
                              : controller
                                  .errormessage
                                  .value
                                  .toString(),
                        )
                      : Text(
                          err,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        )),
            ),
          ),
        ),
      ),
    );
  }
}
