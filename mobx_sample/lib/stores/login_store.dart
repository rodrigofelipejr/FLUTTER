import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore() {
    autorun((_) {
      // print("email: $email");
      // print("passwd: $passwd");
      // print("isFormValid: $isFormValid");
    });
  }

  @observable
  String email = "rodrigo@gmail.com";

  @action
  void changeEmail(value) => email = value;

  @observable
  String passwd = "1234567";

  @action
  void changePasswd(value) => passwd = value;

  @computed
  bool get isEmailValid =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

  @computed
  bool get isPasswdValid => passwd.length > 6;

  @computed
  bool get isFormValid => isEmailValid && isPasswdValid;

  @observable
  bool passwordVisible = true;

  @action
  void togglePasswordVisible() => passwordVisible = !passwordVisible;

  @observable
  bool loading = false;

  @action
  void changeLoading(value) => loading = value;

  @action
  Future login() async {
    changeLoading(true);

    await Future.delayed(Duration(seconds: 2));

    changeLoading(false);
    changeLoggedIn(true);

    changeEmail("");
    changePasswd("");
  }

  @computed
  Function get loginPressed => (isEmailValid && isPasswdValid && !loading) ? login : null;

  @observable
  bool loggedIn = false;

  @action
  void changeLoggedIn(value) => loggedIn = value;

  @action
  void dispose() {}

  @action
  void logout() {
    loggedIn = false;
  }
}
