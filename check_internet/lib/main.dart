import 'package:check_internet/connectivity_change_notifier.dart';
import 'package:check_internet/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        ConnectivityChangeNotifier changeNotifier = ConnectivityChangeNotifier();
        changeNotifier.initialLoad();
        return changeNotifier;
      },
      child: MaterialApp(
        title: 'Checking internet',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
