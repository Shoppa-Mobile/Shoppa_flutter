// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/providers/VendorProvider.dart';
import 'package:shoppa_app/screens/home/widgets/inventoryWidget.dart';
import 'package:shoppa_app/screens/home/widgets/pendingOrdersWidget.dart';
import 'package:shoppa_app/widgets/customNavBar.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/enums.dart';
import 'package:shoppa_app/screens/notifications/notifications.dart';

import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: bgColor,
              title: const Text('Exit'),
              content: Text(
                'Are you sure you want to exit the app?',
                style: regTextStyle,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    onWillPop(context, false);
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: primaryColor),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text(
                    'No',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: bgColor,
            scrolledUnderElevation: 2.0,
            title: Consumer(
              builder: (context, ref, _) {
                final vendor = ref.watch(vendorProvider);
                return Text(
                  "Hello ${vendor?.firstname}",
                  style: headerStyle.copyWith(fontSize: 28),
                );
              },
            ),
            centerTitle: false,
            actions: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Notifications.routeName,
                  );
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
                  child: Center(
                    child: PendingOrder2(),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar:
              const CustomNavBar(selectedMenu: MenuState.home)),
    );
  }
}

onWillPop(context, bool toggle) async {
  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  return toggle;
}
