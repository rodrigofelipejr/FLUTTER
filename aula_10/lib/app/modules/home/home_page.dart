import 'package:aula_10/app/modules/home/home_controller.dart';
import 'package:aula_10/app/modules/home/models/post_model.dart';
import 'package:aula_10/app/modules/home/widgets/post_card/post_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: controller.posts,
        builder: (context, posts, child) {
          if (posts.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else if (posts.isNotEmpty) {
            return ListView.builder(
                itemCount: posts.length, itemBuilder: (context, index) => PostCardWidget(snapshot: posts[index]));
          } else {
            return Center(child: Text("Lista vazia"));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.getPosts,
        child: Icon(Icons.add),
      ),
    );
  }
}
