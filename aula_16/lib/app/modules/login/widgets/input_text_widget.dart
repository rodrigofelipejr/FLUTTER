import 'package:aula16/app/shared/utils/colors.dart';
import 'package:flutter/material.dart';

enum InputTextType { email, password, text }

class InputTextWidget extends StatelessWidget {
  final String label;
  final InputTextType type;

  const InputTextWidget({
    Key? key,
    required this.label,
    this.type = InputTextType.text,
  }) : super(key: key);

  static const Map<InputTextType, Map<String, dynamic>> _config = {
    InputTextType.email: {
      "suffixIcon": Icon(
        Icons.check_circle_outline_outlined,
        color: kGreen,
      ),
      "textStyle": TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: kGrey2,
      ),
      "obscureText": false,
      "contentPadding": const EdgeInsets.only(top: 28.0, left: 12.0, right: 12.0, bottom: 12.0),
      "keyboardType": TextInputType.emailAddress,
    },
    InputTextType.password: {
      "suffixIcon": Icon(
        Icons.visibility,
        color: kGrey3,
      ),
      "textStyle": TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w500,
        color: kGrey2,
      ),
      "obscureText": true,
      "contentPadding": const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
      "keyboardType": TextInputType.text,
    },
    InputTextType.text: {
      "suffixIcon": Icon(
        Icons.check_circle_outline_outlined,
        color: kGreen,
      ),
      "textStyle": TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: kGrey2,
      ),
      "obscureText": false,
      "contentPadding": const EdgeInsets.only(top: 28.0, left: 12.0, right: 12.0, bottom: 12.0),
      "keyboardType": TextInputType.text,
    }
  };

  InputBorder get inputBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: kGrey1, width: 2.0),
      );
  TextStyle get textStyle => _config[type]!['textStyle'];
  Widget get suffixIcon => _config[type]!['suffixIcon'];
  bool get obscureText => _config[type]!['obscureText'];
  EdgeInsetsGeometry get contentPadding => _config[type]!['contentPadding'];
  TextInputType get keyboardType => _config[type]!['keyboardType'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12.0,
            ),
          ),
        ),
        Container(
          height: 48.0,
          child: TextField(
            obscureText: obscureText,
            keyboardType: keyboardType,
            style: textStyle,
            decoration: InputDecoration(
              contentPadding: contentPadding,
              suffixIcon: suffixIcon,
              enabledBorder: inputBorder,
              disabledBorder: inputBorder,
              errorBorder: inputBorder,
              focusedBorder: inputBorder,
              focusedErrorBorder: inputBorder,
              border: inputBorder,
            ),
          ),
        ),
      ],
    );
  }
}
