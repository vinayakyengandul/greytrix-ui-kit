import 'core_api_provider.dart';
import '../domain/adapters/index.dart';

class CoreRepository implements ICoreRepository {
  CoreRepository({this.provider});
  final ICoreProvider provider;

  @override
  Future<dynamic> getData(
      {int pageSize,
      int pageNumber,
      Map<String, dynamic> variables,
      String entityGQL,
      String entityname,
      Map<String, dynamic> headers}) async {
    final data = await provider.getData(
        recordCount: pageSize,
        recordPage: pageNumber,
        variables: variables,
        entityGQL: entityGQL,
        entityname: entityname,
        headers: headers);

    return data;
  }

  @override
  Future<dynamic> getDatabyHttp(
      {String uri, Map<String, dynamic> headers}) async {
    final data = await provider.getDatabyHttp(uri: uri, headers: headers);
    return data;
  }
}
