// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/screens/proofOfIdentity/p_O_IUpload/p_O_IUploadContent.dart';

class POIUploadScreen extends StatelessWidget {
  static String routeName = '/POI Upload Screen';
  const POIUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 0,
        ),
        body: const SafeArea(child: POIUploadContent()));
  }
}
