import 'package:flutter/material.dart';
import 'package:ifood/core/theme/app_theme.dart';
import 'package:ifood/views/content/content_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iFood Clone',
      theme: AppTheme.theme,
      home: ContentPage(),
    );
  }
}
