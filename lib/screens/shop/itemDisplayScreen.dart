// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';

class ItemDisplayScreen extends StatelessWidget {
  const ItemDisplayScreen({super.key});
  static String routeName = '/ItemsDisplay';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        automaticallyImplyLeading: true,
        scrolledUnderElevation: 2.0,
      ),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getPropWidth(18),
            vertical: getPropHeight(20),
          ),
          child: Center(
            child: Text(
              'Item Details will be displayed here',
              style: headerStyle.copyWith(fontSize: 32),
            ),
          ),
        ),
      ),
    );
  }
}
