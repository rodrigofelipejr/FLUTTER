import 'package:aula23/app/shared/utils/colors.dart';
import 'package:flutter/material.dart';

enum TextButtonExpandedType { fill, none, outline }

class TextButtonExpandedWidget extends StatelessWidget {
  final String label;
  final TextButtonExpandedType type;
  final VoidCallback? onTap;

  TextButtonExpandedWidget({
    Key? key,
    required this.label,
    this.onTap,
    this.type = TextButtonExpandedType.fill,
  }) : super(key: key);

  static const Map<TextButtonExpandedType, Map<String, dynamic>> _config = {
    TextButtonExpandedType.fill: {
      "backgroundColor": kGreen,
      "backgroundColorDisable": kGrey500,
      "textStyle": TextStyle(
        fontSize: 14.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      "border": null,
      "height": 58.0,
    },
    TextButtonExpandedType.none: {
      "backgroundColor": Colors.transparent,
      "textStyle": TextStyle(
        fontSize: 14.0,
        color: kGrey500,
        fontWeight: FontWeight.bold,
      ),
      "border": null,
      "height": 22.0,
    },
    TextButtonExpandedType.outline: {
      "backgroundColor": Colors.transparent,
      "textStyle": TextStyle(
        fontSize: 14.0,
        color: kBlack,
        fontWeight: FontWeight.bold,
      ),
      "border": const Border.fromBorderSide(
        BorderSide(
          color: kGrey400,
        ),
      ),
      "height": 58.0,
    }
  };

  Color get backgroundColor =>
      onTap == null ? _config[type]!['backgroundColorDisable'] : _config[type]!['backgroundColor'];
  TextStyle get textStyle => _config[type]!['textStyle'];
  Border? get border => _config[type]!['border'];
  double get height => _config[type]!['height'];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.0),
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
