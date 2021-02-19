import 'package:flutter/material.dart';
import 'package:check_internet/app/app_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends ModularState<AppWidget, AppController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: Modular.navigatorKey,
            title: 'Internet check',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: '/',
            builder: asuka.builder,
            onGenerateRoute: Modular.generateRoute,
          ),
        ),
        Observer(
          builder: (_) {
            return AnimatedContainer(
              // Use the properties stored in the State class.
              width: double.infinity,
              height: controller.height,
              decoration: BoxDecoration(
                color: controller.background,
              ),
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Center(
                  child: Text(
                    controller.message,
                    style: TextStyle(fontSize: 12.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
