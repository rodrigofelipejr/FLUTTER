import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'connectivity_state.g.dart';

@Injectable()
class ConnectivityState = _ConnectivityStateBase with _$ConnectivityState;

abstract class _ConnectivityStateBase with Store {
  StreamSubscription<ConnectivityResult> subscription;
  Timer _timer;

  _ConnectivityStateBase() {
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult connectivityResult) async {
      print("listen: $connectivityResult");
      _timer?.cancel();
      _timer = Timer(Duration(seconds: 4), () async {
        print("run timer...");
        _statusStream = connectivityResult != null && connectivityResult != ConnectivityResult.none;
        if (_statusStream) {
          await Future.delayed(Duration(seconds: 4));
        }
        bool value = await _checkInternet();
        setConnectionStatus(value);
      });
    });
  }

  void dispose() {
    subscription.cancel();
  }

  bool _statusStream;

  @computed
  bool get getStatusConnection {
    print("_statusStream: $_statusStream - connectionStatus: $connectionStatus");
    return _statusStream == true && connectionStatus == true;
  }

  @observable
  bool connectionStatus = false;
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
