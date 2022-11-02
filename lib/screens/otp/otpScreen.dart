import 'package:flutter/material.dart';
import 'package:shoppa_app/screens/otp/otpContent/otpContent.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/Otpscreen";
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: const OtpContent(),
    );
  }
}
