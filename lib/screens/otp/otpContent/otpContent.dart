import 'package:flutter/material.dart';
import 'package:shoppa_app/components/defaultButton.dart';
import 'package:shoppa_app/constants/constants.dart';
import '../../../constants/colors.dart';
import '../../../constants/size_configurations.dart';
import 'otpForm.dart';

class OtpContent extends StatelessWidget {
  const OtpContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropWidth(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.06,
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
                height: getPropHeight(21),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    Text(
                      "Didn't get an OTP?",
                      style: subHeaderStyle,
                    ),
                    buildTimer()
                  ],
                ),
              ),
              SizedBox(
                height: getPropHeight(95),
              ),
              DefaultButton(
                text: "Next",
                press: () {},
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
        ));
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
}

Row buildTimer() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Retry in ",
        style: TextStyle(color: headerTextColor, fontSize: getPropHeight(16)),
      ),
      TweenAnimationBuilder(
        tween: IntTween(begin: 5, end: 0),
        duration: const Duration(seconds: 5), // because we allow 30 secs
        builder: (context, value, child) => Text(
          ("$value secs"),
          style: TextStyle(color: headerTextColor, fontSize: getPropHeight(16)),
        ),
        onEnd: () {},
      ),
    ],
  );
}
