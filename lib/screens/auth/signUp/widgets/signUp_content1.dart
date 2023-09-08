// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/screens/auth/signUp/widgets/signUp_Form1.dart';

class SignUpContent extends StatefulWidget {
  const SignUpContent({super.key});

  @override
  State<SignUpContent> createState() => _SignUpContentState();
}

class _SignUpContentState extends State<SignUpContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropWidth(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getPropHeight(25)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: (SizeConfig.screenWidth - getPropWidth(30)) * 0.5,
                    height: 2,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                        color: primaryColor),
                  ),
                  Container(
                    width: (SizeConfig.screenWidth - getPropWidth(30)) * 0.5,
                    height: 2,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                        color: subHeaderTextColor),
                  ),
                ],
              ),
              SizedBox(height: getPropHeight(5)),
              Row(
                children: [
                  Text(
                    "Step 1/2",
                    style: subHeaderStyle,
                  ),
                  SizedBox(width: getPropWidth(30)),
                  Text(
                    "Personal Details",
                    style: headerStyle3,
                  ),
                ],
              ),
              SizedBox(height: getPropHeight(45)),
              const SingleChildScrollView(child: SignUpForm1())
            ],
          ),
        ),
      ),
    );
  }
}
