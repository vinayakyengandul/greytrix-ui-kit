abstract class ICoreRepository {
  Future<dynamic> getData(
      {int pageSize,
      int pageNumber,
      Map<String, dynamic> variables,
      String entityGQL,
      String entityname,
      Map<String, dynamic> headers});
  Future<dynamic> getDatabyHttp({String uri, Map<String, dynamic> headers});
}
