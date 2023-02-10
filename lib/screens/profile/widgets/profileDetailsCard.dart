// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.press,
  });
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Card(
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
    return InkWell(
      onTap: press,
      child: Card(
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
