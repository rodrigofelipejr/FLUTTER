import 'package:aula_05/shared/widgets/card_tile.dart';
import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  List<String> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) => CardTile(
          title: list[index],
        ),
        itemCount: list.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          list.add("Item ${list.length}");
          setState(() {});
        },
      ),
    );
  }
}
