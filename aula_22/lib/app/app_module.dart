import 'package:aula23/app/app_store.dart';
import 'package:aula23/app/modules/login/login_module.dart';
import 'package:aula23/app/modules/login/login_store.dart';
import 'package:aula23/app/modules/splash/splash_module.dart';
import 'package:aula23/app/modules/splash/splash_store.dart';
import 'package:aula23/app/shared/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AppStore()),
    Bind((i) => AuthStore()),
    Bind((i) => SplashStore()),
    Bind((i) => LoginStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
