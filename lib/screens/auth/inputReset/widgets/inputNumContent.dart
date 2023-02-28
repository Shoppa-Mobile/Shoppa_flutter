// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/screens/auth/inputReset/widgets/inputNumForm.dart';

class InputNumberContent extends StatefulWidget {
  const InputNumberContent({super.key});

  @override
  State<InputNumberContent> createState() => _InputNumberContentState();
}

class _InputNumberContentState extends State<InputNumberContent> {
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
                Text("Reset Password", style: headerStyle2),
                SizedBox(height: getPropHeight(16)),
                Text('Put in the phone Number you used to register to have an OTP sent to you.', style: subHeaderStyle),
                SizedBox(
                  height: getPropHeight(61),
                ),
                const InputNumberForm()
              ],
            ),
          )),
    );
  }
}
