import 'package:aula_10/modules/home/home_controller.dart';
import 'package:aula_10/modules/home/models/post_model.dart';
import 'package:aula_10/modules/home/repositories/home_repository_impl.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(HomeRepositoryImpl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: controller.postsValue,
        builder: (context, posts, widget) {
          if (posts.isNotEmpty) {
            return ListView(
              children: posts
                  .map(
                    (e) => ListTile(
                      title: Text(e.title),
                      subtitle: Text(e.description),
                    ),
                  )
                  .toList(),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
