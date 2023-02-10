// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/enums.dart';
import 'package:shoppa_app/screens/profile/widgets/personalInfoForm.dart';
import 'package:shoppa_app/widgets/customNavBar.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});
  static String routeName = '/Personal Information Screen';

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        scrolledUnderElevation: 2,
        automaticallyImplyLeading: true,
        title: Text(
          "Personal Information",
          style: headerStyle.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
            fontSize: 20,
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
            ),
            child: const PersonalInfoForm(),
          ),
        ),
      )),
      bottomNavigationBar: const CustomNavBar(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}
