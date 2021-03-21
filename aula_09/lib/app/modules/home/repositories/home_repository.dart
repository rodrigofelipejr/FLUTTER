import 'package:aula_09/app/modules/home/models/post_model.dart';

abstract class HomeRepository {
  Future<List<PostModel>> getPosts();
}
