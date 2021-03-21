import 'package:aula_09/modules/home/models/post_model.dart';

abstract class HomeRepository {
  Future<List<PostModel>> getPosts();
}
