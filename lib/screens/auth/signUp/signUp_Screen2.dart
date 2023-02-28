// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'widgets/signUp_content2.dart';

class SignUpScreen2 extends StatelessWidget {
  static String routeName = "/SignUp2";
  const SignUpScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: bgColor,
        centerTitle: true,
        title: Text(
          'Create your account',
          style: headerStyle2.copyWith(fontSize: 20),
        ),
      ),
      body: const SafeArea(child: SignUpContent2(),),
    );
  }
}
