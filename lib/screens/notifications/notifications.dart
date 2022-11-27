import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppa_app/components/customNavBar.dart';
import 'package:shoppa_app/enums.dart';
import 'package:shoppa_app/screens/notifications/notificationsContent.dart/notificationsContent.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../constants/size_configurations.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});
  static String routeName = "/notifications";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 2,
        elevation: 0,
        backgroundColor: bgColor.withOpacity(0.8),
        centerTitle: true,
        title: Text(
          "Notifications",
          style: headerStyle2,
        ),
        actions: [
          SvgPicture.asset(
            'assets/icons/bell.svg',
            height: getPropHeight(32),
            width: getPropWidth(32),
          ),
          const SizedBox(width: 10)
        ],
      ),
      backgroundColor: bgColor,
      body: const NotificationsContent(),
      bottomNavigationBar: const CustomNavBar(selectedMenu: MenuState.empty),
    );
  }
}
