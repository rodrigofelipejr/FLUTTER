import 'package:flutter/material.dart';
import 'package:check_internet/app/shared/resources/constants.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Internet"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (controller.loading)
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );

        return Scaffold(
          body: SafeArea(
            child: Observer(
              builder: (_) {
                bool status = controller.connectivityState.connectionStatus;

                return AnimatedContainer(
                  duration: Duration(seconds: 1),
                  decoration: BoxDecoration(
                    color: status ? kGreen.withAlpha(155) : kRed.withAlpha(155),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "${status ? 'INTERNET ON' : 'INTERNET OFF'}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
