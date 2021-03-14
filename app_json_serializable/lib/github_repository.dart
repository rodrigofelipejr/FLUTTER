import 'package:appJsonSerializable/github_model.dart';
import 'package:dio/dio.dart';

class GithubRepository {
  final dio = Dio();

  Future<List<Github>> getGithub(String searchText) async {
    List<Github> list = [];

    try {
      final response = await dio.get('https://api.github.com/search/users?q=$searchText');

      if (response.statusCode == 200) {
        return (response.data['items'] as List).map((e) => Github.fromJson(e)).toList();
      }
      return list;
    } catch (e) {
      throw Exception("Erro ao realizar pesquisa no github");
    }
  }
}
