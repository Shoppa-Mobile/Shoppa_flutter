import 'package:flutter/material.dart';
import 'package:shoppa_app/screens/login/login_screen.dart';
import 'package:shoppa_app/screens/onboarding/onboarding_screen.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../constants/size_configurations.dart';
import '../../widgets/defaultButton.dart';
import 'package:dots_indicator/dots_indicator.dart';

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
    return SingleChildScrollView(
      child: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(color: bgColor),
          ),
          Image.asset(widget.image, fit: BoxFit.fill),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.6,
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
                    height: getPropWidth(20),
                  ),
                  buildDotIndicator(widget.currentIndex),
                  SizedBox(
                    height: getPropWidth(20),
                  ),
                  Text(
                    widget.text1,
                    style: headerStyle,
                  ),
                  SizedBox(
                    height: getPropWidth(8),
                  ),
                  Text(widget.text2, style: subHeaderStyle),
                  SizedBox(
                    height: getPropWidth(14),
                  ),
                  DefaultButton(text: widget.buttonText, press: widget.press),
                  SizedBox(
                    height: getPropWidth(20),
                  ),
                  const LoginWidget(),
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
      activeSize: const Size(12, 6),
      activeShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
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
        Text(
          "Already have an account?",
          style: TextStyle(
            color: headerTextColor,
            fontFamily: 'Lato',
            fontSize: getPropHeight(16),
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
            child: Text('Login',
                style: TextStyle(
                    color: secondaryButtonTextColor,
                    fontFamily: 'Lato',
                    fontSize: getPropHeight(16),
                    fontWeight: FontWeight.w400)))
      ],
    );
  }
}
