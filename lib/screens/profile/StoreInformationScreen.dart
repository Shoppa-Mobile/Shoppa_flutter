// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/enums.dart';
import 'package:shoppa_app/screens/profile/widgets/storeInfoForm.dart';
import 'package:shoppa_app/widgets/customNavBar.dart';

class StoreInformationScreen extends StatefulWidget {
  const StoreInformationScreen({super.key});
  static String routeName = '/Store Information Screen';

  @override
  State<StoreInformationScreen> createState() => _StoreInformationScreenState();
}

class _StoreInformationScreenState extends State<StoreInformationScreen> {
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
          "Store Information",
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
            child: const StoreInfoForm(),
          ),
        ),
      ),),
      bottomNavigationBar: const CustomNavBar(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}
