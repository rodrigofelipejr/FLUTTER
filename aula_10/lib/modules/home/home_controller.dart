import 'package:aula_10/modules/home/models/post_model.dart';
import 'package:aula_10/modules/home/repositories/home_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  late final HomeRepository repository;
  final ValueNotifier<List<PostModel>> postsValue = ValueNotifier([]);

  HomeController(this.repository) {
    getPosts();
  }

  List<PostModel> get posts => postsValue.value;
  set posts(value) => postsValue.value = value;

  void getPosts() async {
    posts = await repository.getPosts();
  }
}
