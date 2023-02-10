// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';

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
