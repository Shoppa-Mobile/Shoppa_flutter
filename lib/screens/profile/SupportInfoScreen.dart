// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/enums.dart';
import 'package:shoppa_app/screens/profile/widgets/supportDetailsCard.dart';
import 'package:shoppa_app/widgets/customNavBar.dart';

class SupportInfoScreen extends StatefulWidget {
  const SupportInfoScreen({super.key});
  static String routeName = '/Support Information Screen';

  @override
  State<SupportInfoScreen> createState() => _SupportInfoScreenState();
}

class _SupportInfoScreenState extends State<SupportInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        scrolledUnderElevation: 2,
        automaticallyImplyLeading: true,
        title: Text(
          "Support",
          style: headerStyle.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getPropWidth(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SupportDetailsCard(
                    press: () {},
                    topText: 'Call our help line',
                    leadingIcon: 'assets/icons/phone_icon.svg',
                    iconData1: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                  ),
                  SupportDetailsCard(
                    press: () {},
                    topText: 'Chat with us on Whatsapp',
                    leadingIcon: 'assets/icons/whatsapp_icon.svg',
                    iconData1: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                  ),
                  SupportDetailsCard(
                    press: () {},
                    topText: 'Send us a Mail',
                    leadingIcon: 'assets/icons/email.svg',
                    iconData1: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavBar(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}
