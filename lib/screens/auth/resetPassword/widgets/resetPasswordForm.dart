// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/screens/home/homeScreen.dart';
import 'package:shoppa_app/widgets/defaultButton.dart';
import 'package:shoppa_app/widgets/formError.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _formkey = GlobalKey<FormState>();
  String? password;
  String? confirmpassword;
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
            Text("New Password", style: regTextStyle),
            SizedBox(height: getPropHeight(8)),
            buildPasswordField(),
            SizedBox(height: getPropHeight(16)),
            Text("Confirm Password", style: regTextStyle),
            SizedBox(height: getPropHeight(8)),
            buildConfirmPasswordField(),
            SizedBox(height: getPropHeight(16)),
            FormError(errors: errors),
            SizedBox(height: getPropHeight(117)),
            DefaultButton(
              text: "Reset Password",
              press: () {
                if (_formkey.currentState!.validate()) {
                  if (password == confirmpassword) {
                    ConstantFunction.showSuccessDialog(
                        context,
                        "Your password has been reset successfully",
                        () => Navigator.of(context)
                            .pushNamed(HomeScreen.routeName));
                  }
                  _formkey.currentState!.save();
                } else {
                  if (password != confirmpassword) {
                    ConstantFunction.showFailureDialog(
                        context,
                        "Place a message here, not sure what yet",
                        () => Navigator.of(context).pop(),);
                  }
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
