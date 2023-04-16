import 'package:flutter/material.dart';
import 'package:simple_app/pages/home.dart';
import 'package:simple_app/pages/mainscreen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.green),
    initialRoute: '/',
    routes: {
      '/': (context) => MainScrean(),
      '/todo': (context) => Home(),
    },
  ));
}
