import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'signUpContent/signUp_content2.dart';

class SignUpScreen2 extends StatelessWidget {
  static String routeName = "/SignUp2";
  const SignUpScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
      ),
      body: const SafeArea(child: SignUpContent2()),
    );
  }
}
