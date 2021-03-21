import 'package:aula_06/shared/widgets/card_tile_two.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

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
  var listObservable = BehaviorSubject<List<Data>>.seeded([]);

  @override
  void dispose() {
    listObservable.close();
    super.dispose();
  }

  void addItem() {
    var list = listObservable.value;
    list!.add(Data("Item ${list.length}"));
    listObservable.sink.add(list);
  }

  void selectedItem(int index) {
    var list = listObservable.value;
    list![index].selected = !list[index].selected;
    listObservable.sink.add(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Data>>(
        stream: listObservable,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return CardTileTwo(
                  data: snapshot.data![index],
                  onTap: () => selectedItem(index),
                );
              },
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addItem,
      ),
    );
  }
}
