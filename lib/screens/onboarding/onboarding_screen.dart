// ignore_for_file: unused_local_variable
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shoppa_app/screens/onBoarding/onboarding_content.dart';
import 'package:shoppa_app/screens/signUp/signUp_screen1.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';

class OnBoardingScreen extends StatefulWidget {
  static String routeName = "/Onboarding";
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  int currentPage = 0;
  late Timer timer;
  PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        if (currentPage < 2) {
          currentPage++;
        } else {
          currentPage = 2;
        }
        pageController.animateToPage(currentPage,
            duration: const Duration(milliseconds: 550),
            curve: Curves.easeInOutCirc);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) => setState(() {
                  currentPage = value;
                }),
                controller: pageController,
                itemCount: onBoardingData.length,
                itemBuilder: (context, index) {
                  return OnboardingContent(
                    image: onBoardingData[index]['image'].toString(),
                    text1: onBoardingData[index]['text1'].toString(),
                    text2: onBoardingData[index]['text2'].toString(),
                    buttonText: onBoardingData[index]['buttontext'].toString(),
                    press: () {
                      pageController.animateToPage(currentPage = 2,
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.easeInOutCirc);
                      if (currentPage == 2) {
                        Navigator.of(context)
                            .pushNamed(SignUpScreen1.routeName);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }

  buildDot({required int index}) {
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
