import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/screens/onBoarding/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/Splash";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 7),
        () => Navigator.pushReplacementNamed(
            context, OnBoardingScreen.routeName));
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/logos/shoppa logo2.svg',
              height: getPropHeight(98),
              width: getPropWidth(98),
            )
          ],
        ),
      ),
    );
  }
}
