import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/routes.dart';
import 'package:shoppa_app/screens/splash/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        fontFamily: "Lato",
        backgroundColor: bgColor,
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
