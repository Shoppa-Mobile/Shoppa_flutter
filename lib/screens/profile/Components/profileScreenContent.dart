// ignore_for_file: file_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import '../../../constants/size_configurations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProileScreenContent extends StatefulWidget {
  const ProileScreenContent({super.key});

  @override
  State<ProileScreenContent> createState() => _ProileScreenContentState();
}

class _ProileScreenContentState extends State<ProileScreenContent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getPropWidth(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getPropHeight(16),
            ),
            Text(
              "Helen's Boutique",
              style: headerStyle3.copyWith(
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(
              height: getPropHeight(16),
            ),
            const ProfileCard(),
            SizedBox(
              height: getPropHeight(32),
            ),
            Column(
              children: [
                ProfileDetailsCard(
                  press: () {},
                  topText: 'Store Information',
                  leadingIcon: "assets/icons/person_icon.svg",
                  iconData1: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ),
                SizedBox(height: getPropHeight(2)),
                ProfileDetailsCard(
                  press: () {},
                  topText: 'Security',
                  leadingIcon: "assets/icons/lock_icon.svg",
                  iconData1: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ),
                SizedBox(height: getPropHeight(2)),
                ProfileDetailsCard(
                  press: () {},
                  topText: 'FAQ',
                  leadingIcon: "assets/icons/faq_icon.svg",
                  iconData1: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ),
                SizedBox(height: getPropHeight(2)),
                ProfileDetailsCard(
                  press: () {},
                  topText: 'Support center',
                  leadingIcon: "assets/icons/support_icon.svg",
                  iconData1: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ),
                SizedBox(height: getPropHeight(2)),
                ProfileDetailsCard(
                  press: () {},
                  topText: 'Terms and Conditions',
                  leadingIcon: "assets/icons/tac_icon.svg",
                  iconData1: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ),
                SizedBox(height: getPropHeight(2)),
                ProfileDetailsCard(
                  press: () {},
                  topText: 'Privacy Policy',
                  leadingIcon: "assets/icons/privacy_icon.svg",
                  iconData1: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ),
                SizedBox(height: getPropHeight(2)),
                ProfileDetailsCard(
                  press: () {},
                  topText: 'Notifications',
                  leadingIcon: '',
                  iconData1: const Icon(
                    Icons.notifications_active,
                    size: 18,
                  ),
                ),
                SizedBox(height: getPropHeight(2)),
                ProfileDetailsCard2(
                  press: () {},
                  topText: 'Store Link',
                  bottomText: "shoppa/helen’s boutique",
                  iconData1: const Icon(Icons.share),
                  iconData2: const Icon(Icons.content_copy_outlined),
                ),
                SizedBox(
                  height: getPropHeight(16),
                ),
                const LogOutCard(),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        height: getPropHeight(64),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: getPropHeight(8), horizontal: getPropWidth(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Helen Adegoke",
                    style: regTextStyle.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "helenadegoke@gmail.com",
                    style: regTextStyle2,
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileDetailsCard extends StatelessWidget {
  const ProfileDetailsCard({
    super.key,
    required this.press,
    required this.topText,
    required this.leadingIcon,
    required this.iconData1,
  });

  final GestureTapCallback press;
  final String topText, leadingIcon;
  final Icon iconData1;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: SizedBox(
        height: getPropHeight(56),
        width: SizeConfig.screenWidth - 30,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getPropWidth(2),
            vertical: getPropHeight(1),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      (leadingIcon == '')
                          ? const SizedBox()
                          : SvgPicture.asset(leadingIcon),
                      const SizedBox(width: 5),
                      Text(
                        topText,
                        style: regTextStyle,
                      ),
                    ],
                  ),
                  iconData1,
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 2,
                width: SizeConfig.screenWidth - 40,
                color: regularTextColor.withOpacity(0.1),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileDetailsCard2 extends StatelessWidget {
  const ProfileDetailsCard2({
    super.key,
    required this.press,
    required this.topText,
    required this.bottomText,
    required this.iconData1,
    required this.iconData2,
  });

  final GestureTapCallback press;
  final String topText, bottomText;
  final Icon iconData1, iconData2;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgColor,
      elevation: 0,
      child: SizedBox(
        height: getPropHeight(75),
        width: SizeConfig.screenWidth - 30,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getPropWidth(2), vertical: getPropHeight(1)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        topText,
                        style: regTextStyle,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        bottomText,
                        style: const TextStyle(
                          color: regularTextColor,
                          fontFamily: 'Lato',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      iconData1,
                      const SizedBox(width: 3),
                      iconData2,
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 2,
                width: SizeConfig.screenWidth - 40,
                color: regularTextColor.withOpacity(0.1),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LogOutCard extends StatelessWidget {
  const LogOutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ordersCardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        height: getPropHeight(56),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: getPropHeight(9), horizontal: getPropWidth(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/icons/logout_icon.svg',
                color: deleteIconColor,
              ),
              SizedBox(
                width: getPropWidth(12),
              ),
              Text(
                "Log Out",
                style: regTextStyle2.copyWith(
                  color: deleteIconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
