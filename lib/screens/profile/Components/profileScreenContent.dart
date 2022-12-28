// ignore_for_file: file_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import '../../../constants/size_configurations.dart';

class ProileScreenContent extends StatefulWidget {
  const ProileScreenContent({super.key});

  @override
  State<ProileScreenContent> createState() => _ProileScreenContentState();
}

class _ProileScreenContentState extends State<ProileScreenContent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: getPropWidth(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getPropHeight(30),
          ),
          const ProfileCard(),
          SizedBox(
            height: getPropHeight(45),
          ),
          Column(
            children: [
              ProfileDetailsCard(
                press: () {},
                topText: 'Email Address',
                bottomText: "helenadegoke@gmail.com",
                iconData1: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ),
              SizedBox(height: getPropHeight(2)),
              ProfileDetailsCard(
                press: () {},
                topText: 'Store Address',
                bottomText: "41 Ozumba Mbadiwe close, Victoria Island",
                iconData1: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ),
              SizedBox(height: getPropHeight(2)),
              ProfileDetailsCard(
                press: () {},
                topText: 'Store Phone Number',
                bottomText: "08012345678",
                iconData1: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ),
              SizedBox(height: getPropHeight(2)),
              ProfileDetailsCard2(
                press: () {},
                topText: 'Store Phone Number',
                bottomText: "shoppa/helen’s boutique",
                iconData1: const Icon(Icons.share),
                iconData2: const Icon(Icons.content_copy_outlined),
              ),
              SizedBox(height: getPropHeight(2)),
              ProfileDetailsCard(
                press: () {},
                topText: 'Notifications',
                bottomText: '',
                iconData1: const Icon(
                  Icons.notifications_active,
                  size: 18,
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        height: getPropHeight(145),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: getPropHeight(30), horizontal: getPropWidth(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Helen's Boutique", style: whiteHeaderStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Store Owner", style: ordersCardText3),
                      Text("Helen Adegoke", style: ordersCardText2),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Phone Number", style: ordersCardText3),
                      Text("08053013277", style: ordersCardText2),
                    ],
                  ),
                ],
              )
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
    required this.bottomText,
    required this.iconData1,
  });

  final GestureTapCallback press;
  final String topText, bottomText;
  final Icon iconData1;

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
                        style: TextStyle(
                          color: regularTextColor,
                          fontFamily: 'Lato',
                          fontSize: getPropHeight(12),
                          fontWeight: FontWeight.w400,
                        ),
                      )
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
                        style: TextStyle(
                          color: regularTextColor,
                          fontFamily: 'Lato',
                          fontSize: getPropHeight(12),
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
