import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/routes.dart';
import 'package:shoppa_app/screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  runApp(
    const ProviderScope(
      child: Shoppa(),
    ),
  );
}

class Shoppa extends StatelessWidget {
  const Shoppa({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoppa',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: regularTextColor),
          backgroundColor: bgColor,
        ),
        fontFamily: "Raleway",
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: bgColor,
        ),
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
