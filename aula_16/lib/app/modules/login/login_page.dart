import 'package:aula16/app/modules/login/widgets/input_text_widget.dart';
import 'package:aula16/app/modules/login/widgets/text_button_expanded_widget.dart';
import 'package:aula16/app/shared/utils/colors.dart';
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
            height: size.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background_login.png"),
                // alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
              ),
            ),
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 32.0),
                      Text(
                        'Bem vindo!',
                        style: TextStyle(
                          color: kBlack,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 38),
                        child: Text(
                          'Mantenha seus gastos em dia',
                          style: TextStyle(
                            color: kGrey500,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      InputTextWidget(
                        label: "EMAIL",
                        type: InputTextType.email,
                        onValidate: (value) => value.contains("@") ? null : "Não pode ser vazio",
                      ),
                      SizedBox(height: 18.0),
                      InputTextWidget(
                        label: "SENHA",
                        type: InputTextType.password,
                        onValidate: (value) => value.length >= 6 ? null : "A senha deve conter no mín. 6 caracteres",
                      ),
                      SizedBox(height: 18.0),
                      TextButtonExpandedWidget(
                        label: "Login",
                        onTap: () => null,
                      ),
                      SizedBox(height: 22.0),
                      TextButtonExpandedWidget(
                        label: "Esqueci minha senha",
                        onTap: () => null,
                        type: TextButtonExpandedType.none,
                      ),
                      SizedBox(height: 22.0),
                      TextButtonExpandedWidget(
                        label: "Criar uma conta",
                        onTap: () => null,
                        type: TextButtonExpandedType.outline,
                      ),
                      SizedBox(height: 32.0),
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
