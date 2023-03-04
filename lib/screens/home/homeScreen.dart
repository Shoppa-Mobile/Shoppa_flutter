// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppa_app/screens/home/widgets/inventoryWidget.dart';
import 'package:shoppa_app/screens/home/widgets/pendingOrdersWidget.dart';
import 'package:shoppa_app/widgets/customNavBar.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/enums.dart';
import 'package:shoppa_app/screens/notifications/notifications.dart';
import '../../constants/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: bgColor,
          scrolledUnderElevation: 2.0,
          title: SafeArea(
            child: Text(
              "Hello, Oghenefejiro",
              style: headerStyle.copyWith(fontSize: 28),
            ),
          ),
          centerTitle: false,
          actions: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Notifications.routeName);
              },
              child: SafeArea(
                child: SvgPicture.asset(
                  'assets/icons/bell.svg',
                  height: getPropHeight(28),
                  width: getPropWidth(28),
                ),
              ),
            ),
            const SizedBox(width: 20)
          ],
        ),
        backgroundColor: bgColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getPropWidth(15), vertical: getPropHeight(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getPropHeight(10)),
              Text(
                'Inventory',
                style: headerStyle3,
              ),
              SizedBox(height: getPropHeight(10)),
              const Inventory2(),
              SizedBox(height: getPropHeight(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pending Orders',
                    style: headerStyle3,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View all',
                      style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'Lato',
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getPropHeight(3)),
              const Expanded(
                child: PendingOrder2(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const CustomNavBar(selectedMenu: MenuState.home));
  }
}
