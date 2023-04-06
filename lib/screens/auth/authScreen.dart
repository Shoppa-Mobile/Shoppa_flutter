// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoppa_app/providers/AuthStateProvider.dart';
import 'package:shoppa_app/screens/auth/onboarding/onboarding_screen.dart';
import 'package:shoppa_app/screens/home/homeScreen.dart';

class AuthenticationScreen extends StatelessWidget {
  static String routeName = "/Authentication Screen";
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        bool isLoggedIn = ref.watch(authProvider);
        context;
        return (isLoggedIn == true)
            ? const HomeScreen()
            : const OnBoardingScreen();
      },
    );
  }
}
