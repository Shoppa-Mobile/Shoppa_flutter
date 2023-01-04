import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/screens/profile/Components/profileScreenContent.dart';

import '../../widgets/customNavBar.dart';
import '../../constants/constants.dart';
import '../../enums.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static String routeName = '/Profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 2,
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: headerStyle2,
        ),
      ),
      body: const ProileScreenContent(),
      bottomNavigationBar: const CustomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
