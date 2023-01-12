import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/screens/auth/login/loginContent/loginForm.dart';
import 'package:shoppa_app/widgets/socialCard.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Container(
                        height: 1,
                        color: subTextColor,
                        margin:
                            EdgeInsets.symmetric(horizontal: getPropWidth(12)),
                      )),
                      Text(
                        "Or Sign In with",
                        style: subHeaderStyle,
                      ),
                      Expanded(
                          child: Container(
                        height: 1,
                        color: subTextColor,
                        margin:
                            EdgeInsets.symmetric(horizontal: getPropWidth(12)),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: getPropHeight(16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
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
          )),
    );
  }
}
