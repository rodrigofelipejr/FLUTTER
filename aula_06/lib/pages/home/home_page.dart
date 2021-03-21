import 'package:aula_06/pages/page1/page_one.dart';
import 'package:aula_06/pages/page2/page_two.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> list = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("SetState"),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text("Page 1"),
              ),
              Tab(
                child: Text("Page 2"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PageOne(),
            PageTwo(),
          ],
        ),
      ),
    );
  }
}
