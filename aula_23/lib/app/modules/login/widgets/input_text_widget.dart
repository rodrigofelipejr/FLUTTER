import 'package:aula23/app/shared/utils/colors.dart';
import 'package:flutter/material.dart';

enum InputTextType { email, password, text }

typedef String? InputValidate(String value);

class InputTextWidget extends StatefulWidget {
  final String label;
  final InputTextType type;
  final InputValidate onValidate;
  final void Function(String value)? onChange;

  const InputTextWidget({
    Key? key,
    required this.label,
    required this.onValidate,
    this.onChange,
    this.type = InputTextType.text,
  }) : super(key: key);

  //TODO - configuração static sobre para memória...
  static final Map<InputTextType, Map<String, dynamic>> _config = {
    InputTextType.email: {
      'suffixWidget': Icon(
        Icons.check_circle_outline_outlined,
        color: kGreen,
      ),
      'textStyle': TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: kGrey600,
      ),
      'errorTextStyle': TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: kRed,
      ),
      'obscureText': false,
      'keyboardType': TextInputType.emailAddress,
      'inputBorder': OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: kGrey400, width: 2.0),
      ),
    },
    InputTextType.password: {
      'textStyle': TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: kGrey600,
      ),
      'errorTextStyle': TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: kRed,
      ),
      'obscureText': true,
      'keyboardType': TextInputType.text,
      'inputBorder': OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: kGrey400, width: 2.0),
      ),
    },
    InputTextType.text: {
      'suffixWidget': Icon(
        Icons.check_circle_outline_outlined,
        color: kGreen,
      ),
      'textStyle': TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: kGrey600,
      ),
      'errorTextStyle': TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: kRed,
      ),
      'obscureText': false,
      'keyboardType': TextInputType.text,
      'inputBorder': OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: kGrey400, width: 2.0),
      ),
    }
  };

  @override
  _InputTextWidgetState createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  //TODO - criar uma classe só com as configurações
  InputBorder get inputBorder => InputTextWidget._config[widget.type]!['inputBorder'];
  TextStyle get textStyle => InputTextWidget._config[widget.type]!['textStyle'];
  Widget get suffixWidget => InputTextWidget._config[widget.type]!['suffixWidget'];
  EdgeInsetsGeometry get contentPadding => InputTextWidget._config[widget.type]!['contentPadding'];
  TextInputType get keyboardType => InputTextWidget._config[widget.type]!['keyboardType'];
  TextStyle get errorTextStyle => InputTextWidget._config[widget.type]!['errorTextStyle'];
  double get height => _error != null ? 72.0 : 48.0;

  bool obscureText = false;
  String? _error;
  String _value = "";

  Widget get mountSuffixIcon {
    if (InputTextWidget._config[widget.type]!['obscureText'])
      return IconButton(
        icon: Icon(
          obscureText ? Icons.visibility : Icons.visibility_off,
          color: kGrey500,
        ),
        onPressed: changeObscureText,
      );

    if (_value.isNotEmpty && _error == null) return suffixWidget;

    return SizedBox();
  }

  void onChangeValidade(String value) {
    _value = value;

    if (widget.onChange != null) widget.onChange!(value);

    if (value.isNotEmpty)
      setState(() {
        _error = widget.onValidate(value);
      });
  }

  void changeObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            widget.label,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12.0,
            ),
          ),
        ),
        Container(
          constraints: BoxConstraints(
            minHeight: height,
          ),
          child: TextField(
            obscureText: obscureText,
            keyboardType: keyboardType,
            style: textStyle,
            onChanged: onChangeValidade,
            decoration: InputDecoration(
              suffixIcon: mountSuffixIcon,
              enabledBorder: inputBorder,
              disabledBorder: inputBorder,
              errorBorder: inputBorder,
              focusedBorder: inputBorder,
              focusedErrorBorder: inputBorder,
              border: inputBorder,
              errorText: _error,
              errorStyle: errorTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
