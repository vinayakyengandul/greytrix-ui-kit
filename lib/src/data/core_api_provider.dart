import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: one_member_abstracts
abstract class ICoreProvider {
  ICoreProvider({
    this.graphqlQueryRequest,
    this.httpRequestMethod,
  });

  final Function(
    Map<String, dynamic> headers,
    String uri,
  ) httpRequestMethod;
  final Function(
    String entityGQL,
    Map<String, dynamic> variables,
    Map<String, dynamic> headers,
  ) graphqlQueryRequest;

  Future<dynamic> getData(
      {int recordCount,
      int recordPage,
      Map<String, dynamic> variables,
      String entityGQL,
      String entityname,
      Map<String, dynamic> headers});

  Future<dynamic> getDatabyHttp(
      {Map<String, dynamic> headers, @required String uri});
}

class CoreProvider implements ICoreProvider {
  CoreProvider({this.graphqlQueryRequest, this.httpRequestMethod});

  final Function(
    Map<String, dynamic> headers,
    String uri,
  ) httpRequestMethod;
  final Function(
    String entityGQL,
    Map<String, dynamic> variables,
    Map<String, dynamic> headers,
  ) graphqlQueryRequest;
  @override
  // Future<Response<Task>> getTasks(String path) => get(path);
  Future<dynamic> getData(
      {int recordCount,
      int recordPage,
      Map<String, dynamic> variables,
      String entityGQL,
      String entityname,
      Map<String, dynamic> headers}) async {
    try {
      print('variables');
      print(variables);
      List<dynamic> _coreList = List<dynamic>.empty(growable: true);
      // final QueryResult result = await Get.find<CoreService>().graphClientQuery(
      var result = await graphqlQueryRequest(
        //Get.find<CoreService>().graphClientQuery(
        entityGQL,
        headers,
        {
          "limit": recordCount,
          "offset": recordPage,
          if (variables != null) ...variables
        },
      );
      print('APIResponse:');
      //if (result.hasException) {
      if (result.body == null) {
        return Future.error(result.statusText);
      } else {
        return Future.value(result.body);
      }
    } catch (e) {
      print('Error inside CoreProvider fetchData ');
      print(e);
      return Future.error(e);
    }
  }

  @override
  Future<dynamic> getDatabyHttp(
      {Map<String, dynamic> headers, @required String uri}) async {
    try {
      var result = await httpRequestMethod(headers, uri);
      //Get.find<CoreService>().getHttpGet(uri: uri, headers: headers);

      if (result != null) {
        // print('http result');
        // print(result);
        return result;
      }
    } catch (e) {
      print('Error inside CoreProvider fetchData ');
      print(e);
      return Future.error(e);
    }
  }
}
