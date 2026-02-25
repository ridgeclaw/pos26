import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/main_area.dart';

void main() => runApp(PosApp());

class PosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pos26',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/main': (context) => MainArea(),
      },
    );
  }
}
