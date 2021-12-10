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
    });
  
  final String keyLabel;
  final List<GtAdvanceFilterOperator> operatorString;
  final List<GtAdvanceFilterOperator> operatorNumeric;
  final List<GtAdvanceFilterOperator> operatorCommon;
  final List<GtAdvanceFilterField> advanceFilterFields;
  final Map<String, GtTileField> toMapQuickfilterjson;

  GlobalKey key;
  RxMap<String, dynamic> filtersData = RxMap<String, dynamic>();
  RxMap<String, dynamic> checkRedioFilter = RxMap<String, dynamic>();
  Rx<Map<String, GtTileField>> toMapfilterjson = Rx<Map<String, GtTileField>>({});
  Rx<List<GtAdvanceFilterOperator>> selectedOperators = new Rx<List<GtAdvanceFilterOperator>>([]);
  Map<String, dynamic> sortFieldFilter = new Map<String, dynamic>();
  Rx<List<Map<String, dynamic>>> selectedfilters = Rx<List<Map<String, dynamic>>>([]);
  Rx<List<Map<String, dynamic>>> selectedfiltersOperations = Rx<List<Map<String, dynamic>>>([]);
  List<dynamic> headerList = new List<dynamic>.empty(growable: true);
  RxMap<String, dynamic> defaultfilterData = RxMap<String, dynamic>();
  RxString helperText = 'Descending'.obs;
  Rx<IconData> iconName = Rx<IconData>(Icons.south);
  String sortPattern = 'desc';
  void onInit() {
    key = LabeledGlobalKey(keyLabel);    
    toMapfilterjson.value = toMapQuickfilterjson;
    selectedOperators.update((val){
        val.addAll(operatorCommon);
        val.addAll(
        advanceFilterFields[0].type == GtAdvanceFilterFieldOperatorType.STRING ?
        operatorString : advanceFilterFields[0].type == GtAdvanceFilterFieldOperatorType.NUMERIC ?  operatorNumeric : []);
      });
      selectedfiltersOperations.value = [{
          'fieldName': advanceFilterFields.first.value,
          'fieldValue': advanceFilterFields.first.options != null
              ? advanceFilterFields.first.options[0].values.elementAt(0)
              : '',
          'operator': [{"EQUAL": "_eq"},{"NEQ": "_neq"},{"LIKE": "_like"},{"ILIKE": "_ilike"},],
          'selectedOperator' : selectedOperators.value.first.value,
          'index': 0,
          'added': true,
          'controller': new TextEditingController(text: '')
        }];
    defaultfilterData.value = {};
    filtersData.value = {};
    super.onInit();
  }
  void setFilterField(String key, dynamic value,
      {bool fromOnChanged = false, bool resetArguments = false, GtFilterType filterType}) {
    if (filtersData["$key"] == null) {
      if(filterType == GtFilterType.SORT_FILTER){
        filtersData["$key"] = value;
        if(filtersData["sort"] == null) {
          filtersData["sort"] = "ASC";
        }
      }
      else{
        filtersData["$key"] = {"_ilike": '%$value%'};
        // filtersDataCheckBox["$key"] = value;

        if (!defaultfilterData.containsKey('$key')) {
          defaultfilterData["$key"] = {"_ilike": '%$value%'};
        }
      }
    } else if (fromOnChanged == true){
      if(filterType == GtFilterType.SORT_FILTER){
        filtersData["$key"] = value;
        if(filtersData["sort"] == null) {
          filtersData["sort"] = "ASC";
        }
      }else{
        filtersData["$key"] = {"_ilike": '%${value ?? ""}%'};
      }
    }

      switch (filterType) {
        case GtFilterType.RADIO_BUTTON_FILTER:
          checkRedioFilter["$key"] = value;
         break;
      } 
  }

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
          }
      }
    });
    selectedfilters.value = [];
    filtersData.value = {};
    sortFieldFilter = {};
  }

  void addFilter() {
    try {
      selectedOperators.value = [];
      selectedOperators.update((val){
        val.addAll(operatorCommon);
        val.addAll(
        advanceFilterFields[0].type == GtAdvanceFilterFieldOperatorType.STRING ?
        operatorString : advanceFilterFields[0].type == GtAdvanceFilterFieldOperatorType.NUMERIC ?  operatorNumeric : []);
      });
      selectedfiltersOperations.update((val) {
        val.add({
          'fieldName': advanceFilterFields.first.value,
          'fieldValue': advanceFilterFields.first.options != null
              ? advanceFilterFields.first.options[0].values.elementAt(0)
              : '',
          'operator': selectedOperators.value.map((e) => 
              {e.label : e.value}
            ).toList(),
          'selectedOperator' : selectedOperators.value.first.value,
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
                ? selectedfiltersOperations.value[index]['selectedOperator'].toString().toLowerCase().contains('like') ?
                      '%${selectedfiltersOperations.value[index]['fieldValue']}%'
                      : selectedfiltersOperations.value[index]['fieldValue']
                :  selectedfiltersOperations.value[index]['selectedOperator'].toString().toLowerCase().contains('like') ?
                      '%${(selectedfiltersOperations.value[index]['controller']).text}%'
                      : (selectedfiltersOperations.value[index]['controller']).text,
            'operator': selectedfiltersOperations.value[index]['selectedOperator'],
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
  void setfilterSelectedValues(dynamic filterValues, int index) {
    try {
      
      advanceFilterFields.forEach((e) {
        if(filterValues["fieldName"] == e.value)
        {
          selectedOperators.value = [];
          selectedOperators.update((val){
              val.addAll(operatorCommon);
              val.addAll(
              e.type == GtAdvanceFilterFieldOperatorType.STRING ?
              operatorString : e.type == GtAdvanceFilterFieldOperatorType.NUMERIC ?  operatorNumeric : []);

            });
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