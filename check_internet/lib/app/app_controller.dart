import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:check_internet/app/shared/resources/constants.dart';
import 'package:check_internet/app/shared/states/connectivity_state.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'app_controller.g.dart';

@Injectable()
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final ConnectivityState connectivityState;

  _AppControllerBase(this.connectivityState) {
    _timer = Timer(Duration(seconds: 12), () async => await verifyConnection());
    _disposer = reaction((_) => connectivityState.connectionStatus, (_) async => await verifyConnection());
  }

  Timer _timer;
  static double _heightMax = 20;
  static double _heightMin = 0;

  void dispose() {
    _disposer();
    _timer?.cancel();
  }

  ReactionDisposer _disposer;

  bool _initialConnectionState = false;

  @action
  Future<void> verifyConnection() async {
    _timer?.cancel();

    if (connectivityState.getStatusConnection) {
      if (!_initialConnectionState) {
        _initialConnectionState = true;
        return;
      }

      if (height != _heightMin) {
        height = _heightMin;
        await Future.delayed(Duration(seconds: 1));
      }

      message = "Conectado à Internet";
      height = _heightMax;
      background = kGreen;

      await Future.delayed(Duration(seconds: 3));

      height = _heightMin;
    } else {
      message = "Por favor, verifique sua conexão com a internet";
      height = _heightMax;
      background = kRed;

      _initialConnectionState = true;
    }
  }

  @observable
  double height = _heightMin;
  @observable
  Color background = kTransparent;
  @observable
  String message = "";
}
