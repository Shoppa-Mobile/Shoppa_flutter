// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/screens/auth/proofOfIdentity/driLicenseUpload/driLicenseUploadContent.dart';

class DriLicenseUploadScreen extends StatelessWidget {
  static String routeName = "/Driver's License Upload Screen";
  const DriLicenseUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 0,
        ),
        body: const SafeArea(child: DriLicenseUploadContent()));
  }
}
