import 'package:mobx/mobx.dart';

part 'form_login_store.g.dart';

class FormLoginStore = _FormLoginStoreBase with _$FormLoginStore;

abstract class _FormLoginStoreBase with Store {
  @observable
  String email = '';
  @action
  void setEmail(String value) => email = value;
  @computed
  String? get validateEmail => email.length == 0 || email.contains('@') ? null : "E-mail inválido";

  @observable
  String password = '';
  @action
  void setPassword(String value) => password = value;
  @computed
  String? get validatePassword =>
      password.length == 0 || password.length >= 6 ? null : "Senha deve conter no mínimo 6 caracteres";

  @computed
  bool get validate => validateEmail == null && email.isNotEmpty && validatePassword == null && password.isNotEmpty;
}
