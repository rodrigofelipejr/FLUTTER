// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormLoginStore on _FormLoginStoreBase, Store {
  Computed<String?>? _$validateEmailComputed;

  @override
  String? get validateEmail =>
      (_$validateEmailComputed ??= Computed<String?>(() => super.validateEmail,
              name: '_FormLoginStoreBase.validateEmail'))
          .value;
  Computed<String?>? _$validatePasswordComputed;

  @override
  String? get validatePassword => (_$validatePasswordComputed ??=
          Computed<String?>(() => super.validatePassword,
              name: '_FormLoginStoreBase.validatePassword'))
      .value;
  Computed<bool>? _$validateComputed;

  @override
  bool get validate =>
      (_$validateComputed ??= Computed<bool>(() => super.validate,
              name: '_FormLoginStoreBase.validate'))
          .value;

  final _$emailAtom = Atom(name: '_FormLoginStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_FormLoginStoreBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$_FormLoginStoreBaseActionController =
      ActionController(name: '_FormLoginStoreBase');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_FormLoginStoreBaseActionController.startAction(
        name: '_FormLoginStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_FormLoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_FormLoginStoreBaseActionController.startAction(
        name: '_FormLoginStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_FormLoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
validateEmail: ${validateEmail},
validatePassword: ${validatePassword},
validate: ${validate}
    ''';
  }
}
