import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/screens/resetPassword/resetPasswordContent/resetPasswordForm.dart';

import '../../../constants/colors.dart';
import '../../../constants/size_configurations.dart';

class ResetPasswordContent extends StatefulWidget {
  const ResetPasswordContent({super.key});

  @override
  State<ResetPasswordContent> createState() => _ResetPasswordContentState();
}

class _ResetPasswordContentState extends State<ResetPasswordContent> {
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
              Text("Reset Password",
                  style: TextStyle(
                      color: headerTextColor,
                      fontFamily: 'Manrope',
                      fontSize: getPropHeight(24),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2.0)),
              const SizedBox(height: 8),
              Text('Put in your new password', style: subHeaderStyle),
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              const ResetPasswordForm()
            ],
          ),
        ));
  }
}
