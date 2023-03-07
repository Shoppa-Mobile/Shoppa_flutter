// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/enums.dart';
import 'package:shoppa_app/screens/profile/widgets/securityInfoForm.dart';
import 'package:shoppa_app/widgets/customNavBar.dart';

class SecurityInfoScreen extends StatefulWidget {
  const SecurityInfoScreen({super.key});
  static String routeName = '/Security Information Screen';

  @override
  State<SecurityInfoScreen> createState() => _SecurityInfoScreenState();
}

class _SecurityInfoScreenState extends State<SecurityInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        scrolledUnderElevation: 2,
        automaticallyImplyLeading: true,
        title: SafeArea(
          child: Text(
            "Security",
            style: headerStyle.copyWith(
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              fontSize: 20,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getPropWidth(15),
                vertical: getPropHeight(2)
              ),
              child: const SecurityInfoForm(),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavBar(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}
