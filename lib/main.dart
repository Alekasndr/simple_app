import 'package:flutter/material.dart';
import 'package:simple_app/pages/home.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        primaryColor: Colors.green),
    home: Home(),
  ));
}