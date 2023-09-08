// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/providers/AuthStateProvider.dart';
import 'package:shoppa_app/screens/auth/onboarding/onboarding_screen.dart';
import 'package:shoppa_app/screens/home/homeScreen.dart';

class AuthenticationScreen extends StatelessWidget {
  static String routeName = "/Authentication Screen";
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: bgColor,
              title: const Text('Exit'),
              content: Text(
                'Are you sure you want to exit the app?',
                style: regTextStyle,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    onWillPop(context, false);
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: primaryColor),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text(
                    'No',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Consumer(
        builder: (context, ref, child) {
          bool isLoggedIn = ref.watch(authProvider);
          context;
          return (isLoggedIn == true)
              ? const HomeScreen()
              : const OnBoardingScreen();
        },
      ),
    );
  }
}
