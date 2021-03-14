import 'package:appJsonSerializable/github_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GithubRepository repository = GithubRepository();

  @override
  void initState() {
    super.initState();
    repository.getGithub("rodrigofelipejr");
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
