// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_state.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ConnectivityState = BindInject(
  (i) => ConnectivityState(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConnectivityState on _ConnectivityStateBase, Store {
  final _$_connectivityStreamAtom =
      Atom(name: '_ConnectivityStateBase._connectivityStream');

  @override
  ObservableStream<ConnectivityResult> get _connectivityStream {
    _$_connectivityStreamAtom.reportRead();
    return super._connectivityStream;
  }

  @override
  set _connectivityStream(ObservableStream<ConnectivityResult> value) {
    _$_connectivityStreamAtom.reportWrite(value, super._connectivityStream, () {
      super._connectivityStream = value;
    });
  }

  final _$connectionStatusAtom =
      Atom(name: '_ConnectivityStateBase.connectionStatus');

  @override
  bool get connectionStatus {
    _$connectionStatusAtom.reportRead();
    return super.connectionStatus;
  }

  @override
  set connectionStatus(bool value) {
    _$connectionStatusAtom.reportWrite(value, super.connectionStatus, () {
      super.connectionStatus = value;
    });
  }

  final _$_checkInternetAsyncAction =
      AsyncAction('_ConnectivityStateBase._checkInternet');

  @override
  Future<bool> _checkInternet() {
    return _$_checkInternetAsyncAction.run(() => super._checkInternet());
  }

  final _$_ConnectivityStateBaseActionController =
      ActionController(name: '_ConnectivityStateBase');

  @override
  void setConnectionStatus(bool value) {
    final _$actionInfo = _$_ConnectivityStateBaseActionController.startAction(
        name: '_ConnectivityStateBase.setConnectionStatus');
    try {
      return super.setConnectionStatus(value);
    } finally {
      _$_ConnectivityStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
connectionStatus: ${connectionStatus}
    ''';
  }
}
