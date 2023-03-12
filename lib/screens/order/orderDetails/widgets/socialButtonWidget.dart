// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';

class SocialIconWidget extends StatelessWidget {
  const SocialIconWidget({
    super.key,
    required this.icon,
    required this.pressed,
    required this.iconName,
  });
  final String icon;
  final String iconName;
  final GestureTapCallback pressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 2,
      ),
      child: InkWell(
        onTap: pressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: getPropWidth(55),
              height: getPropHeight(55),
            ),
            const SizedBox(height: 2),
            Text(
              iconName,
              style: subHeaderStyle2.copyWith(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
