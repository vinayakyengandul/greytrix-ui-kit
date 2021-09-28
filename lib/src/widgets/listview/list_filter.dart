import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

class GtListFilter extends StatelessWidget {
  GtListFilter({
    this.tag,
    this.filterHandler,
    this.isFilterProcessing,
    this.rangeFilterDivisions = 10,
    this.rangeFilterLimits,
    this.toMapjson,
    this.listItems,
    this.filtersData,
    this.setFilterField,
    this.onFilterClearHandler,
    this.selectedlookupData,
    this.lookupData,
    this.onDeleteHandler,
    this.getSuggestions,
    this.setselectedLookupDataValues,
  }) : assert(listItems != null);

  @override
  Map<String, Rx<List<dynamic>>> selectedlookupData =
      Map<String, Rx<List<dynamic>>>();
  RxMap<String, dynamic> filtersData = RxMap<String, dynamic>();
  final String tag;

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

  final Function() onFilterClearHandler;
  final Function(
    String key,
    dynamic value, {
    bool ismultiSelect,
    String fieldKey,
    String valuePath,
    FocusNode focusNode,
  }) onDeleteHandler;
  final Function({
    Map<String, dynamic> filterData,
    bool fromFilter,
  }) filterHandler;
  final Function(String key, dynamic value,
      {bool fromOnChanged, bool resetArguments}) setFilterField;

  // String key, dynamic value,
  //   {bool fromOnChanged = false, bool resetArguments = false}
  final Map<String, RangeValues> rangeFilterLimits;
  final int rangeFilterDivisions;
  final Map<String, dynamic> toMapjson;
  final bool isFilterProcessing;
  final List<dynamic> listItems;

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgets = List<Widget>.empty(growable: true);
    Widget _dividerWidget = Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
    );
    Color _activeColor = Get.context.theme.buttonTheme.colorScheme.primary;

    if (listItems != null) {
      try {
        toMapjson.forEach((key, value) {
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
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                      color: Get.context.theme.primaryColor),
                                ),
                              )),
                          ...value.filterItems.entries.map(
                            (e) => Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      activeColor: _activeColor,
                                      value: filtersData[value.filterValue] ==
                                          e.value,
                                      onChanged: (val) {
                                        // val?'${val}':'${val}'
                                        setFilterField(
                                            '${value.filterValue}', e.value,
                                            fromOnChanged: true);
                                      },
                                    ),
                                    GtText(
                                      text: '${e.key}',
                                      // texttype: filtersData[value.filterValue] ==
                                      //         e.value
                                      //     ? TextformatType.textwithbold
                                      //     : TextformatType.bodyText2,
                                      textStyle: TextStyle(
                                          fontWeight:
                                              filtersData[value.filterValue] ==
                                                      e.value
                                                  ? FontWeight.bold
                                                  : FontWeight.w100,
                                          color:
                                              Get.context.theme.primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
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
                                    value: filtersData[value.filterValue] ==
                                        e.value,
                                    onChanged: (val) {
                                      setFilterField(
                                          '${value.filterValue}', e.value,
                                          fromOnChanged: true);
                                    },
                                  ),
                                  GtText(
                                    text: '${e.key}',
                                    // texttype:
                                    //     filtersData[value.filterValue] == e.value
                                    //         ? TextformatType.textwithbold
                                    //         : TextformatType.bodyText2,
                                    textStyle: TextStyle(
                                        fontWeight:
                                            filtersData[value.filterValue] ==
                                                    e.value
                                                ? FontWeight.bold
                                                : FontWeight.w100,
                                        color: Get.context.theme.primaryColor),
                                  ),
                                ]),
                              ),
                            ),
                          ),
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
                                          value: filtersData['sort'] == "ASC",
                                          onChanged: (val) {
                                            setFilterField('sort', 'ASC',
                                                fromOnChanged: true);
                                          },
                                        ),
                                        GtText(
                                          text: 'ASC',
                                          // texttype: filtersData['sort'] == "ASC"
                                          //     ? TextformatType.textwithbold
                                          //     : TextformatType.bodyText2,
                                          textStyle: TextStyle(
                                              fontWeight:
                                                  filtersData['sort'] == "ASC"
                                                      ? FontWeight.bold
                                                      : FontWeight.w100,
                                              color: Get
                                                  .context.theme.primaryColor),
                                        ),
                                        Checkbox(
                                          activeColor: _activeColor,
                                          value: filtersData['sort'] == "DESC",
                                          onChanged: (val) {
                                            setFilterField('sort', 'DESC',
                                                fromOnChanged: true);
                                          },
                                        ),
                                        GtText(
                                          text: 'DESC',
                                          // texttype: filtersData['sort'] == "DESC"
                                          //     ? TextformatType.textwithbold
                                          //     : TextformatType.bodyText2,
                                          textStyle: TextStyle(
                                              fontWeight:
                                                  filtersData['sort'] == "DESC"
                                                      ? FontWeight.bold
                                                      : FontWeight.w100,
                                              color: Get
                                                  .context.theme.primaryColor),
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
                                  double.parse(
                                      filtersData['${value.rangeStart}']
                                          .toString()),
                                  double.parse(filtersData['${value.rangeEnd}']
                                      .toString()),
                                ),
                                min: (_rangeLimits.value).start,
                                max: (_rangeLimits.value).end,
                                divisions: rangeFilterDivisions,
                                labels: RangeLabels(
                                  (filtersData["${value.rangeStart}"])
                                      .toString(),
                                  (filtersData["${value.rangeEnd}"]).toString(),
                                ),
                                onChanged: (RangeValues changedValues) {
                                  setFilterField('${value.rangeStart}',
                                      changedValues.start,
                                      fromOnChanged: true);
                                  setFilterField(
                                      '${value.rangeEnd}', changedValues.end,
                                      fromOnChanged: true);
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
                          ...value.filterItems.entries.map(
                            (e) => CheckboxListTile(
                              dense: true,
                              activeColor: _activeColor,
                              value: (filtersData['${value.filterValue}'])
                                  .contains('${e.value}'),
                              title: GtText(
                                text: '${e.key}',
                                // texttype:
                                //     filtersData[value.filterValue] == e.value
                                //         ? TextformatType.textwithbold
                                //         : TextformatType.bodyText2,
                                textStyle: TextStyle(
                                    fontWeight: filtersData['sort'] == "DESC"
                                        ? FontWeight.bold
                                        : FontWeight.w100,
                                    color: Get.context.theme.primaryColor),
                              ),
                              onChanged: (isChecked) {
                                List<dynamic> _options =
                                    filtersData['${value.filterValue}'];
                                if (isChecked)
                                  _options.add('${e.value}');
                                else
                                  _options.remove('${e.value}');
                                setFilterField('${value.filterValue}', _options,
                                    fromOnChanged: true);
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
                        selectedTaglist:
                            selectedlookupData[value.nodeKey].value,
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

                          setFilterField(
                            '${value.filterValue}',
                            _val[value.lookUpFilterNode],
                            fromOnChanged: true,
                            resetArguments: true,
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
                        taglist: lookupData[value.nodeKey],
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
                          setFilterField(
                            '${value.filterValue}',
                            null,
                            fromOnChanged: true,
                            resetArguments: true,
                          ),
                        },
                      ),
                    ),
                  ),
                );
                break;
              default:
                break;
            }
          }
        });
      } catch (e) {
        print(e.toString());
      }
    }

    return Container(
        color: context.theme.highlightColor,
        padding: EdgeInsets.all(8.0),
        child: IgnorePointer(
            ignoring: isFilterProcessing,
            child: Opacity(
                opacity: isFilterProcessing ? 0.50 : 1.0,
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                          child: ListView(
                        children: [
                          ..._widgets,
                        ],
                      )),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.all(5.0),
                              child: FloatingActionButton.extended(
                                backgroundColor: Get.context.theme.buttonTheme
                                    .colorScheme.onPrimary,
                                onPressed: () {
                                  if (filterHandler != null)
                                    filterHandler(
                                      filterData: filtersData,
                                      fromFilter: true,
                                    );
                                  // Add your onPressed code here!
                                },
                                label: GtText(
                                    text: "Apply",
                                    textStyle: TextStyle(
                                        color: Get.context.theme.buttonTheme
                                            .colorScheme.primary,
                                        fontWeight: FontWeight.bold)),
                              )),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                              backgroundColor: Get.context.theme.buttonTheme
                                  .colorScheme.onPrimary,
                              onPressed: () {
                                onFilterClearHandler();
                              },
                              label: GtText(
                                  text: "Clear",
                                  textStyle: TextStyle(
                                      color: Get.context.theme.buttonTheme
                                          .colorScheme.primary,
                                      fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ))));
  }
}
