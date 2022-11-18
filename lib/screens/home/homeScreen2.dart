// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppa_app/components/customNavBar.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/enums.dart';
import 'package:shoppa_app/screens/home/homeScreenContent2.dart';
import '../../constants/constants.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});
  static String routeName = "/home2";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: bgColor,
        scrolledUnderElevation: 2.0,
        title: Row(
          children: [
            Container(
              height: 36,
              width: 36,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset("assets/images/profile.png", fit: BoxFit.fill),
            ),
            SizedBox(
              width: getPropWidth(5),
            ),
            Text(
              "Hello, Oghenefejiro",
              style: headerStyle3,
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              'assets/icons/bell.svg',
              height: getPropHeight(32),
              width: getPropWidth(32),
            ),
          ),
          const SizedBox(width: 15)
        ],
      ),
      backgroundColor: bgColor,
      body: const HomeScreenContent2(),
      bottomNavigationBar: const CustomNavBar(selectedMenu: MenuState.home),
    );
  }
}
