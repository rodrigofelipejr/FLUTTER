import 'package:aula_07/pages/page2/page_two.dart';
import 'package:flutter/material.dart';

class CardTileTwo extends StatefulWidget {
  final Data data;
  final VoidCallback onTap;

  const CardTileTwo({Key key, this.data, this.onTap}) : super(key: key);

  @override
  _CardTileTwoState createState() => _CardTileTwoState();
}

class _CardTileTwoState extends State<CardTileTwo> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.data.selected ? Colors.orange : Colors.white,
      child: ListTile(
        title: Text(widget.data.title),
        onTap: widget.onTap,
      ),
    );
  }
}
