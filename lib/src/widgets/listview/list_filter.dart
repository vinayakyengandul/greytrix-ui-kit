import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:backdrop/backdrop.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
import 'package:greytrix_ui_kit/src/models/advance_filter_class.dart';
import 'advance_add_filter.dart';

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
    this.isBackDrop = false,
    this.controller,
    this.checkRedioFilter,
    this.changeBackDrop,
    this.isBackDropController = false,
    this.onAdd,
    this.selectedFields,
    this.advanceFilterFields,
    this.onTap,
    this.onDelete,
    this.quickFilterFields,
    this.selectedfiltersOperations,
    this.addfilters,
    this.onFilterDelete,
    this.selectedOperators,
    this.isAdvanceFilterEnable = false,
    this.advanceFilterTitle = "Advanced Filter",
    this.addButtonText = "Add",
    this.quickFilterTitle = "Quick Filter",
    this.filterTitle = "Filter",
    this.applyButtonText = "Apply",
    this.clearButtonText = "Clear All",
  }) : assert(listItems != null), assert((isAdvanceFilterEnable == true && advanceFilterFields != null && advanceFilterFields != []) || (isAdvanceFilterEnable == false));

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
      {bool fromOnChanged, bool resetArguments, GtFilterType filterType}) setFilterField;

  // String key, dynamic value,
  //   {bool fromOnChanged = false, bool resetArguments = false}
  final Map<String, RangeValues> rangeFilterLimits;
  final int rangeFilterDivisions;
  final Map<String, dynamic> toMapjson;
  final bool isFilterProcessing;
  final List<dynamic> listItems;
  final bool isBackDrop;
  final ScrollController controller;
  final Map<String, dynamic> checkRedioFilter;
  final Function(bool) changeBackDrop;
  final bool isBackDropController;
  final Function onAdd;
  final List<Map<String, dynamic>> selectedFields;
  final List<GtAdvanceFilterField> advanceFilterFields;
  final List<dynamic> quickFilterFields;
  final List<Map<String, dynamic>> selectedfiltersOperations;
  final Function(dynamic value, int index) onTap;
  final Function(int index) addfilters;
  final Function(int index) onDelete;
  final Function(int index) onFilterDelete;
  final List<GtAdvanceFilterOperator> selectedOperators;
  final bool isAdvanceFilterEnable;
  final String advanceFilterTitle;
  final String addButtonText;
  final String quickFilterTitle;
  final String filterTitle;
  final String clearButtonText;
  final String applyButtonText;

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgets = List<Widget>.empty(growable: true);

    List<Widget> _textWidgets = List<Widget>.empty(growable: true);

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
                                  textStyle: Theme.of(context).textTheme.subtitle1
                                        .copyWith(fontSize: 18,fontWeight: FontWeight.w500),
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
                                          value: checkRedioFilter[
                                                  value.filterValue] ==
                                              e.value,
                                          onChanged: (val) {
                                            // val?'${val}':'${val}'
                                            setFilterField(
                                                '${value.filterValue}',
                                                e.value,
                                                fromOnChanged: true,
                                                filterType: value.filterType);
                                          },
                                        )),
                                        GtText(
                                          text: '${e.key}',
                                          // texttype: filtersData[value.filterValue] ==
                                          //         e.value
                                          //     ? TextformatType.textwithbold
                                          //     : TextformatType.bodyText2,
                                          textStyle: TextStyle(
                                              fontWeight: filtersData[value
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
                                    value: checkRedioFilter[value.filterValue] == e.value,
                                    onChanged: (val) {
                                      // val?'${val}':'${val}'
                                      setFilterField(
                                          '${value.filterValue}',
                                          e.value,
                                          fromOnChanged: true,
                                          filterType: value.filterType);
                                    },
                                  ),
                                  GtText(
                                    text: '${e.key}',
                                    // texttype: filtersData[value.filterValue] ==
                                    //         e.value
                                    //     ? TextformatType.textwithbold
                                    //     : TextformatType.bodyText2,
                                    textStyle: TextStyle(
                                        fontWeight: filtersData[value
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
                          if (isBackDrop)
                            Row(
                              children: [
                                ...value.filterItems.entries.map(
                                  (e) => Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Row(children: [
                                        Checkbox(
                                          activeColor: _activeColor,
                                          value:
                                              filtersData[value.filterValue] ==
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
                                              fontWeight: filtersData[
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
                              ],
                            )
                          else
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
                              if (isBackDrop)
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
                                  setFilterField(
                                      '${value.filterValue}', _options,
                                      fromOnChanged: true);
                                },
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              ),
                            )
                          else
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

                case GtFilterType.TEXT_FILTER:
                _textWidgets.add(
                  Container(
                    width: MediaQuery.of(Get.context).size.width / 4,
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
                        setFilterField(
                          '${value.filterValue}',
                          _val,
                          fromOnChanged: true,
                        );
                      },
                    ),
                  )),
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
                                      .subtitle1.copyWith(
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
                                          if(onFilterClearHandler != null){
                                            onFilterClearHandler();
                                          }
                                          if(isBackDrop){
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
                                          if(changeBackDrop != null) {
                                            changeBackDrop(!isBackDropController);
                                          }
                                          filterHandler(
                                            filterData: filtersData,
                                            fromFilter: true,
                                          );
                                          if(isBackDrop){
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
                        controller: controller,
                        child: Column(
                          children: [
                            ..._widgets,
                            if (_textWidgets.length > 0)
                              Wrap(children: [
                                Card(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: GtText(
                                            text: quickFilterTitle,
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .subtitle1.copyWith(
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
                      if(isAdvanceFilterEnable)
                      Expanded(
                        child: Card(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GtText(
                                      text: advanceFilterTitle,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .subtitle1.copyWith(
                                              fontSize: 18, fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                            onPressed: () {
                                              if(onAdd != null) {
                                                onAdd();
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
                              Visibility(
                                visible: selectedFields.length > 0,
                                child: Container(
                                    child: Wrap(children: [
                                  ...selectedFields.map((e) =>
                                      //GtText(text: 'tegs')
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Chip(
                                          label: Wrap(
                                            children: [
                                              GtText(
                                                  text: e['fieldName']
                                                      .toString(),
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1.copyWith(
                                                          fontWeight: FontWeight.bold)),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 6.0, right: 6.0),
                                                child: GtText(
                                                    text: e['operator']
                                                        .toString()),
                                              ),
                                              GtText(
                                                  text: e['fieldValue'],
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1.copyWith(
                                                          fontWeight: FontWeight.bold)),
                                            ],
                                          ),

                                          // labelStyle: TextStyle(
                                          //     color: Colors.black, fontWeight: FontWeight.bold),
                                          labelPadding: EdgeInsets.all(4),
                                          elevation: 16,
                                          shadowColor: Colors.amberAccent,
                                          deleteIcon: Icon(
                                            Icons.cancel,
                                          ),
                                          onDeleted: () {
                                            if(onDelete != null) {
                                            onDelete(selectedFields.indexOf(e));
                                            }
                                          },
                                          deleteIconColor: Colors.redAccent,
                                          deleteButtonTooltipMessage: 'Remove filter',
                                          shape: BeveledRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ))
                                ])),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  child:
                                      ListView.builder(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Visibility(
                                              visible: selectedfiltersOperations[index]
                                                  ['added'],
                                              child: AddAdvanceFilter(
                                                addfilters: addfilters,
                                                //hideFilter: hideFilter,
                                                fields: advanceFilterFields,
                                                onDelete: onFilterDelete,
                                                onTap: onTap,
                                                filter: selectedfiltersOperations[index],
                                                filterindex: index,
                                                valueTextController:
                                                    selectedfiltersOperations[index]
                                                        ['controller'],
                                                    selectedOperators: selectedOperators,
                                              ))
                                        ],
                                      );
                                    },
                                    itemCount: selectedfiltersOperations.length,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
