import 'package:flutter/material.dart';
import 'package:aula23/app/modules/login/utils/login_validators.dart';

class LoginController {
  String _email = "";
  String _password = "";

  final enabledButtonNotifier = ValueNotifier<bool>(false);
  bool get enabledButton => enabledButtonNotifier.value;
  set enabledButton(bool value) => enabledButtonNotifier.value = value;

  void onChangeAndValidate({String? email, String? password}) {
    if (email != null) _email = email;
    if (password != null) _password = password;

    if (LoginValidators.email(_email) == null && LoginValidators.password(_password) == null)
      enabledButton = true;
    else
      enabledButton = false;
  }
}
