import 'package:dio/dio.dart';
import 'package:github_search/modules/search/domain/errors/errors.dart';
import 'package:github_search/modules/search/infra/datasources/search_datasource.dart';
import 'package:github_search/modules/search/infra/models/result_search_model.dart';

class GithubDatasource implements SearchDatasource {
  final Dio dio;

  GithubDatasource(this.dio);

  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) async {
    final response = await dio.get("https://api.github.com/search/users?q=${_normalizeText(searchText)}");
    if (response.statusCode == 200) {
      return (response.data['items'] as List).map((e) {
        return ResultSearchModel.fromMap(e);
      }).toList();
    } else {
      throw DatasourceError();
    }
  }

  String _normalizeText(String searchText) => searchText.replaceAll(" ", "+");
}
