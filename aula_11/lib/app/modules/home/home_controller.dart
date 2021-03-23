import 'package:aula_11/app/modules/home/models/post_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  final ValueNotifier<List<PostModel>> posts = ValueNotifier<List<PostModel>>([]);

  Future<void> getPosts() async {
    await Future.delayed(Duration(seconds: 2));
    posts.value = [
      PostModel(title: "Title 1", subtitle: "Subtitle 1"),
      PostModel(title: "Title 2", subtitle: "Subtitle "),
      PostModel(title: "Title 3", subtitle: "Subtitle 3"),
    ];
  }

  void dispose() {
    posts.dispose();
  }
}
