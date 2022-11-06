// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/screens/otp/otpContent/otpContent.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/Otpscreen";

  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(elevation: 0),
      body: const OtpContent(),
    );
  }
}
