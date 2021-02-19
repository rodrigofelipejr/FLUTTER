import 'package:app_settings/app_settings.dart';
import 'package:check_internet/connectivity_change_notifier.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Consumer<ConnectivityChangeNotifier>(
              builder: (BuildContext context, ConnectivityChangeNotifier connectivityChangeNotifier, Widget child) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(child: SvgPicture.asset(connectivityChangeNotifier.svgUrl, fit: BoxFit.contain)),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 100.0),
                    child: Text(
                      connectivityChangeNotifier.pageText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0XFF63ddff),
                      ),
                    ),
                  ),
                ),
                if (connectivityChangeNotifier.connectivity != ConnectivityResult.wifi)
                  Flexible(
                    child: RaisedButton(
                      child: Text('Abrir configurações'),
                      onPressed: () => AppSettings.openAppSettings(),
                    ),
                  )
              ],
            );
          }),
        ),
      ),
    );
  }
}
