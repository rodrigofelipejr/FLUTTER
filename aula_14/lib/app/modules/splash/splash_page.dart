import 'package:aula_14/app/shared/auth/auth_store.dart';
import 'package:aula_14/app/shared/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:aula_14/app/modules/splash/splash_store.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashStore> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1)).then((_) => Modular.get<AuthStore>().logged(null));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(),
    );
  }
}
