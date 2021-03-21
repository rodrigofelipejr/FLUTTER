import 'package:flutter/cupertino.dart';

class HomeController {
  final countValue = ValueNotifier<int>(0);

  int get count => countValue.value;
  set count(int value) => countValue.value = value;
  void increment() {
    count++;
  }

  void dispose() {
    countValue.dispose();
  }
}
