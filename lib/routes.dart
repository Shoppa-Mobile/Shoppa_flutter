import 'package:flutter/material.dart';
import 'package:shoppa_app/screens/login/login_screen.dart';
import 'package:shoppa_app/screens/onBoarding/onboarding_screen.dart';
import 'package:shoppa_app/screens/otp/otpScreen.dart';
import 'package:shoppa_app/screens/proofOfIdentity/p_O_IUpload/p_O_IUploadScreen.dart';
import 'package:shoppa_app/screens/proofOfIdentity/proofOfIdentityScreen.dart';
import 'package:shoppa_app/screens/resetPassword/resetPassword_screen.dart';
import 'package:shoppa_app/screens/signUp/signUp_Screen2.dart';
import 'package:shoppa_app/screens/signUp/signUp_screen1.dart';
import 'package:shoppa_app/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
  SignUpScreen1.routeName: (context) => const SignUpScreen1(),
  SignUpScreen2.routeName: (context) => const SignUpScreen2(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  ResetPasswordScreen.routeName: (context) => const ResetPasswordScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  ProofOfIdentityScreen.routeName: (context) => const ProofOfIdentityScreen(),
  POIUploadScreen.routeName: (context) => const POIUploadScreen()
};
