import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/providers/GlobalStateProvider.dart';
import 'package:shoppa_app/screens/auth/login/widgets/loginFormWidget.dart';
import 'package:shoppa_app/screens/auth/login/widgets/socialCard.dart';
import 'package:shoppa_app/widgets/loading.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/Login";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        bool loading = ref.watch(globalLoading);
        return Loading(
          isLoading: loading,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: bgColor,
            appBar: AppBar(
              elevation: 0,
            ),
            body:SafeArea(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getPropWidth(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: getPropHeight(15),
                        ),
                        Text("Login", style: headerStyle2),
                        SizedBox(
                          height: getPropHeight(49),
                        ),
                        const LoginForm(),
                        SizedBox(
                          height: getPropHeight(60),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                height: 1,
                                color: subTextColor,
                                margin: EdgeInsets.symmetric(
                                    horizontal: getPropWidth(12)),
                              )),
                              Text(
                                "Or Sign In with",
                                style: subHeaderStyle,
                              ),
                              Expanded(
                                  child: Container(
                                height: 1,
                                color: subTextColor,
                                margin: EdgeInsets.symmetric(
                                    horizontal: getPropWidth(12)),
                              )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: getPropHeight(16),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SocialCard(
                              icon: "assets/icons/facebook.svg",
                            ),
                            SocialCard(
                              icon: "assets/icons/google.svg",
                            ),
                            SocialCard(
                              icon: "assets/icons/instagram.svg",
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
