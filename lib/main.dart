import 'package:flutter/material.dart';
import 'package:simple_app/pages/home_screen/home_screen.dart';
import 'package:simple_app/pages/main_screen/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:simple_app/pages/menu_screen/menu_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/todo': (context) => const HomeScreen(),
        '/menu': (context) => const MenuScreen(),
      },
    ),
  );
}
