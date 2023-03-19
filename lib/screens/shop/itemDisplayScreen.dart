// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';

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
    );
  }
}
