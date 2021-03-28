import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:aula_14/app/modules/login/login_store.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(),
    );
  }
}
