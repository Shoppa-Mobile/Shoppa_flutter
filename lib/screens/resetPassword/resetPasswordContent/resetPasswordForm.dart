import 'package:flutter/material.dart';
import 'package:shoppa_app/components/defaultButton.dart';
import 'package:shoppa_app/components/formError.dart';

import '../../../constants/constants.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _formkey = GlobalKey<FormState>();
  late String password;
  late String confirmpassword;
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
            Text("New Password", style: fieldDesTextStyle()),
            const SizedBox(height: 8),
            buildPasswordField(),
            const SizedBox(height: 35),
            Text("Confirm Password", style: fieldDesTextStyle()),
            const SizedBox(height: 8),
            buildConfirmPasswordField(),
            const SizedBox(height: 16),
            FormError(errors: errors),
            const SizedBox(height: 50),
            DefaultButton(
              text: "Reset Password",
              press: () {
                if (_formkey.currentState!.validate()) {
                  // Go to Home screen
                  () {};
                }
              },
            )
          ],
        ));
  }

  TextFormField buildPasswordField() {
    return TextFormField(
        onSaved: (newValue) => password = newValue!,
        onChanged: (value) {
          if (value.isNotEmpty) {
            setState(() {
              removeError(error: passNullError);
            });
          }
          password = value;
        },
        validator: (value) {
          if (value!.isEmpty) {
            setState(() {
              addError(error: passNullError);
            });
            return "";
          }
          return null;
        },
        obscureText: true,
        keyboardType: TextInputType.text,
        decoration: textFieldDecoration('Enter New Password'));
  }

  TextFormField buildConfirmPasswordField() {
    return TextFormField(
        onSaved: (newValue) => confirmpassword = newValue!,
        onChanged: (value) {
          if (value.isNotEmpty) {
            setState(() {
              removeError(error: passNullError);
            });
          }
          confirmpassword = value;
        },
        validator: (value) {
          if (value!.isEmpty) {
            setState(() {
              addError(error: passNullError);
            });
            return "";
          }
          return null;
        },
        obscureText: true,
        keyboardType: TextInputType.text,
        decoration: textFieldDecoration('Re-Enter New Password'));
  }
}
