// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppa_app/widgets/customNavBar.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/enums.dart';
import 'package:shoppa_app/screens/createOrder/components/createOrderContent.dart';

import '../../constants/size_configurations.dart';
import '../notifications/notifications.dart';

class CreateOrderScreen extends StatelessWidget {
  const CreateOrderScreen({super.key});
  static String routeName = "/Create Order";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
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
          const SizedBox(width: 20)
        ],
      ),
      body: const CreateOrderContent(),
      bottomNavigationBar: const CustomNavBar(selectedMenu: MenuState.orders),
    );
  }
}
