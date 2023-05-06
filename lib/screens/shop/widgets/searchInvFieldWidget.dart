// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/size_configurations.dart';

class SearchInventoryField extends StatelessWidget {
  const SearchInventoryField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth - 10,
      height: getPropHeight(56),
      decoration: BoxDecoration(
          border: Border.all(
              color: subHeaderTextColor.withOpacity(0.2),
              style: BorderStyle.solid,
              width: 1),
          color: bgColor,
          borderRadius: BorderRadius.circular(8),),
      child: TextField(
        onChanged: (value) {
          // search value
        },
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "Search Item",
          hintStyle: TextStyle(
            color: subHeaderTextColor.withOpacity(0.5),
            fontFamily: 'Lato',
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Icon(
            Icons.search_outlined,
            color: subHeaderTextColor.withOpacity(0.5),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: getPropWidth(20),
            vertical: getPropWidth(9),
          ),
          suffixIcon: Icon(
            Icons.filter_alt_outlined,
            color: subHeaderTextColor.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
