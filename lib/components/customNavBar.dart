// ignore_for_file: file_names, unused_import
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/enums.dart';
import 'package:shoppa_app/screens/home/homeScreen1.dart';
import 'package:shoppa_app/screens/home/homeScreen2.dart';
import 'package:shoppa_app/screens/orders/ordersScreen.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key, required this.selectedMenu});

  final MenuState selectedMenu;

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: getPropWidth(10), horizontal: getPropWidth(30)),
      decoration: BoxDecoration(color: bgColor, boxShadow: [
        BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: lightPrimaryColor.withOpacity(0.2))
      ]),
      child: SafeArea(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        InkWell(
            onTap: () {
              Navigator.pushNamed(context, HomeScreen2.routeName);
            },
            child: (MenuState.home == widget.selectedMenu)
                ? Container(
                    width: getPropWidth(56),
                    height: getPropHeight(65),
                    decoration: const BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.rectangle,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(16))),
                    child: Center(
                      child: SvgPicture.asset("assets/icons/home.svg",
                          color: bgColor),
                    ),
                  )
                : Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(16))),
                    child: SvgPicture.asset(
                      "assets/icons/home.svg",
                      color: primaryColor,
                    ),
                  )),
        InkWell(
            onTap: () {},
            child: (MenuState.shop == widget.selectedMenu)
                ? Container(
                    width: getPropWidth(56),
                    height: getPropHeight(65),
                    decoration: const BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.rectangle,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(16))),
                    child: Center(
                      child: SvgPicture.asset("assets/icons/shop.svg",
                          color: bgColor),
                    ),
                  )
                : Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(16))),
                    child: SvgPicture.asset(
                      "assets/icons/shop.svg",
                      color: primaryColor,
                    ),
                  )),
        InkWell(
            onTap: () {
              Navigator.pushNamed(context, OrdersScreen.routeName);
            },
            child: (MenuState.orders == widget.selectedMenu)
                ? Container(
                    width: getPropWidth(56),
                    height: getPropHeight(65),
                    decoration: const BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.rectangle,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(16))),
                    child: Center(
                      child: SvgPicture.asset("assets/icons/orders.svg",
                          color: bgColor),
                    ),
                  )
                : Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(16))),
                    child: SvgPicture.asset(
                      "assets/icons/orders.svg",
                      color: primaryColor,
                    ),
                  )),
        InkWell(
            onTap: () {},
            child: (MenuState.profile == widget.selectedMenu)
                ? Container(
                    width: getPropWidth(56),
                    height: getPropHeight(65),
                    decoration: const BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.rectangle,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(16))),
                    child: Center(
                      child: SvgPicture.asset("assets/icons/profile.svg",
                          color: bgColor),
                    ),
                  )
                : Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(16))),
                    child: SvgPicture.asset(
                      "assets/icons/profile.svg",
                      color: primaryColor,
                    ),
                  )),
      ])),
    );
  }
}
