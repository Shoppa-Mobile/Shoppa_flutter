// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/screens/inputNumResetPassword/component/inputNumContent.dart';


class InputNumberScreen extends StatelessWidget {
  const InputNumberScreen({super.key});
  static String routeName = "/inputNumber";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: const SafeArea(child: InputNumberContent()),
    );
  }
}
