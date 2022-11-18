// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/enums.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key, required this.selectedMenu});

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = primaryColor.withOpacity(0.8);
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: getPropWidth(18), horizontal: getPropWidth(30)),
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
            onTap: () {},
            child: Container(
              decoration: (MenuState.home == selectedMenu)
                  ? null
                  : const BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.rectangle,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(16))),
              child: SvgPicture.asset(
                "assets/icons/home.svg",
                color: MenuState.home == selectedMenu
                    ? primaryColor
                    : inActiveIconColor,
              ),
            )),
        InkWell(
            onTap: () {},
            child: Container(
              decoration: (MenuState.home == selectedMenu)
                  ? null
                  : const BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.rectangle,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(16))),
              child: SvgPicture.asset(
                "assets/icons/shop.svg",
                color: MenuState.shop == selectedMenu
                    ? Colors.white
                    : inActiveIconColor,
              ),
            )),
        InkWell(
            onTap: () {},
            child: Container(
              decoration: (MenuState.home == selectedMenu)
                  ? null
                  : const BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.rectangle,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(16))),
              child: SvgPicture.asset(
                "assets/icons/orders.svg",
                color: MenuState.orders == selectedMenu
                    ? Colors.white
                    : inActiveIconColor,
              ),
            )),
        InkWell(
            onTap: () {},
            child: Container(
              decoration: (MenuState.home == selectedMenu)
                  ? null
                  : const BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.rectangle,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(16))),
              child: SvgPicture.asset(
                "assets/icons/profile.svg",
                color: MenuState.profile == selectedMenu
                    ? Colors.white
                    : inActiveIconColor,
              ),
            )),
      ])),
    );
  }
}
