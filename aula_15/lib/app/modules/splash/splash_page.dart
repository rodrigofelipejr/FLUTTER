import 'package:aula15/app/shared/auth/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:aula15/app/modules/splash/splash_store.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashStore> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1)).then((_) => Modular.get<AuthStore>().logout());

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
