import 'package:aula_07/shared/widgets/card_tile_two.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:flutter_mobx/flutter_mobx.dart';

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
  mobx.ObservableList<Data> list = <Data>[].asObservable();
  mobx.Action addItem;
  mobx.Action selectedItem;

  @override
  void initState() {
    addItem = mobx.Action(_addItem);
    super.initState();
  }

  void _addItem() {
    list.add(Data("Item ${list.length}"));
  }

  void _selectedItem({int index}) {
    list[index].selected = !list[index].selected;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          if (list.isEmpty) return Container();

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return CardTileTwo(
                data: list[index],
                onTap: () => null,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addItem,
      ),
    );
  }
}
