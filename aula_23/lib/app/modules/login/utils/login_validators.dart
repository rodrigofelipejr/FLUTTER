//TODO - melhorar todas as  validações
class LoginValidators {
  static String? email(String value) {
    bool isEmailValid =
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}").hasMatch(value);
    return isEmailValid ? null : "E-mail inválido";
  }

  static String? password(String value) {
    if (value.length >= 6) {
      return null;
    } else {
      return "A senha deve conter no mín. 6 caracteres";
    }
  }

  static String? name(String value) {
    if (value.split(" ").length > 1) {
      return null;
    } else {
      return "Informe seu nome completo";
    }
  }
}
