// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/screens/auth/signUp/signUp_screen1.dart';

class SignUpOptionsScreen extends StatelessWidget {
  const SignUpOptionsScreen({super.key});
  static String routeName = "/SignUpOptions";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getPropWidth(17)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create Account',
              style: headerStyle.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: getPropHeight(64),
            ),
            BuildSignUpOptionCard(
                option: 'E-mail',
                icon: "assets/icons/email.svg",
                press: () {
                  Navigator.of(context).pushNamed(SignUpScreen1.routeName);
                }),
            SizedBox(
              height: getPropHeight(20),
            ),
            BuildSignUpOptionCard(
                option: 'Google',
                icon: "assets/icons/google.svg",
                press: () {}),
            SizedBox(
              height: getPropHeight(20),
            ),
            BuildSignUpOptionCard(
                option: 'Facebook',
                icon: "assets/icons/facebook.svg",
                press: () {}),
            SizedBox(
              height: getPropHeight(20),
            ),
            BuildSignUpOptionCard(
                option: 'Instagram',
                icon: "assets/icons/instagram1.svg",
                press: () {}),
            SizedBox(
              height: getPropHeight(20),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildSignUpOptionCard extends StatelessWidget {
  const BuildSignUpOptionCard(
      {super.key,
      required this.option,
      required this.icon,
      required this.press});
  final String option, icon;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        width: SizeConfig.screenWidth,
        height: getPropHeight(64),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: textFieldBorderColor)),
        child: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SvgPicture.asset(icon,
                height: getPropHeight(32), width: getPropWidth(32)),
            SizedBox(
              width: getPropWidth(10),
            ),
            Text(
              'Continue with $option',
              style: regTextStyle,
            )
          ]),
        ),
      ),
    );
  }
}
