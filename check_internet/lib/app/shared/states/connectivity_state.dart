import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'connectivity_state.g.dart';

@Injectable()
class ConnectivityState = _ConnectivityStateBase with _$ConnectivityState;

abstract class _ConnectivityStateBase with Store {
  Timer _timer;
  ReactionDisposer _disposer;

  _ConnectivityStateBase() {
    _connectivityStream = ObservableStream(Connectivity().onConnectivityChanged);

    _disposer = reaction((_) => _connectivityStream.value, (status) async {
      _timer?.cancel();
      _timer = Timer(Duration(seconds: 0), () async {
        if (status != null && status != ConnectivityResult.none) await Future.delayed(Duration(seconds: 4));
        bool value = await _checkInternet();
        setConnectionStatus(value);
      });
    }, delay: 4000);
  }

  void dispose() {
    _disposer();
  }

  @observable
  ObservableStream<ConnectivityResult> _connectivityStream;

  @observable
  bool connectionStatus;
  @action
  void setConnectionStatus(bool value) => connectionStatus = value;

  @action
  Future<bool> _checkInternet() async {
    try {
      final result = await InternetAddress.lookup('www.google.com').timeout(Duration(seconds: 5));
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty ? true : false;
    } on SocketException catch (_) {
      return false;
    }
  }
}
