import 'package:flutter/material.dart';
import 'package:shoppa_app/components/defaultButton.dart';
import 'package:shoppa_app/screens/login/login_screen.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../constants/size_configurations.dart';

List<Map<String, String>> onBoardingData = [
  {
    'text1': "Manage your customers, in one app.",
    'text2':
        "No more juggling between multiple social media, Shoppa gives you access to manage your inventory and customers.",
    'buttontext': "Get Started",
    'image': 'assets/images/Onboarding_img_1.png'
  },
  {
    'text1': "Your personal store, a link just for you.",
    'text2':
        "Have all your products in one page, share your product page and have your customers enjoy shopping better.",
    'buttontext': "Get Started",
    'image': 'assets/images/Onboarding_img_2.png'
  },
  {
    'text1': "Get Started",
    'text2': '',
    'buttontext': "Sign Up",
    'image': 'assets/images/Onboarding_img_3.png'
  }
];

class OnboardingContent extends StatefulWidget {
  const OnboardingContent({
    super.key,
    required this.text1,
    required this.text2,
    required this.buttonText,
    required this.image,
    required this.press,
  });

  final String text1, text2, buttonText, image;
  final GestureTapCallback press;

  @override
  State<OnboardingContent> createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<OnboardingContent> {
  int currentPage = 0;
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
            top: 480,
            child: Container(
              // height: MediaQuery.of(context).size.height * 0.4,
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
                    height: getPropWidth(24),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(onBoardingData.length,
                        (index) => buildDot(index: index)),
                  ),
                  SizedBox(
                    height: getPropWidth(24),
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
                    height: getPropWidth(10),
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

  AnimatedContainer buildDot({required int index}) {
    int currentPage = 0;
    return AnimatedContainer(
      duration: animationduration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 10 : 6,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: currentPage == index ? primaryColor : lightPrimaryColor),
    );
  }
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
