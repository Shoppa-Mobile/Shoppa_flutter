// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/size_configurations.dart';

class ReviewDisplayWidget extends StatelessWidget {
  const ReviewDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.library_add_sharp,
          size: getPropWidth(200),
          color: primaryColor.withOpacity(0.3),
        )
      ],
    );
  }
}