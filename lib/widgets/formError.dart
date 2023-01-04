// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/size_configurations.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            errors.length, (index) => formErrorText(errors[index])));
  }

  Row formErrorText(String error) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/error.svg",
          color: secondaryButtonTextColor,
          height: getPropHeight(14),
          width: getPropWidth(14),
        ),
        SizedBox(width: getPropWidth(5)),
        Text(error)
      ],
    );
  }
}
