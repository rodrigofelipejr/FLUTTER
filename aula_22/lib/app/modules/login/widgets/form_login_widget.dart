import 'package:aula23/app/modules/login/widgets/form_login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FormLoginWidget extends StatefulWidget {
  final Function(String email, String password)? onPressed;

  const FormLoginWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  _FormLoginWidgetState createState() => _FormLoginWidgetState();
}

class _FormLoginWidgetState extends ModularState<FormLoginWidget, FormLoginStore> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Observer(
          builder: (_) {
            return TextField(
              textInputAction: TextInputAction.next,
              onChanged: controller.setEmail,
              decoration: InputDecoration(
                hintText: 'Email',
                errorText: controller.validateEmail,
              ),
            );
          },
        ),
        Observer(
          builder: (_) {
            return TextField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              onChanged: controller.setPassword,
              decoration: InputDecoration(
                hintText: 'Password',
                errorText: controller.validatePassword,
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Observer(
            builder: (_) {
              return ElevatedButton(
                onPressed: controller.validate && widget.onPressed != null
                    ? () => widget.onPressed!(controller.email, controller.password)
                    : null,
                child: Text('Entrar'),
              );
            },
          ),
        ),
      ],
    );
  }
}
