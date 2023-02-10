// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/size_configurations.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    required this.icon,
    // required this.pressed,
  }) : super(key: key);

  final String icon;
  // final Function pressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {}),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getPropWidth(10)),
        padding: EdgeInsets.all(getPropWidth(15)),
        height: getPropHeight(70),
        width: getPropWidth(70),
        decoration: BoxDecoration(
            border:
                Border.all(color: subHeaderTextColor, style: BorderStyle.solid),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: Colors.transparent,
            shape: BoxShape.rectangle),
        child: SvgPicture.asset(
          icon,
          height: getPropHeight(75),
          width: getPropWidth(75),
        ),
      ),
    );
  }
}
