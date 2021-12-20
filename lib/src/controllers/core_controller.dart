import 'dart:convert';
import '../../src/domain/adapters/core_repository_adapter.dart';
import '../models/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/core_repository.dart';

class CoreController extends SuperController {
  CoreController({
    this.isList = false,
    this.entityGQL,
    this.entityname,
    this.setHeaders,
    this.enableDefaultHeader = false,
    this.filterRangePath,
    this.lookupGQL,
    this.addLookupDataGQL,
    this.controllerType = ControllerType.LIST,
    this.addFormGQL,
    this.toMapfilterjson,
    this.valuePath,
    this.inputType,
    this.inputData,
    this.postfixUrl,
    this.headers,
    this.enableUrlParameters,
    this.graphqlQueryMutation,
  });

  /// ADDED TO ACCEPT PARAMETERS FOR LISTVIEW USING HTTP TYPE
  final String postfixUrl;
  Map<String, dynamic> headers;
  final bool enableUrlParameters;
  // ADDED TO ACCEPT LISTVIEW DATA FETCHING APPROACH
  final GtListInputType inputType;
  final List<Map<String, dynamic>> inputData;

  final Map<String, GtTileField> toMapfilterjson;

  /// Default Properties
  final ControllerType controllerType;

//// PROPERTIES FOR FORM FIEDS - s
  ///MAIN FORM KEY FOR HANDLING THE VALIDATION AND FORM ON_SAVED EVENTS
  final formKey = GlobalKey<FormState>();

  ///MAIN MUTATION QUERY FOR THE SUBMIT EVENT
  final String addFormGQL;

  ///HOLDS THE LOOKUP SUGGESTIONS DATA FETCH QUERIES
  final Map<String, String> lookupGQL;

  ///HOLDS LOOKUP ADD DATA GRAPHQL QUERIES
  final Map<String, String> addLookupDataGQL;

  ///USED TO STORE THE INITIAL DEFAULT VALUES OF ALL THE FILTER FIELDS TYPES
  RxMap<String, dynamic> defaultfilterData = RxMap<String, dynamic>();

  ///USED TO STORE THE INITIAL DEFAULT VALUES OF ALL THE FORM_FIELDS FIELDS TYPES
  // RxMap<String, dynamic> defaultFormFieldsData = RxMap<String, dynamic>();
  Map<String, dynamic> defaultFormFieldsData = Map<String, dynamic>();

  ///USED FOR SENDING STORING THE FORM_FIELDS DATA AND FORWARD IT TO THE API INPUTS ON SUBMIT EVENT
  Map<String, dynamic> apiInputs = Map<String, dynamic>();

  /// SAME AS API_INPUTS VAIABLE JUST HANDLE API INPUTS FOR THE LOOKUP ADD POPUP FORM DIALOG
  Map<String, dynamic> addLookupApiInputs = Map<String, dynamic>();

  RxMap<String, dynamic> fieldValues = RxMap<String, dynamic>();

  ///USED TO STORE THE LOOKUPS DATA TO SHOW THE SUGGESTIONS
  RxMap<String, dynamic> lookupData = RxMap<String, dynamic>();

  ///USED TO STORE THE LOOKUPS DATA TO SHOW THE SUGGESTIONS  FOR THE LOOKUP ADD POPUP FORM DIALOG
  RxMap<String, dynamic> addLooupFieldValues = RxMap<String, dynamic>();

  ///USED TO HOLD THE SELECTED LOOKUP DATA VALES FOR THR NORMAL FORM
  Map<String, Rx<List<dynamic>>> selectedlookupData =
      Map<String, Rx<List<dynamic>>>();

  ///USED TO HOLD THE FORM KEYS FOR THE LOOKUPS
  Map<String, GlobalKey<FormState>> addLookupFormKeys =
      Map<String, GlobalKey<FormState>>();

  //// PROPERTIES FOR FORM FIEDS - e

  ///FIELD TO RESPONSE NODE PATH
  final String valuePath;

  /// inject repo abstraction dependency
  ICoreRepository coreRepository;
  final Function setHeaders;
  final String entityGQL;
  final bool isList;
  final String entityname;
  final bool enableDefaultHeader;
  dynamic apiResponse;
  List<dynamic> tasks = List<dynamic>.empty(growable: true);
  Rx<List<dynamic>> dataList = Rxn<List<dynamic>>();
  final Map<String, Map<String, dynamic>> filterRangePath;

  ///HOLDS THE FILTER LOOKUP DATA
  Map<String, Rx<List<dynamic>>> lookUpFilterData =
      Map<String, Rx<List<dynamic>>>();

  ///HOLDS THE FILTER LOOKUP SELECTED OBJECTS
  Rx<Map<String, dynamic>> selectedLookUpFilterData =
      Rxn<Map<String, dynamic>>();
  Map<String, dynamic> arguments;
  int currentPage = 1;
  int pageSize = 10;
  bool isdataRemaining = true;
  bool isprocessingRequest = false;
  /// HOLDS THE STATUS OF BOTTOMSHEET
  var activeBottomSheet = "";
  var errormessage = "".obs;
  // ignore: top_level_instance_getter
  // var org = Get.find<ShellController>().currentOrgContext.value;
  // ignore: top_level_instance_getter
  // var app = Get.find<ShellController>().currentAppContext.value;

  // FOR GRAPHQL MUTATION
  final Function(
    Map<String, dynamic> variables,
    String query,
  ) graphqlQueryMutation;

  @override
  void set value(model) {
    super.value = model;
  }

  @override
  void onInit() {
    super.onInit();
    print('core controller oninit');
    coreRepository = CoreRepository(provider: Get.find());
    selectedLookUpFilterData.value = {};
    arguments = Get.arguments as Map<String, dynamic>;
    switch (controllerType) {
      case ControllerType.LIST:

        ///IF CONTROLLER USED FOR TYPE LIST VIEW THEN IT WILL FETCH THE LIST DATA
        fetchdata(
          isinitialloading: true,
          fromOnInit: true,
        );
        break;
      case ControllerType.FORM:
        break;
      default:
        break;
    }

    ///FETCHING LOOKUP DATA SEPERATELY FOR BOTH LIST AND FORM VIEW
    fetchAlllookUp();
  }

  @override
  void onReady() {
    print('The build method is done. '
        'Your controller is ready to call dialogs and snackbars');
    super.onReady();
  }

  @override
  void onClose() {
    print('onClose called');
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    print('the window size did change');
  }

  @override
  void onDetached() {
    print('onDetached called');
  }

  @override
  void onInactive() {
    print('onInative called');
  }

  @override
  void onPaused() {
    print('onPaused called');
  }

  @override
  void onResumed() {
    print('onResumed called');
  }

  //-- Filter open close variable
  var isListView = true.obs;
  //var isFilterOpen = false.obs;
  var isFilterOpen = true.obs;
  RxMap<String, dynamic> filtersData = RxMap<String, dynamic>();
  
  errorMessageUpdate(String message) {
    errormessage.value = message;
  }
    /// METHOD FOR BOTTOM SHEET HANDLER
  void changeBottomSheetName(String value) {
    activeBottomSheet = value;
    if (value == "") Navigator.pop(Get.context);
  }
  void filteropenclose() {
    isFilterOpen.value = !isFilterOpen.value;
  }

  ///TOGGLES BETWEEN THE LIST AND GRID VIEW
  void toggleListGridView() {
    isListView.value = !isListView.value;
  }

  ///SETS UP THE FILTER_DATA
  void setFilterField(String key, dynamic value,
      {bool fromOnChanged = false, bool resetArguments = false}) {
    if (filtersData["$key"] == null) {
      filtersData["$key"] = value;

      if (!defaultfilterData.containsKey('$key'))
        defaultfilterData["$key"] = value;
    } else if (fromOnChanged == true) filtersData["$key"] = value;
    if (resetArguments == true && arguments != null) {
      arguments.remove(key);
    }
  }

  ///IT SETS THE SELECTED LOOKUPS FILTER DATA
  /// THIS FUNCTION CHECKS THE VALUES SET FROM ARGUMENTS
  /// AND SET THE FILTER DATA WHICH PASSED FROM RELATED SCREEN(ex. SALESPERSON -> CUSTOMER)
  void setSelectedLookUpFilterData(
    String key, {
    bool fromOnChanged = false,
    String filterValue,
    String filterNodeValue,
    String lookUpFilterNode,
    TextEditingController texteditingcontroller,
  }) {
    // if (selectedLookUpFilterData.value["$key"] == null) {
    //   //Map<String, dynamic> arguments = Get.arguments as Map<String, dynamic>;
    //   if (arguments != null && filterValue != null) {
    //     bool _isValueSet = false;
    //     arguments.forEach((_key, _val) {
    //       if (_key == filterValue) {
    //         dynamic _obj;
    //         _obj = apiResponse[filterNodeValue].singleWhere(
    //             (_elm) => _elm[lookUpFilterNode].toString() == _val.toString(),
    //             orElse: () => null);
    //         if (_obj != null) {
    //           selectedLookUpFilterData.value["$key"] = _obj;
    //           _isValueSet = true;
    //         }
    //       }
    //     });
    //     if (_isValueSet == false)
    //       selectedLookUpFilterData.value["$key"] = value;
    //   } else {
    //     selectedLookUpFilterData.value["$key"] = value;
    //   }
    // } else if (fromOnChanged == true) {
    //   selectedLookUpFilterData.value["$key"] = value;
    // }

    if (selectedlookupData["$key"] != null &&
        selectedlookupData["$key"].value.length == 0) {
      if (arguments != null && filterValue != null) {
        bool _isValueSet = false;
        arguments.forEach((_key, _val) {
          if (_key == filterValue) {
            dynamic _obj;
            // _obj = apiResponse[filterNodeValue].singleWhere(
            //     (_elm) => _elm[lookUpFilterNode].toString() == _val.toString(),
            //     orElse: () => null);
            _obj = lookupData[filterNodeValue].singleWhere(
                (_elm) => _elm[lookUpFilterNode].toString() == _val.toString(),
                orElse: () => null);
            if (_obj != null) {
              if (texteditingcontroller != null)
                texteditingcontroller.text = ' ';
              selectedlookupData["$key"].value = [_obj];
              _isValueSet = true;
            }
          }
        });
        //  if (_isValueSet == false)
        // selectedLookUpFilterData.value["$key"] = value;
      }
      // else {
      //   selectedLookUpFilterData.value["$key"] = value;
      // }
    }
    // else if (fromOnChanged == true) {
    //   selectedLookUpFilterData.value["$key"] = value;
    // }
  }

  ///SETS UP THE FILTERS LOOKUPS DATA
  void setLookupFilterData(
    String key,
    String filterNodeValue, {
    bool fromOnChanged = false,
    String searchText,
    String lookUpDisplayNode,
  }) {
    try {
      if (lookUpFilterData["$key"] == null) {
        ///SETTING FIRST TIME LIST VALUES
        Rx<List<dynamic>> _tempList = new Rxn<List<dynamic>>();
        _tempList.value = [];
        _tempList.value = apiResponse[filterNodeValue];
        lookUpFilterData["$key"] = _tempList;
      } else if (fromOnChanged == true) {
        List<dynamic> _tempList = new List<dynamic>();
        _tempList = [];
        _tempList = (searchText == null || searchText == "")
            ? apiResponse[filterNodeValue]
            : apiResponse[filterNodeValue].where((v) {
                return searchText != null
                    ? v[lookUpDisplayNode]
                        .toString()
                        .toLowerCase()
                        .contains(searchText)
                    : false;
              }).toList();
        lookUpFilterData["$key"].value = _tempList;
      }
    } catch (e) {
      print(e);
    }
  }

  void lookupfieldClearButton(dynamic value) {
    //  filtersData.remove(value.filterValue);
    //  if (arguments != null) arguments.remove(value.filterValue);
    //  selectedLookUpFilterData.value = {};
    //

    filtersData.remove(value);
    if (arguments != null) arguments.remove(value);
    selectedLookUpFilterData.value = {};

    fetchdata(filterData: filtersData, fromFilter: true);
  }

  void filterClearButton(data,advanceData) {
    selectedLookUpFilterData.value = {};
    // filtersData = defaultfilterData;

    defaultfilterData.forEach((key, value) {
      filtersData[key] = value;
    });

    selectedlookupData.forEach((key, value) {
      value.value = [];
    });
    fetchdata(filterData: data, fromFilter: true);
  }

  dynamic getDefaultheaders() {
    return {
      "appCode": Get.arguments["appCode"].toString(),
      "orgid": Get.arguments["orgid"].toString(),
    };
  }

  // void fetchdata({
  //   bool fromOnInit = false,
  //   bool isinitialloading = false,
  //   Map<String, dynamic> filterData,
  //   bool fromFilter = false,
  //   bool filterFirstValue = false,
  // }) async {
  //   Map<String, dynamic> _variables = {};
  //
  //   ///IF CALLED FROM FILTER RESETING PAGINATION VARIABLES
  //   if (fromFilter) {
  //     isdataRemaining = true;
  //     isinitialloading = true;
  //     currentPage = 1;
  //   }
  //
  //   if (filterData != null && filterData.isNotEmpty) {
  //     _variables = filterData;
  //   }
  //   //if (Get.parameters["customerid"] != null)
  //   if (Get.parameters["id"] != null)
  //     _variables["customerRid"] = '#${Get.parameters["id"]}';
  //
  //   if (arguments != null) {
  //     arguments.forEach((key, value) {
  //       _variables[key] = value;
  //     });
  //   }
  //   List<dynamic> _list = List<dynamic>();
  //
  //   // print('_variables');
  //   // print(_variables);
  //
  //   if (isdataRemaining && isprocessingRequest == false) {
  //     isprocessingRequest = true;
  //     coreRepository
  //         .getData(
  //           pageSize: pageSize,
  //           pageNumber: currentPage,
  //           entityGQL: entityGQL,
  //           entityname: entityname,
  //           headers: enableDefaultHeader ? getDefaultheaders() : null,
  //           variables: _variables,
  //         )
  //         .then((apiresp) => {
  //               print(entityname),
  //               print(apiresp),
  //               apiResponse = apiresp,
  //               if (valuePath != null)
  //                 {
  //                   print('valuePath'),
  //                   print(valuePath),
  //                   isdataRemaining = false,
  //                   _list = Common.getValue(apiresp, valuePath),
  //                   //_list = apiresp["customers"][0][entityname],
  //                 }
  //               else
  //                 {
  //                   if (apiresp[entityname].length < pageSize)
  //                     isdataRemaining = false,
  //                   _list = apiresp[entityname],
  //                 },
  //
  //               if (_list.length > 0)
  //                 {
  //                   _list.forEach((element) {
  //                     element['IsSelected'] = false;
  //                     element['IsHovered'] = false;
  //                   }),
  //                 },
  //
  //               if (isinitialloading)
  //                 {
  //                   dataList.value = _list,
  //                 }
  //               else
  //                 {
  //                   dataList.update((val) {
  //                     val.addAll(_list);
  //                   }),
  //                 },
  //
  //               //if (dataList.value.isNotEmpty)
  //               tasks = dataList.value,
  //
  //               isprocessingRequest = false,
  //               currentPage++,
  //
  //               if (fromOnInit) {setinitialFilterData()},
  //
  //               ///CHANGING THE CONTROLLER STATUS AND SETTING THE TASKS LIST DATA
  //
  //               change(tasks, status: RxStatus.success()),
  //             })
  //         .catchError((e) => {
  //               print('core controller error response '),
  //               print(e),
  //
  //               isprocessingRequest = false,
  //               isdataRemaining = true,
  //
  //               ///CHANGING THE CONTROLLER STATUS TO ERROR BY PASSING ERROR TEXT
  //               change(null, status: RxStatus.error(e.toString())),
  //             });
  //   }
  // }
  void fetchDataCoreList(Map<String, dynamic> data, List<Map<String, dynamic>> advanceFilterData){
    fetchdata(
      filterData: data,
      fromFilter: true
    );
  }

  /// LISTVIEW TO HANDLE STATIC DATA FOR LISTVIEW

  void fetchdata({
    bool fromOnInit = false,
    bool isinitialloading = false,
    Map<String, dynamic> filterData,
    bool fromFilter = false,
    bool filterFirstValue = false,
  }) async {
    Map<String, dynamic> _variables = {};

    switch (inputType) {
      case GtListInputType.STATIC:
        var _list;
        var sortfield;
        var sortOrder;
        if (fromOnInit) {
          setinitialFilterData();
        }

        /// ADDED THE SELECTION CRITERIA FOR THE STATIC LIST PROVIDED BY THE USER
        inputData.forEach((element) {
          element['IsSelected'] = false;
          element['IsHovered'] = false;
        });

        /// TO FILTER THE DATA FROM EXISTING PROVIDED LIST FROM BINDING WITH FILTER DATA PROVIDED
        if (filterData != null && filterData.isNotEmpty) {
          _variables = filterData;
          _list = inputData;
          toMapfilterjson.forEach((key, gttilefield) {
            /// APPLY THE FILTER BASED ON SEQUENCE OF FILTERS APPLIED BY THE USER
            switch (gttilefield.filterType) {

              ///RADIO_BUTTON_FILTER_WIDGET
              case GtFilterType.RADIO_BUTTON_FILTER:
                print(' Case RADIO_BUTTON_FILTER ');
                if (filterData[gttilefield.filterValue] != null)
                  _list = _list
                      .where((element) =>
                          element[gttilefield.filterValue] ==
                          '${filterData[gttilefield.filterValue]}')
                      .toList();
                break;
              // ///SORT FILTER WIDGET
              case GtFilterType.SORT_FILTER:
                sortfield = filterData[gttilefield.filterValue];
                sortOrder = filterData['sort'];
                // if (value == 'DESC') {
                //   _list = _list.sort((b, a) => a.compareTo(b));
                // } else {
                //   _list = _list.sort((a, b) => a.compareTo(b));
                // }
                break;
              // ///RANGE FILTER WIDGET
              case GtFilterType.RANGE_FILTER:
                _list = _list
                    .where((element) =>
                        element['${gttilefield.filterValue}'] >=
                            filterData[gttilefield.rangeStart] &&
                        element['${gttilefield.filterValue}'] <=
                            filterData[gttilefield.rangeEnd])
                    .toList();
                break;

              ///CHECKBOX FILTER WIDGET
              case GtFilterType.CHECKBOX_BUTTON_FILTER:
                break;
              // LOOKUP FILTER
              case GtFilterType.LOOK_UP_FILTER:
                break;
              default:
                break;
            }
          });

          /// SORTING THE LIST BASED SORTFIELD AND SORT ORDER AFTER APPLYING ALL ABOVE FILTERS SUPPORT
          // if (sortOrder == 'DESC') {
          //   _list = _list
          //       .sort((b, a) => a[sortfield].compareTo(b[sortfield]))
          //       .toList();
          // } else {
          //   print('in else');
          //   print('sortOrder');
          //   print(sortOrder);
          //   print('sortfield');
          //   print(sortfield);
          //   _list = _list
          //       .sort((a, b) => a['$sortfield']
          //       .toString()
          //       .compareTo(b['$sortfield'].toString()))
          //       .toList();
          //   print('aftr sort list');
          //   print(_list);
          // }
          tasks = _list;
        } else {
          /// WHEN THE LIST IS INITIALLY LOADED
          _list = inputData;
          tasks = _list;
        }
        change(tasks, status: RxStatus.success());

        break;

      case GtListInputType.GRAPHQL:

        ///IF CALLED FROM FILTER RESETING PAGINATION VARIABLES
        if (fromFilter) {
          isdataRemaining = true;
          isinitialloading = true;
          currentPage = 1;
        }

        if (filterData != null && filterData.isNotEmpty) {
          _variables = filterData;
        }
        //if (Get.parameters["customerid"] != null)
        if (Get.parameters["id"] != null)
          _variables["customerRid"] = '#${Get.parameters["id"]}';

        if (arguments != null) {
          arguments.forEach((key, value) {
            _variables[key] = value;
          });
        }
        List<dynamic> _list = List<dynamic>.empty(growable: true);

        // print('_variables');
        // print(_variables);

        if (isdataRemaining && isprocessingRequest == false) {
          isprocessingRequest = true;
          coreRepository
              .getData(
                pageSize: pageSize,
                pageNumber: currentPage,
                entityGQL: entityGQL,
                entityname: entityname,
                headers: enableDefaultHeader ? getDefaultheaders() : null,
                variables: _variables,
              )
              .then((apiresp) => {
                    apiResponse = apiresp,
                    if (valuePath != null)
                      {
                        isdataRemaining = false,
                        _list = Common.getValue(apiresp, valuePath),
                        //_list = apiresp["customers"][0][entityname],
                      }
                    else
                      {
                        if (apiresp[entityname].length < pageSize)
                          isdataRemaining = false,
                        _list = apiresp[entityname],
                      },

                    if (_list.length > 0)
                      {
                        _list.forEach((element) {
                          element['IsSelected'] = false;
                          element['IsHovered'] = false;
                        }),
                      },

                    if (isinitialloading)
                      {
                        dataList.value = _list,
                      }
                    else
                      {
                        dataList.update((val) {
                          val.addAll(_list);
                        }),
                      },

                    tasks = dataList.value,

                    isprocessingRequest = false,
                    currentPage++,

                    if (fromOnInit) {setinitialFilterData()},

                    ///CHANGING THE CONTROLLER STATUS AND SETTING THE TASKS LIST DATA

                    change(tasks, status: RxStatus.success()),
                  })
              .catchError((e) => {
                    print('core controller error response '),
                    print(e),

                    isprocessingRequest = false,
                    isdataRemaining = true,

                    ///CHANGING THE CONTROLLER STATUS TO ERROR BY PASSING ERROR TEXT
                    change(null, status: RxStatus.error(e.toString())),
                  });
        }
        break;

      case GtListInputType.HTTP:
        String urlParameters;

        ///IF CALLED FROM FILTER RESETING PAGINATION VARIABLES
        if (fromFilter) {
          isdataRemaining = true;
          isinitialloading = true;
          currentPage = 1;
        }
        if (filterData != null && filterData.isNotEmpty) {
          /// IF  FILTERS PARAMETERS ARE NEEDED TO BE APPENDED IN THE URL
          if (enableUrlParameters) {
            filterData.forEach((key, value) {
              urlParameters += key + '=' + value;
            });
          }

          /// ADD THE FILTERS PARAMETERS IN THE HEADER
          else {
            headers.addAll(filterData);
          }
        }
        List<dynamic> _list = List<dynamic>.empty(growable: true);
        //var _list;
        if (isdataRemaining && isprocessingRequest == false) {
          isprocessingRequest = true;
          coreRepository
              .getDatabyHttp(
                uri: enableUrlParameters
                    ? '?' + urlParameters
                    : 'https://fakestoreapi.com/products',
                headers: headers,
              )
              .then((apiresp) => {
                    apiResponse = jsonDecode(apiresp.body),
                    _list = apiResponse.toList(),
                    if (_list.length > 0)
                      {
                        _list.forEach((element) {
                          element['IsSelected'] = false;
                          element['IsHovered'] = false;
                        }),
                      },
                    if (isinitialloading)
                      {
                        dataList.value = _list,
                      }
                    else
                      {
                        dataList.update((val) {
                          val.addAll(_list);
                        }),
                      },
                    tasks = dataList.value,
                    isprocessingRequest = false,
                    currentPage++,
                    if (fromOnInit) {setinitialFilterData()},

                    ///CHANGING THE CONTROLLER STATUS AND SETTING THE TASKS LIST DATA
                    change(tasks, status: RxStatus.success()),
                  })
              .catchError((e) => {
                    print('core controller error response '),
                    print(e),
                    isprocessingRequest = false,
                    isdataRemaining = true,

                    ///CHANGING THE CONTROLLER STATUS TO ERROR BY PASSING ERROR TEXT
                    change(null, status: RxStatus.error(e.toString())),
                  });
        }
        break;

      default:
        break;
    }
  }

  /// FUNCTION TO SET LIST TITLE BASED ON PARAMETERS
  String getTitleText({
    String prefixText = null,
    String postfixtext = null,
    String title,
    String titleTextValuePath,
  }) {
    String titleText = '';

    if (title != null)
      titleText = title;
    else if (titleTextValuePath != null) {
      String data = Common.getValue(apiResponse, titleTextValuePath);
      if (data != null) {
        if (prefixText != null) titleText += '$prefixText ';
        titleText += data;
        if (postfixtext != null) titleText += ' $postfixtext';
      }
    }

    // print('titleText');
    // print(titleText);
    return titleText;
  }

  void setinitialFilterData() {
    if (toMapfilterjson != null) {
      toMapfilterjson.forEach((key, value) {
        switch (value.filterType) {

          ///RADIO_BUTTON_FILTER_WIDGET
          case GtFilterType.RADIO_BUTTON_FILTER:
            if (value.filterItems != null && value.filterItems.length > 0) {
              setFilterField(
                  '${value.filterValue}', value.filterItems.values.first);
            }
            break;

          // ///SORT FILTER WIDGET
          case GtFilterType.SORT_FILTER:
            setFilterField("sort", "ASC");
            if (value.filterItems != null && value.filterItems.length > 0) {
              setFilterField(
                  '${value.filterValue}', value.filterItems.values.first);
            }
            break;

          // ///RANGE FILTER WIDGET
          case GtFilterType.RANGE_FILTER:
            MapEntry _rangeLimits = setRangefilterlimits().entries.singleWhere(
                  (element) => element.key == "${value.filterValue}",
                  orElse: () => null,
                );
            if (_rangeLimits != null) {
              setFilterField('${value.rangeStart}', (_rangeLimits.value).start);
              setFilterField('${value.rangeEnd}', (_rangeLimits.value).end);
            }
            break;

          // ///CHECKBOX FILTER WIDGET
          case GtFilterType.CHECKBOX_BUTTON_FILTER:
            if (value.filterItems != null && value.filterItems.length > 0) {
              setFilterField('${value.filterValue}', []);
            }
            break;

          // // LOOKUP FILTER

          case GtFilterType.LOOK_UP_FILTER:
            List<dynamic> templist = new List<Widget>.empty(growable: true);
            templist = [];
            setLookupDataValues(value.nodeKey, templist);
            //gtFormField.nodeKey, templist);
            Rx<List<dynamic>> _tmp = new Rxn<List<dynamic>>();
            _tmp.value = [];
            setselectedLookupDataValues(value.nodeKey, _tmp);
            setSelectedLookUpFilterData(value.nodeKey,
                filterValue: value.filterValue,
                filterNodeValue: value.filterNodeValue,
                lookUpFilterNode: value.lookUpFilterNode,
                texteditingcontroller: value.textEditingController);

            setFilterField(
              '${value.filterValue}',
              null,
            );

            break;
          default:
            break;
        }
      });
    }
  }

  /// FUNCTION SET RANGES VALUES

  Map<String, RangeValues> setRangefilterlimits() {
    Map<String, RangeValues> filterlimits = {};
    switch (inputType) {
      case GtListInputType.STATIC:
        if (filterRangePath != null) {
          filterRangePath.forEach((k, v) {
            // print('filterRangePath[k]["RangeStartValue"]');
            // print(filterRangePath[k]["RangeStartValue"]);
            // print('filterRangePath[k]["RangeEndValue"]');
            // print(filterRangePath[k]["RangeEndValue"]);
            filterlimits[k] = RangeValues(
                double.parse(filterRangePath[k]["RangeStartPath"].toString()),
                double.parse(filterRangePath[k]["RangeEndPath"].toString()));
          });
        }
        break;
      case GtListInputType.HTTP:

        /// IF THE FILTERS RANGES ARE NOT PROVIDED BY THE API NEED TO HANDLE IT
        ///  ONCE API RESPONSE IS LOADED
        /// TEMPORARY SET THE HARDCODED VALUES FOR STATIC
        if (filterRangePath != null) {
          filterRangePath
              .forEach((k, v) => filterlimits[k] = RangeValues(0, 10));
        }
        break;
      default:
        if (filterRangePath != null) {
          filterRangePath.forEach((k, v) => filterlimits[k] = RangeValues(
              double.parse(Common.getValue(
                      apiResponse, filterRangePath[k]["RangeStartPath"])
                  .toString()),
              double.parse(Common.getValue(
                      apiResponse, filterRangePath[k]["RangeEndPath"])
                  .toString())));
        }
        break;
    }
    return filterlimits;
  }

  /// TO SELECT ALL CHECKBOX OR UNCHECKBOX
  ///
  void checkallitem(bool value) {
    state.forEach((element) {
      element['IsSelected'] = value;
    });

    change(state, status: RxStatus.success());
  }

  bool isSelecteditem() {
    return (state.firstWhere((element) => element['IsSelected'] == false,
                orElse: () => null) !=
            null)
        ? false
        : true;
  }

  void selectionHandler(bool value, dynamic list) {
    state[state.indexOf(list)]['IsSelected'] = value;

    change(state, status: RxStatus.success());
  }

  void onHoverHandler(bool value, dynamic record) {
    state[state.indexOf(record)]['IsHovered'] = value;

    change(state, status: RxStatus.success());
  }

  dynamic getFilterData(String filterNodeValue) {
    if (filterNodeValue != null) {
      Rx<List<dynamic>> _tempList = new Rxn<List<dynamic>>();
      _tempList.value = [];
      _tempList.value = apiResponse[filterNodeValue];
      return _tempList;
    }
  }

  void onDetailsNavigateHandler(dynamic item, String path,
      {GtTileField getTileField}) {
    if (getTileField == null) {
      if (path != null && path != "")
        Get.toNamed(
            "${Get.currentRoute}${path}${item["rid"].substring(1, item["rid"].length)}/");
    } else {
      String _path = getTileField.pathNavigation;
      if (getTileField.navigationNode != null) {
        _path = _path.replaceAll(getTileField.navigationNode,
            '${item["rid"].substring(1, item["rid"].length)}');
      }
      Get.toNamed("${Get.currentRoute}${_path}");
    }
  }

  /// METHODS TO SUPPORT FORM FIELDS

  ///-----------------------FORM EVENT HANDLER FUNCTIONS START----------------------------
  ///HANDLES THE FORM ONSAVE EVENT FOR ALL THE FIELDS
  ///STORES THE RESPECTIVE INFORMATION FOR FORWARDING TO API
  void onSaveHandler(
    GtFormField formField,
    dynamic value, {
    bool forsingle = false,
    bool forLookupForm = false,
  }) {
    try {
      if (forLookupForm == false) {
        apiInputs[formField.fieldKey] = value;
      } else {
        addLookupApiInputs[formField.fieldKey] = value;
      }
    } catch (e) {}
  }

  ///HANDLES THE FORM WIDGETS ONCHANGE EVENT FOR ALL THE FIELDS
  ///STORES THE RESPECTIVE INFORMATION FOR FORWARDING TO API
  void formFieldOnChangeHandler(
    String fieldKey,
    dynamic value, {
    bool forsingle = false,
    bool forLookupForm = false,
    bool fromOnChanged = false,
  }) {
    try {
      switch (forLookupForm) {
        case false:
          if (fromOnChanged == true || apiInputs[fieldKey] == null)
            apiInputs[fieldKey] = value;
          break;
        case true:
          if (fromOnChanged == true || addLookupApiInputs[fieldKey] == null)
            addLookupApiInputs[fieldKey] = value;
          break;
        default:
          break;
      }
    } catch (e) {}
  }

  ///HANDLES THE FORM SUBMIT EVENT
  ///IT FIRST VALIDATE THEN TRIGGERS THE FORM SAVE EVENT FOR GETTING THE FORM FIELDS
  ///API INPUTS ON THE SAVE EVENT
  void formSubmitHandler() async {
    if (addFormGQL != null && formKey.currentState.validate()) {

      ///FORM.SAVE COMMETED AS IT WAS GIVING ERROR FOR THE POPUP FORM
      formKey.currentState.save();

      /// API for Creation
      //final QueryResult result = await Get.find<ApiService>()
      var result = await graphqlQueryMutation(apiInputs, addFormGQL);
      // Get.find<CoreService>()
      //     .graphClientMutation(query: addFormGQL, variables: apiInputs);
      if (result.hasException) {
        return Future.error(result.exception);
      } else {
        // var labelslist = result.data["labels"] as List;
        // //return Future.value(_returnData);
        // result.data.forEach((k, v) => {setLookupDataValues(k, v)});
        // print('labelslist');
        // print(labelslist);
        formResetHandler();
      }
    } else {
    }
  }

  ///IT RESETS THE FORM COMPLETELY
  void formResetHandler() {
    apiInputs = {};
    addLookupApiInputs = {};
    formKey.currentState.reset();

    /// RESETTING ALL THE FIELD VALUES
    defaultFormFieldsData.forEach((_key, _value) {
      fieldValues.update(_key, (value) => _value);
    });

    /// RESETTING ALL LOOKUP SELECTED VALUES
    selectedlookupData.forEach((key, value) {
      value.value = [];
    });
  }

  ///SETS UP THE DROPDOWN_DATA /RADIO BUTTONS FORM_FIELDS DATA
  ///TO MAINTAIN THEIR SELECTED VALUES DATA
  ///ALSO HANDLES SAME DATA FOR THE LOOKUP POPUP FORMS
  void setFieldValues(
    String key,
    dynamic value, {
    bool fromOnChanged = false,
    bool forLookupForm = false,
  }) {
    switch (forLookupForm) {
      case false:
        if (fieldValues["$key"] == null) {
          fieldValues["$key"] = value;

          ///SETTING THE INITIAL VALUES TO SET DEFAULTS ON FORM RESET
          if (!defaultFormFieldsData.containsKey('$key')) {
            defaultFormFieldsData["$key"] = value;
          }
        } else if (fromOnChanged == true) fieldValues["$key"] = value;

        break;

      case true:
        if (addLooupFieldValues["$key"] == null) {
          addLooupFieldValues["$key"] = value;

          ///SETTING THE INITIAL VALUES TO SET DEFAULTS ON FORM RESET
          if (!defaultFormFieldsData.containsKey('$key')) {
            defaultFormFieldsData["$key"] = value;
          }
        } else if (fromOnChanged == true) addLooupFieldValues["$key"] = value;
        break;

      default:
        break;
    }
  }

  ///HANDLES THE CHECKOBX FORM FIELDS DATA FOR THE NORMAL AND POPUP FORM
  ///SELCTED CHECKBOXES VALUES
  void setFormCheckboxFieldValues(
    String key,
    dynamic value,
    bool isChecked, {
    String fieldKey,
    bool forLookupForm = false,
    bool setApiVariables = false,
  }) {
    switch (forLookupForm) {
      case false:
        if (isChecked)
          fieldValues["$key"].add(value);
        else
          fieldValues["$key"].remove(value);

        ///SETTING API VARIABLES FORM ONCHANGED EVENT HANDLER
        if (setApiVariables && fieldKey != null)
          apiInputs["$fieldKey"] = fieldValues["$key"];
        break;

      case true:
        if (isChecked)
          addLooupFieldValues["$key"].add(value);
        else
          addLooupFieldValues["$key"].remove(value);

        ///SETTING API VARIABLES FORM ONCHANGED EVENT HANDLER
        if (setApiVariables) apiInputs["$key"] = addLooupFieldValues["$key"];
        break;

      default:
        break;
    }
  }

  ///RETURNS THE FORM FIELD DATA VALUES FOR NORMAL AND LOOKUP ADD FORM
  dynamic getFieldValues(
    String key, {
    bool forLookupForm = false,
  }) {
    switch (forLookupForm) {
      case false:
        return fieldValues[key];
        break;

      case true:
        return addLooupFieldValues[key];
        break;

      default:
        return null;
        break;
    }
  }

  ///SETS UP THE DROPDOWN_DATA FOR THE SUGGESTIONS
  void setLookupDataValues(
    String key,
    dynamic value, {
    bool fromOnChanged = false,
  }) {
    if (lookupData["$key"] == null)
      lookupData["$key"] = value;
    else if (fromOnChanged == true) lookupData["$key"] = value;
  }

  ///SETS UP THE DROPDOWN_DATA
  void setselectedLookupDataValues(
    String key,
    dynamic value, {
    String fieldKey,
    String valuePath,
    bool fromOnChanged = false,
    bool ismultiSelect = false,
  }) {
    if (selectedlookupData["$key"] == null) {
      selectedlookupData["$key"] = value;
    } else if (fromOnChanged == true) {
      if (ismultiSelect) {
        ///TO AVOID ALREADY SELECTED LOOKUP RECORD INSEERTED INTO SELETED RECORDS LIST
        if (!selectedlookupData["$key"].value.contains(value)) {
          selectedlookupData["$key"].update((val) {
            val.add(value);
          });

          ///SETTING THE API INPUTS FOR THE SELECTED
          if (fieldKey != null) {
            if (apiInputs[fieldKey] != null)
              apiInputs[fieldKey].add(Common.getValue(value, valuePath));
            else
              apiInputs[fieldKey] = [Common.getValue(value, valuePath)];
          }
        }
      } else {
        selectedlookupData["$key"].value = [];
        selectedlookupData["$key"].value.add(value);
        if (fieldKey != null) {
          apiInputs[fieldKey] = Common.getValue(value, valuePath);
        }
      }
    }
  }

  ///HANDLES THE SELECTED SUGGESTIONS ON DELTE EVENTS
  void onDeleteHandler(
    String key,
    dynamic value, {
    bool ismultiSelect = false,
    String fieldKey,
    String valuePath,
    FocusNode focusNode,
  }) {
    ///IF LOOKUP IS MULTI_SELECT THEN MAINTAINS IT IN THE LIST
    if (ismultiSelect) {
      selectedlookupData["$key"].update((val) {
        val.remove(value);
      });
      if (fieldKey != null && apiInputs[fieldKey] != null)
        apiInputs[fieldKey].remove(Common.getValue(value, valuePath));
    } else {
      ///IF LOOKUP IS SINGLE SELECT THEN REPLACES MAINTAIN STHE SINGLE ELEMENT IN TH LIST
      selectedlookupData["$key"].value = [];
      apiInputs[fieldKey] = null;
    }

    ///REMOVES OR RETURNS THE FOCUS WHEN DELETE OPTION IS CLICKED
    if (focusNode.hasFocus) {
      FocusScope.of(Get.context).requestFocus(new FocusNode());
    }
  }

  ///IT FETCHES ALL THE LOOKUPS DATA BY CALLING THE SINGLE GRAPHQL QUERY
  void fetchAlllookUp() async {
    try {
      if (lookupGQL != null && !lookupGQL.isEmpty) {
        var _query = '  query { ';

        ///CREATING THE SINGLE GQL QUERY WITH ALIAS NAMES
        lookupGQL.forEach((key, value) {
          _query += ''' $key : $value ''';
        });
        _query += ' }';

        coreRepository
            .getData(
              entityGQL: _query,
              headers: enableDefaultHeader ? getDefaultheaders() : null,
            )
            .then((response) => {
                  ///HERE SETTING ALL LOOKUP'S DATA RECEIVED FORM API TO FOR ACCESSIBLE TO FORM FIELDS OR
                  ///FILTER LOOKUPS FIELDS
                  response.forEach((k, v) =>
                      {setLookupDataValues(k, v, fromOnChanged: true)})
                })
            .catchError((e) => {
                  print('core controller error response '),
                  print(e),
                });
      }
    } catch (e) {
      print('fetchAlllookUp Catch Error');
      print(e);
    }
  }

  ///IT RETURNS THE SUGGESTIONS LIST FOR THE SUGGESTIONS FORM FIELDS
  List<dynamic> getSuggestions(
    String query,
    String key,
    Map<String, String> lookupFields,
  ) {
    List<dynamic> values = List();
    values.addAll(lookupData[key]);

    ///FILTERING THE RECORDS
    if (query != null && query.trim().length > 0)
      values.retainWhere((s) {
        bool _isExists = false;

        ///CHECKING IF LOOKUP VALUES PROVIDED CONSISTS THE MATCHING DATA SEARCHED IN QUERY
        lookupFields.forEach((_k, _v) {
          if (_isExists == false &&
              s[_v] != null &&
              s[_v].toString().toLowerCase().contains(query.toLowerCase()))
            _isExists = true;
        });

        return _isExists;
      });
    if (values.isEmpty) {
      values.add(query);
    }
    return values;
  }

  ///SETS THE ADD_LOOKUP FORM KEY FOR THE DIALOG FORM
  void setAddLookupFormKey(String key, GlobalKey<FormState> globalKey) {
    addLookupFormKeys[key] = globalKey;
  }

  void addLookupformSubmitHandler(
    String parentFormFieldKey,
    GlobalKey<FormState> lookupFormKey,
    String lookupAddNodeKey, {
    @required String nodeKey,
    @required bool ismultiSelect,
    @required String fieldKey,
    @required String valuePath,
    @required TextEditingController textEditingController,
  }) async {
    if (lookupFormKey.currentState.validate() &&
        addLookupDataGQL[lookupAddNodeKey] != null) {
      lookupFormKey.currentState.save();

      /// API for Creation
      //  final QueryResult result =
      var result = await graphqlQueryMutation(
          addLookupApiInputs, addLookupDataGQL[lookupAddNodeKey]);
      // Get.find<CoreService>().graphClientMutation(
      //   query: addLookupDataGQL[lookupAddNodeKey],
      //   variables: addLookupApiInputs,
      // );
      if (result.hasException) {
        return Future.error(result.exception);
      } else {
        if (result.data[lookupAddNodeKey] != null) {
          lookupData[nodeKey].add(result.data[lookupAddNodeKey]);
          setselectedLookupDataValues(
            nodeKey,
            result.data[lookupAddNodeKey],
            fromOnChanged: true,
            ismultiSelect: ismultiSelect,
            fieldKey: fieldKey,
            valuePath: valuePath,
          );

          ///CLEARING THE TEXT ENTERED FOR ADDING LOOKUP DATA
          if (textEditingController != null) textEditingController.text = " ";
          addLooupFieldValues = Map<String, dynamic>();
        }
      }
    }
  }

  ///-----------------------FORM EVENT HANDLER FUNCTIONS END----------------------------
}
