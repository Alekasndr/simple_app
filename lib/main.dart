import 'package:flutter/material.dart';
import 'package:simple_app/pages/home.dart';
import 'package:simple_app/pages/mainscreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScrean(),
        '/todo': (context) => const Home(),
      },
    ),
  );
}
