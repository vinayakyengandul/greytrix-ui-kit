import 'package:get/get.dart';
import '../controllers/core_controller.dart';
import '../domain/adapters/index.dart';
import '../../greytrix_ui_kit.dart';
import '../data/index.dart';

class CoreBinding extends Bindings {
  CoreBinding({
    this.entityGQL,
    this.nodeName,
    this.isList = false,
    this.headers,
    this.setHeaders,
    this.enableDefaultHeader = false,
    this.tag,
    this.filterRangePath,
    this.lookupGQL,
    this.addLookupDataGQL,
    this.controllerType = ControllerType.LIST,
    this.addFormGQL,
    this.toMapfilterjson,
    this.valuePath,
    this.inputType = GtListInputType.GRAPHQL,
    this.inputData,
    this.postfixUrl,
    this.enableUrlParameters = false,
    this.graphqlQueryMutation,
    this.graphqlQueryRequest,
    this.httpRequestMethod,
  })  : assert((controllerType == ControllerType.LIST &&
                entityGQL != null &&
                nodeName != null) ||
            controllerType != ControllerType.LIST),
        assert((controllerType == ControllerType.FORM && addFormGQL != null) ||
            controllerType != ControllerType.FORM),
        assert(tag != null);
  // ,
  // assert(nodeName != null);
  // ADDED TO ACCEPT LISTVIEW DATA FETCHING APPROACH

  /// ADDED TO ACCEPT PARAMETERS FOR LISTVIEW USING HTTP TYPE
  final String postfixUrl;
  final bool enableUrlParameters;
  final GtListInputType inputType;
  final List<Map<String, dynamic>> inputData;
  final Map<String, GtTileField> toMapfilterjson;
  final String entityGQL;
  final String nodeName;
  final bool isList;
  Map<String, dynamic> headers;
  final String tag;
  final Function setHeaders;
  final bool enableDefaultHeader;
  final Function(
    Map<String, dynamic> headers,
    String uri,
  ) httpRequestMethod;
  final Function(
    String entityGQL,
    Map<String, dynamic> variables,
    Map<String, dynamic> headers,
  ) graphqlQueryRequest;
  final Function(
    Map<String, dynamic> variables,
    String query,
  ) graphqlQueryMutation;

  /// IF PROVIDED DATA IS STATIC THEN PASS START AND END RAGE VALUES AS SHOWN BELOW
  ///  "price": {
  //   "RangeStartValue": 0,
  //   "RangeEndValue": 100,
  // },
  Map<String, Map<String, dynamic>> filterRangePath;
  final Map<String, String> lookupGQL;
  final Map<String, String> addLookupDataGQL;
  final ControllerType controllerType;
  final String addFormGQL;
  final String valuePath;

  @override
  void dependencies() {
    print('tag inside core binding');
    Get.lazyPut<ICoreProvider>(() => CoreProvider());
    Get.lazyPut<ICoreRepository>(() => CoreRepository(provider: Get.find()));
    Get.lazyPut<CoreController>(() {
      return CoreController(
        entityGQL: entityGQL,
        entityname: nodeName,
        isList: isList,
        setHeaders: setHeaders,
        enableDefaultHeader: enableDefaultHeader,
        filterRangePath: filterRangePath,
        lookupGQL: lookupGQL,
        addLookupDataGQL: addLookupDataGQL,
        controllerType: controllerType,
        addFormGQL: addFormGQL,
        toMapfilterjson: toMapfilterjson,
        valuePath: valuePath,
        inputData: inputData,
        inputType: inputType,
        postfixUrl: postfixUrl,
        enableUrlParameters: enableUrlParameters,
      );
    }, tag: tag);
  }
}
