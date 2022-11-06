// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/screens/signUp/signUpContent/signUp_content1.dart';
import '../../constants/colors.dart';

class SignUpScreen1 extends StatelessWidget {
  static String routeName = "/SignUp1";
  const SignUpScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
      ),
      body: const SafeArea(child: SignUpContent()),
    );
  }
}
