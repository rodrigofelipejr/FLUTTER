
import 'package:mobx_sample/pages/login_page.dart';
import 'package:mobx_sample/stores/login_store.dart';
import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<LoginStore>(
      create: (_) => LoginStore(),
      dispose: (_, store) => store.dispose(), // Ex...
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.deepPurpleAccent,
          cursorColor: Colors.deepPurpleAccent,
          scaffoldBackgroundColor: Colors.deepPurpleAccent,
        ),
        home: LoginPage(),
      ),
    );
  }
}
