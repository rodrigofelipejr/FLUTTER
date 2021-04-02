import 'package:aula23/app/modules/login/pages/create_account/create_account_controller.dart';
import 'package:aula23/app/modules/login/utils/login_validators.dart';
import 'package:aula23/app/modules/login/widgets/input_text_widget.dart';
import 'package:aula23/app/modules/login/widgets/text_button_expanded_widget.dart';
import 'package:aula23/app/shared/utils/colors.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  CreateAccountController controller = CreateAccountController();

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
                image: AssetImage("assets/images/background_create_account.jpg"),
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
                        'Criando uma conta',
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
                        label: "NOME",
                        type: InputTextType.text,
                        onValidate: LoginValidators.name,
                        onChange: (name) => controller.onChangeAndValidate(name: name),
                      ),
                      SizedBox(height: 18.0),
                      InputTextWidget(
                        label: "E-MAIL",
                        type: InputTextType.email,
                        onValidate: LoginValidators.email,
                        onChange: (email) => controller.onChangeAndValidate(email: email),
                      ),
                      SizedBox(height: 18.0),
                      InputTextWidget(
                        label: "SENHA",
                        type: InputTextType.password,
                        onValidate: LoginValidators.password,
                        onChange: (password) => controller.onChangeAndValidate(password: password),
                      ),
                      SizedBox(height: 18.0),
                      ValueListenableBuilder<bool>(
                          valueListenable: controller.enabledButtonNotifier,
                          builder: (_, enabled, __) => TextButtonExpandedWidget(
                                label: "Criar conta",
                                onTap: enabled ? () => null : null,
                              )),
                      SizedBox(height: 22.0),
                      TextButtonExpandedWidget(
                        label: "Já tem uma conta? Faça login",
                        onTap: () => Navigator.pop(context),
                        type: TextButtonExpandedType.none,
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
