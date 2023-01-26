// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppa_app/widgets/customNavBar.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/enums.dart';
import 'package:shoppa_app/screens/home/homeScreenContent.dart';
import 'package:shoppa_app/screens/notifications/notifications.dart';
import '../../constants/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routeName = "/home2";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: bgColor,
          scrolledUnderElevation: 2.0,
          title: Text(
            "Hello, Oghenefejiro",
            style: headerStyle.copyWith(fontSize: 28),
          ),
          centerTitle: false,
          actions: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Notifications.routeName);
              },
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
        body: const HomeScreenContent(),
        bottomNavigationBar: const CustomNavBar(selectedMenu: MenuState.home));
  }
}
