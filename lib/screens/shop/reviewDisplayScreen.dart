// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';

class ReviewDisplayScreen extends StatelessWidget {
  const ReviewDisplayScreen({super.key});
  static String routeName = '/ReviewsDisplay';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        automaticallyImplyLeading: true,
        scrolledUnderElevation: 2.0,
        title: Text(
          'All Reviews',
          style: regTextStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
