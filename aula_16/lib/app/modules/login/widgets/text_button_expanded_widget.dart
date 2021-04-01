import 'package:flutter/material.dart';

enum TextButtonExpandedType { fill, none, outline }

class TextButtonExpandedWidget extends StatelessWidget {
  final String label;
  final TextButtonExpandedType type;
  final VoidCallback onTap;

  TextButtonExpandedWidget({
    Key? key,
    required this.label,
    required this.onTap,
    this.type = TextButtonExpandedType.fill,
  }) : super(key: key);

  static const Map<TextButtonExpandedType, Map<String, dynamic>> _config = {
    TextButtonExpandedType.fill: {
      "backgroundColor": Colors.green,
      "textStyle": TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      "border": null,
    },
    TextButtonExpandedType.none: {
      "backgroundColor": Colors.transparent,
      "textStyle": TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.bold,
      ),
      "border": null,
    },
    TextButtonExpandedType.outline: {
      "backgroundColor": Colors.transparent,
      "textStyle": TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      "border": const Border.fromBorderSide(
        BorderSide(
          color: Colors.black26,
        ),
      ),
    }
  };

  Color get backgroundColor => _config[type]!['backgroundColor'];
  TextStyle get textStyle => _config[type]!['textStyle'];
  Border? get border => _config[type]!['border'];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 52.0,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16.0),
          border: border,
        ),
        child: Center(
          child: Text(
            label,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
