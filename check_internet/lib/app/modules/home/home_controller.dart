import 'package:check_internet/app/shared/states/connectivity_state.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ConnectivityState connectivityState;

  _HomeControllerBase(this.connectivityState) {
    Future.delayed(Duration(seconds: 2)).then((_) => setLoading(false));
  }

  @observable
  bool loading = true;
  @action
  void setLoading(bool value) => loading = value;
}
