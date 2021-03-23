import 'package:aula_11/app/modules/home/models/post_model.dart';
import 'package:flutter/material.dart';

class PostCardWidget extends StatelessWidget {
  final PostModel snapshot;

  const PostCardWidget({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text(snapshot.title),
      subtitle: Text(snapshot.subtitle),
    );
  }
}
