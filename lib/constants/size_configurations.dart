import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class SizeConfig {
  late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  late Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

double getPropHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 1020 is the designer's specified layout height
  return (inputHeight / 1020.0) * screenHeight;
}

double getPropWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 414 is the designer's specified layout width
  return (inputWidth / 414.0) * screenWidth;
}
