import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../greytrix_ui_kit.dart';

class FilterController extends GetxController {
  FilterController({
    @required this.keyLabel,
    @required this.operatorString,
    @required this.operatorNumeric,
    @required this.operatorCommon,
    @required this.advanceFilterFields,
    @required this.toMapQuickfilterjson,
    this.filterData,
  });

  final String keyLabel;
  final List<GtAdvanceFilterOperator> operatorString;
  final List<GtAdvanceFilterOperator> operatorNumeric;
  final List<GtAdvanceFilterOperator> operatorCommon;
  final List<GtAdvanceFilterField> advanceFilterFields;
  final Map<String, GtTileField> toMapQuickfilterjson;
  final Map<String, dynamic> filterData;

  GlobalKey key;

  /// FILTERS DATA SAVED ALL FILTERS IN THIS VARIABLE
  RxMap<String, dynamic> filtersData = RxMap<String, dynamic>();

  /// REDIO FILTER TYPE FIELDS VALUE
  RxMap<String, dynamic> checkRedioFilter = RxMap<String, dynamic>();

  /// QUICK FILTERS TOMAPJSON
  Rx<Map<String, GtTileField>> toMapfilterjson =
      Rx<Map<String, GtTileField>>({});

  /// SELECTED OPERATORS VARIABLES
  Rx<List<GtAdvanceFilterOperator>> selectedOperators =
      new Rx<List<GtAdvanceFilterOperator>>([]);
  Map<String, dynamic> sortFieldFilter = new Map<String, dynamic>();

  /// SELECTED ADVANCE FILTES FIELD WITH VALUES
  Rx<List<Map<String, dynamic>>> selectedfilters =
      Rx<List<Map<String, dynamic>>>([]);
  Rx<List<Map<String, dynamic>>> selectedfiltersOperations =
      Rx<List<Map<String, dynamic>>>([]);
  List<dynamic> headerList = new List<dynamic>.empty(growable: true);
  RxMap<String, dynamic> defaultfilterData = RxMap<String, dynamic>();
  RxString helperText = 'Descending'.obs;
  Rx<IconData> iconName = Rx<IconData>(Icons.south);
  String sortPattern = 'desc';
  RxBool isAllOperatorsEmpty = new RxBool(false);
  Rx<List<GtAdvanceFilterField>> FilterFields =
      new Rx<List<GtAdvanceFilterField>>([]);
  void onInit() {
    key = LabeledGlobalKey(keyLabel);
    toMapfilterjson.value = toMapQuickfilterjson;
    if (this.advanceFilterFields != null && this.advanceFilterFields.length > 0) {
      FilterFields.value = advanceFilterFields.where(
        (e) {
          switch (e.type) {
            case GtAdvanceFilterFieldOperatorType.STRING:
              return operatorString.isEmpty && operatorCommon.isEmpty
                  ? false
                  : true;
              break;
            case GtAdvanceFilterFieldOperatorType.NUMERIC:
              return operatorNumeric.isEmpty && operatorCommon.isEmpty
                  ? false
                  : true;
              break;
            case GtAdvanceFilterFieldOperatorType.SELECT:
              return operatorCommon.isEmpty ? false : true;
              break;
            default:
              return false;
          }
        },
      ).toList();
    }
    if (filterData != null && !filterData.isEmpty) {
      filtersData.value = filterData;
      toMapfilterjson.update((val) {
        val.forEach((key, value) {
          Map<String, dynamic> textControl = filtersData.value[value.valuePath];
          if (filtersData.value[value.valuePath] != null) {
            value.textEditingController = TextEditingController(
                text: textControl["_ilike"].toString().replaceAll("%", ""));
          }
        });
      });
    } else {
      filtersData.value = {};
    }
    if (this.FilterFields.value != null && this.FilterFields.value.length > 0) {
      /// MERGEING FILTER OPERATORS BASED ON ADVNACE FILTER FIELDS
      selectedOperators.update((val) {
        val.addAll(operatorCommon);
        val.addAll(FilterFields.value.first.type ==
                GtAdvanceFilterFieldOperatorType.STRING
            ? operatorString
            : FilterFields.value.first.type ==
                    GtAdvanceFilterFieldOperatorType.NUMERIC
                ? operatorNumeric
                : []);
      });

      /// DEFAULT ONE ADVANCE FILTER IS OPEN
      selectedfiltersOperations.value = [
        {
          'fieldName': FilterFields.value.first.value,
          'fieldValue': FilterFields.value.first.options != null
              ? FilterFields.value.first.options[0].values.elementAt(0)
              : '',
          'operator':
              selectedOperators.value.map((e) => {e.label: e.value}).toList(),
          'selectedOperator': selectedOperators.value.isEmpty
              ? []
              : selectedOperators.value.first.value,
          'index': 0,
          'added': true,
          'controller': new TextEditingController(text: '')
        }
      ];
    } else {
      isAllOperatorsEmpty.value = true;
    }
    defaultfilterData.value = {};
    super.onInit();
  }

  /// ON CHANGE FILTER SET FIELD VALUES
  void setFilterField(String key, dynamic value,
      {bool fromOnChanged = false,
      bool resetArguments = false,
      GtFilterType filterType}) {
    if (filtersData["$key"] == null) {
      if (filterType == GtFilterType.SORT_FILTER) {
        filtersData["$key"] = value;
        if (filtersData["sort"] == null) {
          filtersData["sort"] = "ASC";
        }
      } else {
        filtersData["$key"] = {"_ilike": '%$value%'};
        // filtersDataCheckBox["$key"] = value;

        if (!defaultfilterData.containsKey('$key')) {
          defaultfilterData["$key"] = {"_ilike": '%$value%'};
        }
      }
    } else if (fromOnChanged == true) {
      if (filterType == GtFilterType.SORT_FILTER) {
        filtersData["$key"] = value;
        if (filtersData["sort"] == null) {
          filtersData["sort"] = "ASC";
        }
      } else {
        filtersData["$key"] = {"_ilike": '%${value ?? ""}%'};
      }
    }

    switch (filterType) {
      case GtFilterType.RADIO_BUTTON_FILTER:
        checkRedioFilter["$key"] = value;
        break;
      default:
        break;
    }
  }

  /// CLEAR ALL FILTER FUNCTION
  void filterClearButton() {
    toMapfilterjson.value.forEach((key, value) {
      if (value.type == GtFieldType.FILTER) {
        switch (value.filterType) {
          case GtFilterType.TEXT_FILTER:
            value.textEditingController = new TextEditingController();
            break;
          case GtFilterType.RADIO_BUTTON_FILTER:
            checkRedioFilter["${value.filterLabel}"] = null;
            break;
          default:
            break;
        }
      }
    });
    selectedfilters.value = [];
    filtersData.value = {};
    sortFieldFilter = {};
  }

  /// ADD ADVANCE FILTER BUTTON FUNCTION
  void addFilter() {
    try {
      selectedOperators.value = [];
      selectedOperators.update((val) {
        val.addAll(operatorCommon);
        val.addAll(FilterFields.value[0].type ==
                GtAdvanceFilterFieldOperatorType.STRING
            ? operatorString
            : FilterFields.value[0].type ==
                    GtAdvanceFilterFieldOperatorType.NUMERIC
                ? operatorNumeric
                : []);
      });
      selectedfiltersOperations.update((val) {
        val.add({
          'fieldName': FilterFields.value.first.value,
          'fieldValue': FilterFields.value.first.options != null
              ? FilterFields.value.first.options[0].values.elementAt(0)
              : '',
          'operator':
              selectedOperators.value.map((e) => {e.label: e.value}).toList(),
          'selectedOperator': selectedOperators.value.first.value,
          'index': 0,
          'added': true,
          'controller': new TextEditingController(text: '')
        });
      });
    } catch (e) {
      print('Error in addFilter');
      print(e);
    }
  }

  /// AFTER SELECTED FILED AND OPERATOR WITH VALUE ADD FUNCTION
  void addfilters(int index) {
    try {
      if (index != -1) {
        selectedfilters.update((val) {
          //val[index] = filterValues;
          var textvalue =
              (selectedfiltersOperations.value[index]['controller']).text;
          var filtervalue = {
            'fieldName': selectedfiltersOperations.value[index]['fieldName'],
            'fieldValue': selectedfiltersOperations.value[index]
                        ['fieldValue'] !=
                    ''
                ? selectedfiltersOperations.value[index]['selectedOperator']
                        .toString()
                        .toLowerCase()
                        .contains('like')
                    ? '%${selectedfiltersOperations.value[index]['fieldValue']}%'
                    : selectedfiltersOperations.value[index]['fieldValue']
                : selectedfiltersOperations.value[index]['selectedOperator']
                        .toString()
                        .toLowerCase()
                        .contains('like')
                    ? '%${(selectedfiltersOperations.value[index]['controller']).text}%'
                    : (selectedfiltersOperations.value[index]['controller'])
                        .text,
            'operator': selectedfiltersOperations.value[index]
                ['selectedOperator'],
            'index': index
          };
          val.add(filtervalue);
        });
      }

      selectedfiltersOperations.update((value) {
        value.removeAt(index);
      });
    } catch (e) {
      print('Error in setfilterSelectedValues');
      print(e);
    }
  }

  /// REMOVE SELECTED FILTER IN ADVANCE FILTER
  void removeFilter(int index) {
    try {
      selectedfilters.update((val) {
        val.removeAt(index);
      });
    } catch (e) {
      print('Error in removeFilter');
      print(e);
    }
  }

  /// SET SELECTED FILTER ON CHANGE
  void setfilterSelectedValues(dynamic filterValues, int index, bool isField) {
    try {
      bool checkValue = false;
      FilterFields.value.forEach((e) {
        if (filterValues["fieldName"] == e.value) {
          selectedOperators.value = [];
          selectedOperators.update((val) {
            val.addAll(operatorCommon);
            val.addAll(e.type == GtAdvanceFilterFieldOperatorType.STRING
                ? operatorString
                : e.type == GtAdvanceFilterFieldOperatorType.NUMERIC
                    ? operatorNumeric
                    : []);
          });
        }
        filterValues["operator"] =
            selectedOperators.value.map((e) => {e.label: e.value}).toList();
        if (isField == true) {
          filterValues["selectedOperator"] = selectedOperators.value[0].value;
        }
      });

      if (filterValues != null) {
        selectedfiltersOperations.update((val) {
          val[index] = filterValues;
          //val.add(filterValues);
        });
      }

      if (index != -1) {}
    } catch (e) {
      print('Error in setfilterSelectedValues');
      print(e);
    }
  }

  /// AFTER ADD FILTER CLOSE BUTTON OPTION FOR THIS REMOVE FUNCTION
  void removenewFilter(int index) {
    try {
      selectedfiltersOperations.update((val) {
        val.removeAt(index);
      });
    } catch (e) {
      print('Error in removenewFilter');
      print(e);
    }
  }
}
