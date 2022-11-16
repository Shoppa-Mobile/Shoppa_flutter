// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/components/customNavBar.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/enums.dart';
import 'package:shoppa_app/screens/home/homeScreenContent1.dart';
import 'package:shoppa_app/screens/home/homeScreenContent2.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routeName = "/home1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: bgColor,
        scrolledUnderElevation: 2.0,
      ),
      backgroundColor: bgColor,
      body: const HomeScreenContent1(),
      bottomNavigationBar: const CustomNavBar(selectedMenu: MenuState.home),
    );
  }
}
