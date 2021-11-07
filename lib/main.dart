import 'package:flutter/material.dart';
import 'package:poc_userstory_1/pages/welcome/welcome.dart';
import 'package:poc_userstory_1/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      home: WelcomePage(),
      routes: staticRoutes,
    );
  }
}
