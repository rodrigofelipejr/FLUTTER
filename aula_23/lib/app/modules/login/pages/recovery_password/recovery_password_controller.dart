import 'package:flutter/material.dart';
import 'package:aula23/app/modules/login/utils/login_validators.dart';

class RecoveryPasswordController {
  String _email = "";

  final enabledButtonNotifier = ValueNotifier<bool>(false);
  bool get enabledButton => enabledButtonNotifier.value;
  set enabledButton(bool value) => enabledButtonNotifier.value = value;

  void onChangeAndValidate({String? email, String? password}) {
    if (email != null) _email = email;

    if (LoginValidators.email(_email) == null)
      enabledButton = true;
    else
      enabledButton = false;
  }
}
