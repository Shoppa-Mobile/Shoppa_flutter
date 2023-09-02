// ignore_for_file: file_names
import 'package:flutter/material.dart';

class ColorWidget extends StatelessWidget {
  const ColorWidget({super.key, required this.productColor});

  final Color productColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: productColor,
      radius: 12,
    );
    
  }
}
