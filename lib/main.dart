import 'package:flutter/material.dart';
import 'package:shoppa_app/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Shoppa',
        theme: ThemeData(
          fontFamily: "Lato",
          backgroundColor: Colors.white,
        ),
        home: const SplashScreen());
  }
}
