import 'package:aula23/app/modules/login/login_state.dart';
import 'package:aula23/app/modules/login/utils/login_validators.dart';
import 'package:aula23/app/shared/auth/auth_store.dart';
import 'package:aula23/app/shared/models/user/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final AuthStore authStore;

  LoginStoreBase(this.authStore);

  @observable
  LoginState state = None();

  @action
  Future<void> login({required String email, required String password}) async {
    state = Loading();
    await Future.delayed(Duration(seconds: 2));
    if (email == 'rodrigo@gmail.com' && password == '123123') {
      state = Success();
      authStore.logged(UserModel(email, 'Rodrigo'));
    } else {
      state = Error();
    }
  }

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
