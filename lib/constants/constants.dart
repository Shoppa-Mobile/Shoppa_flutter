import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/size_configurations.dart';

TextStyle headerStyle = TextStyle(
  color: headerTextColor,
  fontFamily: 'Manrope',
  fontSize: getPropHeight(32),
  fontWeight: FontWeight.w600,
);

TextStyle subHeaderStyle = TextStyle(
  color: subHeaderTextColor,
  fontFamily: 'Lato',
  fontSize: getPropHeight(16),
  fontWeight: FontWeight.w400,
);

TextStyle primaryButtonText = TextStyle(
  color: primaryButtonTextColor,
  fontFamily: 'Lato',
  fontSize: getPropHeight(16),
  fontWeight: FontWeight.w400,
);

TextStyle secondaryButtonText = TextStyle(
  color: secondaryButtonTextColor,
  fontFamily: 'Lato',
  fontSize: getPropHeight(16),
  fontWeight: FontWeight.w400,
);

const animationduration = Duration(seconds: 3);
