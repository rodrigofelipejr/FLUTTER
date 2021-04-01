import 'package:aula16/app/modules/login/widgets/input_text_widget.dart';
import 'package:aula16/app/modules/login/widgets/text_button_expanded_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:aula16/app/modules/login/login_store.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            color: Colors.green,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: size.width,
              height: size.height * 0.75,
              margin: const EdgeInsets.only(left: 4.0, right: 4.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Bem vindo!',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 26.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text('Mantenha seus gastos em dia'),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      InputTextWidget(
                        label: "EMAIL",
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      InputTextWidget(
                        label: "SENHA",
                      ),
                      TextButtonExpandedWidget(
                        label: "ENTRAR",
                        onTap: () => null,
                      ),
                      TextButtonExpandedWidget(
                        label: "Esqueci minha senha",
                        onTap: () => null,
                        type: TextButtonExpandedType.none,
                      ),
                      TextButtonExpandedWidget(
                        label: "CRIAR UMA CONTA",
                        onTap: () => null,
                        type: TextButtonExpandedType.outline,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
