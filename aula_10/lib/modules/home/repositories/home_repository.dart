import 'package:aula_10/modules/home/models/post_model.dart';

abstract class HomeRepository {
  Future<List<PostModel>> getPosts();
}
