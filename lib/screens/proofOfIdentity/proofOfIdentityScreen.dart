// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/screens/proofOfIdentity/proofOfIdentityContent.dart';

class ProofOfIdentityScreen extends StatelessWidget {
  static String routeName = '/Proof Of Identity Screen';
  const ProofOfIdentityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
      ),
      body: const ProofOfIdentityContent(),
    );
  }
}
