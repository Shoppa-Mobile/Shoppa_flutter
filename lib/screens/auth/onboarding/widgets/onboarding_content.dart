import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/dummyData/all_dummy_data.dart';
import 'package:shoppa_app/screens/auth/login/login_screen.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:shoppa_app/widgets/defaultButton.dart';

class OnboardingContent extends StatefulWidget {
  const OnboardingContent(
      {super.key,
      required this.text1,
      required this.text2,
      required this.buttonText,
      required this.image,
      required this.press,
      required this.currentIndex});

  final String text1, text2, buttonText, image;
  final GestureTapCallback press;
  final double currentIndex;

  @override
  State<OnboardingContent> createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<OnboardingContent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(color: bgColor),
          ),
          Image.asset(
            widget.image,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.56,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: getPropWidth(20)),
              decoration: const BoxDecoration(
                  color: bgColor,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(35))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getPropWidth(10),
                  ),
                  buildDotIndicator(widget.currentIndex),
                  SizedBox(
                    height: getPropWidth(10),
                  ),
                  Text(
                    widget.text1,
                    style: headerStyle,
                  ),
                  SizedBox(
                    height: getPropWidth(5),
                  ),
                  Text(widget.text2, style: subHeaderStyle),
                  SizedBox(
                    height: getPropWidth(10),
                  ),
                  DefaultButton(text: widget.buttonText, press: widget.press),
                  SizedBox(
                    height: getPropWidth(5),
                  ),
                  const LoginWidget(),
                  SizedBox(
                    height: getPropWidth(35),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

buildDotIndicator(double currentIndex) {
  return DotsIndicator(
    dotsCount: onBoardingData.length,
    axis: Axis.horizontal,
    reversed: false,
    key: UniqueKey(),
    position: currentIndex,
    decorator: DotsDecorator(
      color: lightPrimaryColor,
      activeColor: primaryColor,
      size: const Size.square(6),
      activeSize: const Size(8, 6),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0),
      ),
    ),
  );
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account?",
          style: TextStyle(
            color: headerTextColor,
            fontFamily: 'Lato',
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, LoginScreen.routeName);
          },
          child: const Text(
            'Login',
            style: TextStyle(
                color: secondaryButtonTextColor,
                fontFamily: 'Lato',
                fontSize: 16,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
