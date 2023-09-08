// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/screens/auth/otp/otpScreen.dart';
import 'package:shoppa_app/widgets/defaultButton.dart';
import 'package:shoppa_app/widgets/formError.dart';

class InputNumberForm extends StatefulWidget {
  const InputNumberForm({super.key});

  @override
  State<InputNumberForm> createState() => _InputNumberFormState();
}

class _InputNumberFormState extends State<InputNumberForm> {
  final _formkey = GlobalKey<FormState>();
  String? phoneNumber;
  final List<String> errors = [];

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Phone Number", style: regTextStyle),
            SizedBox(height: getPropHeight(8)),
            buildPhoneNumField(),
            FormError(errors: errors),
            SizedBox(height: getPropHeight(117)),
            DefaultButton(
              text: "Get OTP",
              press: () {
                // if (_formkey.currentState!.validate()) {
                //   // Go to Home screen
                //   _formkey.currentState!.save();
                // }
                Navigator.of(context)
                    .pushNamed(OtpScreen.routeName, arguments: phoneNumber);
              },
            )
          ],
        ));
  }

  TextFormField buildPhoneNumField() {
    return TextFormField(
        onSaved: (newValue) => phoneNumber = newValue!,
        onChanged: (value) {
          if (value.isNotEmpty) {
            setState(() {
              removeError(error: phoneNumberNullError);
            });
          }
          phoneNumber = value;
        },
        validator: (value) {
          if (value!.isEmpty) {
            setState(() {
              addError(error: phoneNumberNullError);
            });
            return "";
          }
          return null;
        },
        obscureText: true,
        keyboardType: TextInputType.number,
        decoration: textFieldDecoration('Phone Number'));
  }
}
