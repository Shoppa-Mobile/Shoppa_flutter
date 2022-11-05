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
    return SingleChildScrollView(
      child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getPropWidth(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getPropHeight(27),
                ),
                Text("Reset Password", style: headerStyle2),
                SizedBox(height: getPropHeight(16)),
                Text('Put in your new password', style: subHeaderStyle),
                SizedBox(
                  height: getPropHeight(61),
                ),
                const ResetPasswordForm()
              ],
            ),
          )),
    );
  }
}
