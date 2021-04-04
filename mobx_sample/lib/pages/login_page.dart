import 'package:mobx_sample/pages/home_page.dart';
import 'package:mobx_sample/stores/login_store.dart';
import 'package:mobx_sample/widgets/custom_icon_button_widget.dart';
import 'package:mobx_sample/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginStore controller;

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    controller = Provider.of<LoginStore>(context);

    /** sempre vai executar */
    // disposer = autorun((_) {
    //   if (controller.loggedIn) {
    //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    //   }
    // });

    /* aguarda ter uma troca do valor para executar */
    disposer = reaction((_) => controller.loggedIn, (loggedIn) {
      if (loggedIn) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
      }
    });

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(32),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 16,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Observer(builder: (_) {
                  return CustomTextField(
                    hint: 'E-mail',
                    prefix: Icon(Icons.account_circle),
                    textInputType: TextInputType.emailAddress,
                    onChanged: controller.changeEmail,
                    enabled: !controller.loading,
                  );
                }),
                const SizedBox(
                  height: 16,
                ),
                Observer(builder: (_) {
                  return CustomTextField(
                    hint: 'Senha',
                    prefix: Icon(Icons.lock),
                    obscure: controller.passwordVisible,
                    onChanged: controller.changePasswd,
                    enabled: !controller.loading,
                    suffix: CustomIconButton(
                      radius: 32,
                      iconData: controller.passwordVisible ? Icons.visibility : Icons.visibility_off,
                      onTap: controller.togglePasswordVisible,
                    ),
                  );
                }),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 44,
                  child: Observer(
                    builder: (_) {
                      return RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: controller.loading
                            ? CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(Colors.white),
                              )
                            : Text('Login'),
                        color: Theme.of(context).primaryColor,
                        disabledColor: Theme.of(context).primaryColor.withAlpha(100),
                        textColor: Colors.white,
                        onPressed: controller.loginPressed,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
