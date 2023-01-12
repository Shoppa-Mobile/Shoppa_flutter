// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/screens/auth/proofOfIdentity/nINUpload/nINUploadContent.dart';

class NINUploadScreen extends StatelessWidget {
  static String routeName = '/NIN Upload Screen';
  const NINUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 0,
        ),
        body: const SafeArea(child: NINUploadContent()));
  }
}
