// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AppController = BindInject(
  (i) => AppController(i<ConnectivityState>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  final _$heightAtom = Atom(name: '_AppControllerBase.height');

  @override
  double get height {
    _$heightAtom.reportRead();
    return super.height;
  }

  @override
  set height(double value) {
    _$heightAtom.reportWrite(value, super.height, () {
      super.height = value;
    });
  }

  final _$backgroundAtom = Atom(name: '_AppControllerBase.background');

  @override
  Color get background {
    _$backgroundAtom.reportRead();
    return super.background;
  }

  @override
  set background(Color value) {
    _$backgroundAtom.reportWrite(value, super.background, () {
      super.background = value;
    });
  }

  final _$messageAtom = Atom(name: '_AppControllerBase.message');

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  final _$verifyConnectionAsyncAction =
      AsyncAction('_AppControllerBase.verifyConnection');

  @override
  Future<void> verifyConnection() {
    return _$verifyConnectionAsyncAction.run(() => super.verifyConnection());
  }

  @override
  String toString() {
    return '''
height: ${height},
background: ${background},
message: ${message}
    ''';
  }
}
