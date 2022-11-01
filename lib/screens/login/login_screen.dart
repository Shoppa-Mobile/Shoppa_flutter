import 'package:flutter/material.dart';
import 'package:shoppa_app/screens/login/loginContent/login_content.dart';
import '../../constants/colors.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/Login";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 0,
        ),
        body: const SafeArea(child: LoginContent()));
  }
}
