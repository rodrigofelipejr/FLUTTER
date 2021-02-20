import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class ConnectivityChangeNotifier extends ChangeNotifier {
  ConnectivityChangeNotifier() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      preResultHandler(result);
    });
  }

  bool _resultTest;
  Timer _timerConnectionTest;

  ConnectivityResult _connectivityResult = ConnectivityResult.none;
  ConnectivityResult get connectivity => _connectivityResult;

  String _svgUrl = 'assets/disconnected.svg';
  String get svgUrl => _svgUrl;

  String _pageText = 'Oops.. Verifique a sua conexão com a rede!';
  String get pageText => _pageText;

  void preResultHandler(ConnectivityResult result) {
    _timerConnectionTest?.cancel();

    if (_connectivityResult == ConnectivityResult.none && result != ConnectivityResult.none)
      _timerConnectionTest = Timer(const Duration(seconds: 4), () => resultHandler(result));
    else
      resultHandler(result);
  }

  void resultHandler(ConnectivityResult result) async {
    _resultTest = await _connectionTest();

    if (_resultTest != null && !_resultTest) {
      _svgUrl = 'assets/disconnected.svg';
      _pageText = 'Oops.. Verifique a sua conexão com a rede!';
      _connectivityResult = ConnectivityResult.none;
      notifyListeners();
      return;
    }

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

    _connectivityResult = result;
    notifyListeners();
  }

  Future<bool> _connectionTest() async {
    try {
      final result = await InternetAddress.lookup('1.1.1.1').timeout(Duration(seconds: 5));
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty ? true : false;
    } on SocketException catch (_) {
      return false;
    }
  }

  void initialLoad() async {
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    resultHandler(connectivityResult);
  }
}
