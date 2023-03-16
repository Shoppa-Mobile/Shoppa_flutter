// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';

class InventoryDisplayWidget extends StatelessWidget {
  const InventoryDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: getPropWidth(220),
            height: getPropHeight(48),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: primaryColor,
              onPressed: () {},
              child: Text(
                " +  Add new Item ",
                style: whiteHeaderStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            height: getPropHeight(32),
          ),
          Expanded(
              child: Center(
            child: Icon(
              Icons.library_add_sharp,
              size: getPropWidth(180),
              color: primaryColor.withOpacity(0.3),
            ),
          ))
        ]);
  }
}
