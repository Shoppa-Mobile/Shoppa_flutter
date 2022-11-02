import 'package:flutter/material.dart';
import 'package:shoppa_app/screens/login/login_screen.dart';
import 'package:shoppa_app/screens/onBoarding/onboarding_screen.dart';
import 'package:shoppa_app/screens/otp/otpScreen.dart';
import 'package:shoppa_app/screens/resetPassword/resetPassword_screen.dart';
import 'package:shoppa_app/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  ResetPasswordScreen.routeName: (context) => const ResetPasswordScreen(),
  OtpScreen.routeName: (context) => const OtpScreen()
};
