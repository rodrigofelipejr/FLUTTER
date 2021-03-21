import 'package:aula_09/app/modules/home/models/post_model.dart';
import 'package:aula_09/app/modules/home/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<List<PostModel>> getPosts() async {
    await Future.delayed(Duration(seconds: 3));
    return List.generate(10, (index) => PostModel("Title $index", "Description $index"));
  }
}
