// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';

class SupportDetailsCard extends StatelessWidget {
  const SupportDetailsCard(
      {super.key,
      required this.press,
      required this.topText,
      required this.leadingIcon,
      required this.iconData1});

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
          height: getPropHeight(60),
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
                const SizedBox(height: 12,),
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
