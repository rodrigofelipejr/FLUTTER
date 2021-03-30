import 'package:aula15/app/modules/login/login_state.dart';
import 'package:aula15/app/modules/login/widgets/form_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:aula15/app/modules/login/login_store.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (_) {
                return FormLoginWidget(
                  onPressed: controller.state is Loading
                      ? null
                      : (email, password) {
                          controller.login(email: email, password: password);
                        },
                );
              },
            ),
            Observer(
              builder: (_) {
                if (controller.state is None) {
                  return Container();
                }

                if (controller.state is Loading) {
                  return CircularProgressIndicator();
                }

                if (controller.state is Success) {
                  return Text('Entrando no aplicativo');
                }

                return Text('Email e/ou senha inválidos');
              },
            ),
          ],
        ),
      ),
    );
  }
}
