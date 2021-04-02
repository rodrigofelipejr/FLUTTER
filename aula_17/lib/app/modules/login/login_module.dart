import 'package:aula17/app/modules/login/login_page.dart';
import 'package:aula17/app/modules/login/login_store.dart';
import 'package:aula17/app/modules/login/widgets/form_login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => FormLoginStore()),
    Bind.lazySingleton((i) => LoginStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage(), transition: TransitionType.fadeIn),
  ];
}
