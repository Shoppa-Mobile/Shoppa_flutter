import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/screens/login/loginContent/loginForm.dart';
import '../../../components/socialCard.dart';
import '../../../constants/constants.dart';
import '../../../constants/size_configurations.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
              Text("Login",
                  style: TextStyle(
                    color: headerTextColor,
                    fontFamily: 'Manrope',
                    fontSize: getPropHeight(24),
                    fontWeight: FontWeight.w700,
                  )),
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              const LoginForm(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Or Sign In with",
                    style: subHeaderStyle,
                  )
                ],
              ),
              const SizedBox(
                height: 16,
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
        ));
  }
}
