import 'package:aula16/app/shared/models/user/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase extends Disposable with Store {
  late ReactionDisposer _disposer;

  @observable
  UserModel? _user;

  _AuthStoreBase() {
    _disposer = autorun((_) {
      if (_user != null) {
        Modular.to.pushReplacementNamed('/home');
      } else {
        Modular.to.pushReplacementNamed('/login');
      }
    });
  }

  @action
  void logged(UserModel? user) {
    this._user = user;
  }

  @action
  void logout() {
    _user = null;
  }

  UserModel? get currentUSer => _user;

  @override
  void dispose() {
    print('call dispose auth');
    _disposer();
  }
}
