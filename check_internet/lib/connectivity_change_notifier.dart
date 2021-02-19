import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class ConnectivityChangeNotifier extends ChangeNotifier {
  ConnectivityChangeNotifier() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      resultHandler(result);
    });
  }

  ConnectivityResult _connectivityResult = ConnectivityResult.none;
  ConnectivityResult get connectivity => _connectivityResult;

  String _svgUrl = 'assets/disconnected.svg';
  String get svgUrl => _svgUrl;

  String _pageText = 'Oops.. Verifique a sua conexão com a rede!';
  String get pageText => _pageText;

  void resultHandler(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.none:
        _svgUrl = 'assets/disconnected.svg';
        _pageText = 'Oops.. Verifique a sua conexão com a rede!';
        break;
      case ConnectivityResult.mobile:
        _svgUrl = 'assets/connected_mobile.svg';
        _pageText = 'Conectado via dados móveis. Procure a uma rede wi-fi!';
        break;
      default:
        _svgUrl = 'assets/connected_wifi.svg';
        _pageText = 'Conectado a uma rede wi-fi!';
    }
    notifyListeners();
    _connectivityResult = result;
  }

  void initialLoad() async {
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    resultHandler(connectivityResult);
  }
}
