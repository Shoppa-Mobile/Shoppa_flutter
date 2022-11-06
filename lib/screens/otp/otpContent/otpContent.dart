// ignore_for_file: file_names
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shoppa_app/components/defaultButton.dart';
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
  int start = 30;

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
                SizedBox(
                  height: getPropHeight(15),
                ),
                Text("Reset Password", style: headerStyle2),
                const SizedBox(height: 8),
                Text(
                    'A four digit code has been sent to 080********. \nKindly input it below:',
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
                        .pushNamed(ProofOfIdentityScreen.routeName);
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
        child: Text(
          "Use email address instead",
          style: TextStyle(
              decoration: TextDecoration.underline,
              color: secondaryButtonTextColor,
              fontSize: getPropHeight(16),
              fontWeight: FontWeight.w400),
        ));
  }

  TextButton buildTimer() {
    return TextButton(
        onPressed: () {},
        child: Text(
          toResendAgain ? "Resend Code" : "Retry in 30secs",
          style: TextStyle(
              color: toResendAgain ? primaryColor : headerTextColor,
              fontSize: getPropHeight(16)),
        ));
  }

  void resend() {
    setState(() {
      toResendAgain = true;
    });

    const oneSec = Duration(seconds: 30);
    timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (start == 0) {
          start = 30;
          toResendAgain = false;
          timer.cancel();
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
