import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:backdrop/backdrop.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
import 'package:greytrix_ui_kit/src/controllers/filter_controller.dart';
import 'package:greytrix_ui_kit/src/models/advance_filter_class.dart';
import 'advance_add_filter.dart';

class GtListFilter extends StatelessWidget {
  GtListFilter({
    this.filterHandler,
    this.isFilterProcessing,
    this.rangeFilterDivisions = 10,
    this.rangeFilterLimits,
    this.toMapjson,
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
    this.filterData,
    this.advanceFilterBlankMessage =
        "Valid Fields or Operators not present, Please contact administrator",
  }) : assert((isAdvanceFilterEnable == true &&
                advanceFilterFields != null &&
                operatorCommon != null &&
                operatorNumeric != null &&
                operatorString != null) ||
            (isAdvanceFilterEnable == false));

  @override
  Map<String, Rx<List<dynamic>>> selectedlookupData =
      Map<String, Rx<List<dynamic>>>();

  ///USED TO STORE THE LOOKUPS DATA TO SHOW THE SUGGESTIONS
  RxMap<String, dynamic> lookupData = RxMap<String, dynamic>();

  ///IT RETURNS THE SUGGESTIONS LIST FOR THE SUGGESTIONS FORM FIELDS
  final List<dynamic> Function(
    String query,
    String key,
    Map<String, String> lookupFields,
  ) getSuggestions;

  ///SETS UP THE DROPDOWN_DATA
  final Function(
    String key,
    dynamic value, {
    String fieldKey,
    String valuePath,
    bool fromOnChanged,
    bool ismultiSelect,
  }) setselectedLookupDataValues;

  final Function(Map<String, dynamic> quickFilterData,
      List<Map<String, dynamic>> advanceFilterData) onFilterClearHandler;
  final Function(
    String key,
    dynamic value, {
    bool ismultiSelect,
    String fieldKey,
    String valuePath,
    FocusNode focusNode,
  }) onDeleteHandler;
  final Function(Map<String, dynamic> quickFilterData,
      List<Map<String, dynamic>> advanceFilterData) filterHandler;

  // String key, dynamic value,
  //   {bool fromOnChanged = false, bool resetArguments = false}
  final Map<String, RangeValues> rangeFilterLimits;
  final int rangeFilterDivisions;

  /// QUICK FILTER TO MAPJSON
  final Map<String, dynamic> toMapjson;

  /// FLAHG FOR IS FILTER IS PROCESS
  final bool isFilterProcessing;

  /// SCTROLL CONTROLLER FOR LISTVIEW
  final ScrollController scrollController;

  /// BOOL VALUE FOR IS BACKDROP CONTROLLER
  final bool isBackDropController;

  /// ADVANCE FILTER FILEDS TO DISPLAY IN DROPDOWN
  final List<GtAdvanceFilterField> advanceFilterFields;

  /// ADVANCE FILTER IS ENABLE OR NOT DEFAULT IS FALSE
  final bool isAdvanceFilterEnable;

  /// ADVANCE FILTER TITLE TEXT
  final String advanceFilterTitle;

  /// CHANGE BOOL VALUE FOR BACKDROP IS ON OR OFF
  final Function(bool) changeBackDrop;

  /// ADD BUTTON TEXT
  final String addButtonText;

  /// QUICK FILTER TITLE TEXT
  final String quickFilterTitle;

  /// FILTER TITLE TEXT
  final String filterTitle;

  /// CLEAR BUTTON TEXT
  final String clearButtonText;

  /// APPLY BUTTON TEXT
  final String applyButtonText;

  /// STRING OPERATORS LIST
  final List<GtAdvanceFilterOperator> operatorString;

  /// NUMERIC OPERATORS LIST
  final List<GtAdvanceFilterOperator> operatorNumeric;

  /// COMMON OPERATORS LIST
  final List<GtAdvanceFilterOperator> operatorCommon;

  /// THIS IS KEY FOR EACH WIDGET UNIQUE KEY
  final String keyLabel;

  /// FLAG FOR IS BACKDROP WIDGET OR NORAML
  final bool isBackDrop;

  /// QUICK FILTER SELECTED VALUES
  final Map<String, dynamic> filterData;

  /// ADVANCE FILTER BLANK MESSAGE
  final String advanceFilterBlankMessage;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
        FilterController(
            keyLabel: keyLabel,
            operatorString: operatorString,
            operatorCommon: operatorCommon,
            operatorNumeric: operatorNumeric,
            advanceFilterFields: advanceFilterFields,
            toMapQuickfilterjson: toMapjson,
            filterData: filterData),
        tag: keyLabel);
    List<Widget> _widgets = List<Widget>.empty(growable: true);

    List<Widget> _textWidgets = List<Widget>.empty(growable: true);

    Widget _dividerWidget = Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
    );
    Color _activeColor = Theme.of(context).buttonTheme.colorScheme.primary;
    try {
      controller.toMapfilterjson.value.forEach((key, value) {
        if (value.type == GtFieldType.FILTER) {
          switch (value.filterType) {

            ///RADIO_BUTTON_FILTER_WIDGET
            case GtFilterType.RADIO_BUTTON_FILTER:
              if (value.filterItems != null && value.filterItems.length > 0) {
                _widgets.add(Obx(() => Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: GtText(
                                text: '${value.filterLabel}',
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                              ),
                            )),
                        if (isBackDrop)
                          Card(
                            child: Row(children: [
                              ...value.filterItems.entries.map(
                                (e) => Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                        children: [
                                          Obx(() => Checkbox(
                                                activeColor: _activeColor,
                                                value: controller
                                                            .checkRadioFilter[
                                                        value.filterValue] ==
                                                    e.value,
                                                onChanged: (val) {
                                                  // val?'${val}':'${val}'
                                                  controller.setFilterField(
                                                      '${value.filterValue}',
                                                      e.value,
                                                      fromOnChanged: true,
                                                      filterType:
                                                          value.filterType,
                                                          isNastedFilter: value.isNastedFilter);
                                                },
                                              )),
                                          GtText(
                                            text: '${e.key}',
                                            textStyle: TextStyle(
                                                fontWeight:
                                                    controller.filtersData[value
                                                                .filterValue] ==
                                                            e.value
                                                        ? FontWeight.bold
                                                        : FontWeight.w100,
                                                color: Get.context.theme
                                                    .primaryColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                          )
                        else
                          ...value.filterItems.entries.map((e) => Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        activeColor: _activeColor,
                                        value: controller.checkRadioFilter[
                                                value.filterValue] ==
                                            e.value,
                                        onChanged: (val) {
                                          // val?'${val}':'${val}'
                                          controller.setFilterField(
                                              '${value.filterValue}', e.value,
                                              fromOnChanged: true,
                                              filterType: value.filterType,
                                              isNastedFilter: value.isNastedFilter);
                                        },
                                      ),
                                      GtText(
                                        text: '${e.key}',
                                        textStyle: TextStyle(
                                            fontWeight: controller.filtersData[
                                                        value.filterValue] ==
                                                    e.value
                                                ? FontWeight.bold
                                                : FontWeight.w100,
                                            color:
                                                Get.context.theme.primaryColor),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        _dividerWidget,
                      ],
                    )));
              }
              break;

            // ///SORT FILTER WIDGET
            case GtFilterType.SORT_FILTER:
              if (value.filterItems != null && value.filterItems.length > 0) {
                _widgets.add(
                  Obx(
                    () => Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: GtText(
                              text: '${value.filterLabel}',
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                  color: Get.context.theme.primaryColor),
                            ),
                          ),
                        ),
                        ...value.filterItems.entries.map(
                          (e) => Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(children: [
                                Checkbox(
                                  activeColor: _activeColor,
                                  value: controller
                                          .filtersData[value.filterValue] ==
                                      e.value,
                                  onChanged: (val) {
                                    controller.setFilterField(
                                        '${value.filterValue}', e.value,
                                        fromOnChanged: true,
                                        filterType: GtFilterType.SORT_FILTER);
                                  },
                                ),
                                GtText(
                                  text: '${e.key}',
                                  textStyle: TextStyle(
                                      fontWeight: controller.filtersData[
                                                  value.filterValue] ==
                                              e.value
                                          ? FontWeight.bold
                                          : FontWeight.w100,
                                      color: Get.context.theme.primaryColor),
                                ),
                              ]),
                            ),
                          ),
                        ),

                        /// TODO: MULTI FIELDS SORT FILTER
                        // if (isBackDrop)
                        // ...value.filterItems.entries.map(
                        //   (e) =>
                        //   Row(children: [
                        //     SizedBox(
                        //         height: 30,
                        //         child: Container(
                        //           padding: EdgeInsets.all(3.0),
                        //           decoration: BoxDecoration(
                        //             color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                        //             borderRadius: new BorderRadius.circular(10.0),
                        //           ),
                        //           child: GtText(text: e.value)
                        //         )),
                        //         Row(
                        //       children: [
                        //         Checkbox(
                        //           activeColor: _activeColor,
                        //           value: filtersData[e.value] == "ASC",
                        //           onChanged: (val) {
                        //             setFilterField(value.filterValue,  {e.value : 'ASC'},
                        //                 fromOnChanged: true,filterType: GtFilterType.SORT_FILTER);
                        //           },
                        //         ),
                        //         GtText(
                        //           text: 'ASC',
                        //           textStyle: TextStyle(
                        //               fontWeight:
                        //                   filtersData[value.filterValue]== "ASC"
                        //                       ? FontWeight.bold
                        //                       : FontWeight.w100,
                        //               color: Get
                        //                   .context.theme.primaryColor),
                        //         ),
                        //         Checkbox(
                        //           activeColor: _activeColor,
                        //           value: filtersData[e.value] == "DESC",
                        //           onChanged: (val) {
                        //             setFilterField(value.filterValue, {e.value : 'DESC'},
                        //                 fromOnChanged: true, filterType: GtFilterType.SORT_FILTER);
                        //           },
                        //         ),
                        //         GtText(
                        //           text: 'DESC',
                        //           textStyle: TextStyle(
                        //               fontWeight:
                        //                   filtersData[value.filterValue] == "DESC"
                        //                       ? FontWeight.bold
                        //                       : FontWeight.w100,
                        //               color: Get
                        //                   .context.theme.primaryColor),
                        //         ),
                        //       ],
                        //     )

                        //       ])

                        //     )
                        // else
                        // ...value.filterItems.entries.map(
                        //   (e) => Padding(
                        //     padding: EdgeInsets.all(3.0),
                        //     child: Align(
                        //       alignment: Alignment.bottomCenter,
                        //       child: Row(children: [
                        //         Checkbox(
                        //           activeColor: _activeColor,
                        //           value: filtersData[value.filterValue] ==
                        //               e.value,
                        //           onChanged: (val) {
                        //             setFilterField(
                        //                 '${value.filterValue}', e.value,
                        //                 fromOnChanged: true);
                        //           },
                        //         ),
                        //         GtText(
                        //           text: '${e.key}',
                        //           // texttype:
                        //           //     filtersData[value.filterValue] == e.value
                        //           //         ? TextformatType.textwithbold
                        //           //         : TextformatType.bodyText2,
                        //           textStyle: TextStyle(
                        //               fontWeight:
                        //                   filtersData[value.filterValue] ==
                        //                           e.value
                        //                       ? FontWeight.bold
                        //                       : FontWeight.w100,
                        //               color: Get.context.theme.primaryColor),
                        //         ),
                        //       ]),
                        //     ),
                        //   ),
                        // ),
                        Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: GtText(
                                              text: 'Sort Type',
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 13,
                                                  color: Get.context.theme
                                                      .primaryColor),
                                            )),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        activeColor: _activeColor,
                                        value: controller.filtersData['sort'] ==
                                            "ASC",
                                        onChanged: controller.filtersData[
                                                    value.filterValue] ==
                                                null
                                            ? null
                                            : (val) {
                                                controller.setFilterField(
                                                    'sort', 'ASC',
                                                    fromOnChanged: true,
                                                    filterType: GtFilterType
                                                        .SORT_FILTER);
                                              },
                                      ),
                                      GtText(
                                        text: 'ASC',
                                        textStyle: TextStyle(
                                            fontWeight: controller
                                                        .filtersData['sort'] ==
                                                    "ASC"
                                                ? FontWeight.bold
                                                : FontWeight.w100,
                                            color:
                                                Get.context.theme.primaryColor),
                                      ),
                                      Checkbox(
                                        activeColor: _activeColor,
                                        value: controller.filtersData['sort'] ==
                                            "DESC",
                                        onChanged: controller.filtersData[
                                                    value.filterValue] ==
                                                null
                                            ? null
                                            : (val) {
                                                controller.setFilterField(
                                                    'sort', 'DESC',
                                                    fromOnChanged: true,
                                                    filterType: GtFilterType
                                                        .SORT_FILTER);
                                              },
                                      ),
                                      GtText(
                                        text: 'DESC',
                                        textStyle: TextStyle(
                                            fontWeight: controller
                                                        .filtersData['sort'] ==
                                                    "DESC"
                                                ? FontWeight.bold
                                                : FontWeight.w100,
                                            color:
                                                Get.context.theme.primaryColor),
                                      ),
                                    ],
                                  )
                                ]))),
                        _dividerWidget,
                      ],
                    ),
                  ),
                );
              }
              break;

            // ///RANGE FILTER WIDGET
            case GtFilterType.RANGE_FILTER:
              if (rangeFilterLimits != null) {
                MapEntry _rangeLimits = rangeFilterLimits.entries.singleWhere(
                  (element) => element.key == "${value.filterValue}",
                  orElse: () => null,
                );
                if (_rangeLimits != null) {
                  _widgets.add(
                    Obx(
                      () => Column(
                        children: [
                          ListTile(
                              dense: true,
                              title: GtText(
                                text: '${value.filterLabel}',
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13,
                                    color: Get.context.theme.primaryColor),
                              )),
                          ListTile(
                            dense: true,
                            title: RangeSlider(
                              activeColor: _activeColor,
                              inactiveColor: Colors.grey,
                              values: RangeValues(
                                double.parse(controller
                                    .filtersData['${value.rangeStart}']
                                    .toString()),
                                double.parse(controller
                                    .filtersData['${value.rangeEnd}']
                                    .toString()),
                              ),
                              min: (_rangeLimits.value).start,
                              max: (_rangeLimits.value).end,
                              divisions: rangeFilterDivisions,
                              labels: RangeLabels(
                                (controller.filtersData["${value.rangeStart}"])
                                    .toString(),
                                (controller.filtersData["${value.rangeEnd}"])
                                    .toString(),
                              ),
                              onChanged: (RangeValues changedValues) {
                                controller.setFilterField(
                                    '${value.rangeStart}', changedValues.start,
                                    fromOnChanged: true,
                                    isNastedFilter: value.isNastedFilter);
                                controller.setFilterField(
                                    '${value.rangeEnd}', changedValues.end,
                                    fromOnChanged: true,
                                    isNastedFilter: value.isNastedFilter);
                              },
                            ),
                          ),
                          _dividerWidget
                        ],
                      ),
                    ),
                  );
                }
              }
              break;

            // ///CHECKBOX FILTER WIDGET
            case GtFilterType.CHECKBOX_BUTTON_FILTER:
              if (value.filterItems != null && value.filterItems.length > 0) {
                _widgets.add(
                  Obx(
                    () => Column(
                      children: [
                        ListTile(
                            dense: true,
                            title: GtText(
                              text: '${value.filterLabel}',
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                  color: Get.context.theme.primaryColor),
                            )),
                        if (isBackDrop)
                          ...value.filterItems.entries.map(
                            (e) => CheckboxListTile(
                              dense: true,
                              activeColor: _activeColor,
                              value: (controller
                                      .filtersData['${value.filterValue}'])
                                  .contains('${e.value}'),
                              title: GtText(
                                text: '${e.key}',
                                // texttype:
                                //     filtersData[value.filterValue] == e.value
                                //         ? TextformatType.textwithbold
                                //         : TextformatType.bodyText2,
                                textStyle: TextStyle(
                                    fontWeight:
                                        controller.filtersData['sort'] == "DESC"
                                            ? FontWeight.bold
                                            : FontWeight.w100,
                                    color: Get.context.theme.primaryColor),
                              ),
                              onChanged: (isChecked) {
                                List<dynamic> _options = controller
                                    .filtersData['${value.filterValue}'];
                                if (isChecked)
                                  _options.add('${e.value}');
                                else
                                  _options.remove('${e.value}');
                                controller.setFilterField(
                                    '${value.filterValue}', _options,
                                    fromOnChanged: true,
                                    isNastedFilter: value.isNastedFilter);
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          )
                        else
                          ...value.filterItems.entries.map(
                            (e) => CheckboxListTile(
                              dense: true,
                              activeColor: _activeColor,
                              value: (controller
                                      .filtersData['${value.filterValue}'])
                                  .contains('${e.value}'),
                              title: GtText(
                                text: '${e.key}',
                                // texttype:
                                //     filtersData[value.filterValue] == e.value
                                //         ? TextformatType.textwithbold
                                //         : TextformatType.bodyText2,
                                textStyle: TextStyle(
                                    fontWeight:
                                        controller.filtersData['sort'] == "DESC"
                                            ? FontWeight.bold
                                            : FontWeight.w100,
                                    color: Get.context.theme.primaryColor),
                              ),
                              onChanged: (isChecked) {
                                List<dynamic> _options = controller
                                    .filtersData['${value.filterValue}'];
                                if (isChecked)
                                  _options.add('${e.value}');
                                else
                                  _options.remove('${e.value}');
                                controller.setFilterField(
                                    '${value.filterValue}', _options,
                                    fromOnChanged: true,
                                    isNastedFilter: value.isNastedFilter);
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                        _dividerWidget,
                      ],
                    ),
                  ),
                );
              }
              break;

            // // LOOKUP FILTER

            case GtFilterType.LOOK_UP_FILTER:
              _widgets.add(
                Container(
                  child: Obx(
                    () => GtTagTextField(
                      textColor: Get.context.theme.primaryColor,
                      fieldLabel: " " + key,
                      isRequired: value.isRequired,
                      //onSavedHander: (savedVal) {},
                      allowMultiselection: value.isMultiselect,
                      looupKeyVisibile: value.looupKeyVisibile,
                      lookupFields: value.lookupFields,
                      selectedTaglist: selectedlookupData[value.nodeKey].value,
                      onSuggestionSelected: (_val, isMutli) {
                        /// SETS THE SELECTED VALUES FOR THE LOOKUP WIDGETS IN SELECTED LOOKUP DATA LIST
                        setselectedLookupDataValues(
                          value.nodeKey,
                          // gtFormField.nodeKey,

                          _val,
                          fromOnChanged: true,
                          ismultiSelect: isMutli,
                          fieldKey: value.fieldKey,
                          valuePath: value.valuePath,
                        );

                        controller.setFilterField(
                          '${value.filterValue}',
                          _val[value.lookUpFilterNode],
                          fromOnChanged: true,
                          resetArguments: true,
                          isNastedFilter: value.isNastedFilter
                        );
                      },
                      suggestionsCallback: (pattern) {
                        return getSuggestions(
                          pattern,
                          value.nodeKey,
                          value.lookupFields,
                        );
                      },
                      textEditingController: value.textEditingController,
                      onDeleted: (val) => {
                        /// DELETES FROM THE FORMFIED TEXT FIELDS AND ADDS BACK TO SUGGESTION LIST
                        onDeleteHandler(
                          value.nodeKey,
                          val,
                          ismultiSelect: false,
                          fieldKey: value.fieldKey,
                          valuePath: value.valuePath,
                          focusNode: new FocusNode(),
                        ),

                        /// SETS THE API FILTER VARIABLES
                        controller.setFilterField(
                          '${value.filterValue}',
                          null,
                          fromOnChanged: true,
                          resetArguments: true,
                          isNastedFilter: value.isNastedFilter
                        ),
                      },
                    ),
                  ),
                ),
              );
              break;

            case GtFilterType.TEXT_FILTER:
              _textWidgets.add(
                Container(
                    width: MediaQuery.of(Get.context).size.width / 3,
                    child: Card(
                      child: GtTextFormField(
                        inputDecoration: InputDecoration(
                            filled: true,
                            fillColor: value.isRequired
                                ? Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.2)
                                : Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0),
                            constraints: BoxConstraints(
                              maxHeight: 35,
                            ),
                            labelText: ' ${value.filterLabel}',
                            labelStyle: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(
                                    backgroundColor:
                                        Theme.of(context).cardColor),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).hintColor),
                                borderRadius: BorderRadius.circular(5))),
                        fieldLabel: '${value.filterLabel}',
                        textEditingController: value.textEditingController,
                        onChangeHandler: (_val) {
                          controller.setFilterField(
                              '${value.filterValue}', _val,
                              fromOnChanged: true,
                              isNastedFilter: value.isNastedFilter);
                        },
                      ),
                    )),
              );
              break;
            default:
              _widgets.add(Container());
              break;
          }
        }
      });
    } catch (e) {
      print(e.toString());
    }

    return Container(
        color: context.theme.backgroundColor,
        padding: EdgeInsets.all(8.0),
        child: IgnorePointer(
            ignoring: isFilterProcessing,
            child: Opacity(
                opacity: isFilterProcessing ? 0.50 : 1.0,
                child: Container(
                  child: ListView(
                    controller: ScrollController(),
                    // shrinkWrap: true,
                    children: [
                      Card(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GtText(
                                  text: filterTitle,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          controller.filterClearButton();
                                          if (onFilterClearHandler != null) {
                                            onFilterClearHandler(
                                                controller.filtersData,
                                                controller
                                                    .selectedfilters.value);
                                          }
                                          if (changeBackDrop != null) {
                                            changeBackDrop(
                                                !isBackDropController);
                                          }
                                          if (isBackDrop) {
                                            Backdrop.of(context).fling();
                                          }
                                        },
                                        child: GtText(
                                          text: clearButtonText,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          if (changeBackDrop != null) {
                                            changeBackDrop(
                                                !isBackDropController);
                                          }
                                          filterHandler(controller.filtersData,
                                              controller.selectedfilters.value);
                                          if (isBackDrop) {
                                            Backdrop.of(context).fling();
                                          }
                                        },
                                        child: GtText(
                                          text: applyButtonText,
                                        )),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                      SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            ..._widgets,
                            if (_textWidgets.length > 0)
                              Wrap(children: [
                                Card(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: GtText(
                                                text: quickFilterTitle,
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1
                                                    .copyWith(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            )),
                                        Card(
                                            child: Wrap(
                                          children: _textWidgets,
                                        ))
                                      ]),
                                )
                              ])
                          ],
                        ),
                      ),
                      if (isAdvanceFilterEnable)
                        Card(
                          child: Obx(() => Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GtText(
                                          text: advanceFilterTitle,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              .copyWith(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      if (!controller.isAllOperatorsEmpty.value)
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    if (controller.addFilter !=
                                                        null) {
                                                      controller.addFilter();
                                                    }
                                                  },
                                                  child: GtText(
                                                    text: addButtonText,
                                                  )),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                  if (controller.isAllOperatorsEmpty.value)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: GtText(
                                                      text: "Note : " +
                                                          advanceFilterBlankMessage,
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyText1),
                                                ),
                                              ])),
                                        ),
                                      ],
                                    ),
                                  Obx(() => Visibility(
                                        visible: controller
                                                .selectedfilters.value.length >
                                            0,
                                        child: Container(
                                            child: Wrap(children: [
                                          ...controller.selectedfilters.value
                                              .map((e) =>
                                                  //GtText(text: 'tegs')
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Chip(
                                                      label: Wrap(
                                                        children: [
                                                          GtText(
                                                              text: e['label']
                                                                  .toString(),
                                                              textStyle: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyText1
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 6.0,
                                                                    right: 6.0),
                                                            child: GtText(
                                                                text: e['selectedOperatorName']
                                                                    .toString()),
                                                          ),
                                                          GtText(
                                                              text: e[
                                                                  'fieldValue'],
                                                              textStyle: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyText1
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                        ],
                                                      ),

                                                      // labelStyle: TextStyle(
                                                      //     color: Colors.black, fontWeight: FontWeight.bold),
                                                      labelPadding:
                                                          EdgeInsets.all(4),
                                                      elevation: 16,
                                                      shadowColor:
                                                          Colors.amberAccent,
                                                      deleteIcon: Icon(
                                                        Icons.cancel,
                                                      ),
                                                      onDeleted: () {
                                                        if (controller
                                                                .removeFilter !=
                                                            null) {
                                                          controller.removeFilter(
                                                              controller
                                                                  .selectedfilters
                                                                  .value
                                                                  .indexOf(e));
                                                        }
                                                      },
                                                      deleteIconColor:
                                                          Colors.redAccent,
                                                      deleteButtonTooltipMessage:
                                                          'Remove filter',
                                                      shape:
                                                          BeveledRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(8),
                                                        ),
                                                      ),
                                                    ),
                                                  ))
                                        ])),
                                      )),
                                  Obx(() => Container(
                                        padding: EdgeInsets.all(8.0),
                                        child: ListView.builder(
                                          controller: ScrollController(),
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                Visibility(
                                                    visible: controller
                                                        .selectedfiltersOperations
                                                        .value[index]['added'],
                                                    child: AddAdvanceFilter(
                                                      addfilters:
                                                          controller.addfilters,
                                                      //hideFilter: hideFilter,
                                                      fields: controller
                                                          .FilterFields.value,
                                                      onDelete: controller
                                                          .removenewFilter,
                                                      onTap: controller
                                                          .setfilterSelectedValues,
                                                      filter: controller
                                                          .selectedfiltersOperations
                                                          .value[index],
                                                      filterindex: index,
                                                      valueTextController:
                                                          controller
                                                                  .selectedfiltersOperations
                                                                  .value[index]
                                                              ['controller'],
                                                      selectedOperators:
                                                          controller
                                                              .selectedOperators
                                                              .value,
                                                    ))
                                              ],
                                            );
                                          },
                                          itemCount: controller
                                              .selectedfiltersOperations
                                              .value
                                              .length,
                                        ),
                                      )),
                                ],
                              )),
                        ),
                    ],
                  ),
                ))));
  }
}
