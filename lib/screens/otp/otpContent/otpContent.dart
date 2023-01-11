// ignore_for_file: file_names
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shoppa_app/screens/resetPassword/resetPassword_screen.dart';
import 'package:shoppa_app/widgets/defaultButton.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/screens/proofOfIdentity/proofOfIdentityScreen.dart';
import '../../../constants/colors.dart';
import '../../../constants/size_configurations.dart';
import 'otpForm.dart';

class OtpContent extends StatefulWidget {
  const OtpContent({super.key});

  @override
  State<OtpContent> createState() => _OtpContentState();
}

class _OtpContentState extends State<OtpContent> {
  bool toResendAgain = false;
  late Timer timer;
  int start = 10;

  @override
  Widget build(BuildContext context) {
    // ? = object can accept null,
    // ! =  tells the compiler that the variable is not null, and can be used safely
    final Object? number = ModalRoute.of(context)!.settings.arguments;
    startTimer();
    return SingleChildScrollView(
      child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getPropWidth(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getPropHeight(15),
                ),
                Text("Reset Password", style: headerStyle2),
                const SizedBox(height: 8),
                Text(
                    'A four digit code has been sent to $number \nKindly input it below:',
                    style: subHeaderStyle),
                SizedBox(
                  height: getPropHeight(38),
                ),
                const OTPForm(),
                SizedBox(
                  height: getPropHeight(15),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Didn't get an OTP?",
                      style: subHeaderStyle,
                    ),
                    buildTimer()
                  ],
                ),
                SizedBox(
                  height: getPropHeight(95),
                ),
                DefaultButton(
                  text: "Next",
                  press: () {
                    // Go to POI Screen
                    Navigator.of(context)
                        .pushNamed(ResetPasswordScreen.routeName);
                  },
                ),
                SizedBox(
                  height: getPropHeight(42),
                ),
                Align(
                  alignment: Alignment.center,
                  child: buildEmailInstead(),
                )
              ],
            ),
          )),
    );
  }

  TextButton buildEmailInstead() {
    return TextButton(
        onPressed: () {},
        child: const Text(
          "Use email address instead",
          style: TextStyle(
              decoration: TextDecoration.underline,
              color: secondaryButtonTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ));
  }

  TextButton buildTimer() {
    return TextButton(
        onPressed: () {
          if (toResendAgain = true) {
            setState(() {
              toResendAgain = false;
              startTimer();
            });
          }
        },
        child: Text(
          toResendAgain ? "Resend Code" : "Retry in $start",
          style: TextStyle(
              color: toResendAgain ? primaryColor : headerTextColor,
              fontSize: 16),
        ));
  }

  void startTimer() {
    // setState(() {
    //   toResendAgain = true;
    // });

    const oneSec = Duration(seconds: 4);
    timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (start == 0) {
          timer.cancel();
          start = 10;
          toResendAgain = true;
        } else {
          start--;
        }
      });
    });
  }

  TweenAnimationBuilder<int> tweenTimer() {
    return TweenAnimationBuilder(
      tween: IntTween(begin: 10, end: 0),
      duration: const Duration(seconds: 10), // because we allow 10 secs
      builder: (context, value, child) => Text(
        ("$value secs"),
      ),
      onEnd: () {
        setState(() {
          toResendAgain = true;
        });
      },
    );
  }
}
