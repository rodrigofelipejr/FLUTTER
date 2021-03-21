import 'package:flutter/material.dart';

class CardTile extends StatefulWidget {
  final String title;

  const CardTile({Key key, this.title}) : super(key: key);

  @override
  _CardTileState createState() => _CardTileState();
}

class _CardTileState extends State<CardTile> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _selected ? Colors.orange : Colors.white,
      child: ListTile(
        title: Text(widget.title),
        onTap: () {
          setState(() {
            _selected = !_selected;
          });
        },
      ),
    );
  }
}
