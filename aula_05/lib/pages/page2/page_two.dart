import 'package:aula_05/shared/widgets/card_tile_two.dart';
import 'package:flutter/material.dart';

class Data {
  final String title;
  bool selected;

  Data(this.title, {this.selected = false});
}

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  List<Data> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) => CardTileTwo(
          data: list[index],
          onTap: () {
            setState(() {
              list[index].selected = !list[index].selected;
            });
          },
        ),
        itemCount: list.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            list.add(Data("Item ${list.length}"));
          });
        },
      ),
    );
  }
}
