import 'package:flutter/material.dart';
import 'package:aula23/app/modules/login/utils/login_validators.dart';

class CreateAccountController {
  String _name = "";
  String _email = "";
  String _password = "";

  final enabledButtonNotifier = ValueNotifier<bool>(false);
  bool get enabledButton => enabledButtonNotifier.value;
  set enabledButton(bool value) => enabledButtonNotifier.value = value;

  void onChangeAndValidate({String? name, String? email, String? password}) {
    if (name != null) _name = name;
    if (email != null) _email = email;
    if (password != null) _password = password;

    if (LoginValidators.name(_name) == null &&
        LoginValidators.email(_email) == null &&
        LoginValidators.password(_password) == null)
      enabledButton = true;
    else
      enabledButton = false;
  }
}
