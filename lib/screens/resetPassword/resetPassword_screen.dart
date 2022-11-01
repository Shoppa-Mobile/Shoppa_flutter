import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/screens/resetPassword/resetPasswordContent/resetPasswordContent.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});
  static String routeName = "/resetPassword";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
      ),
      body: const SafeArea(child: ResetPasswordContent()),
    );
  }
}
