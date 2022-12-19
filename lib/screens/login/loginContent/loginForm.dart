// ignore_for_file: file_names, unused_import
import 'package:flutter/material.dart';
import 'package:shoppa_app/components/defaultButton.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/screens/home/homeScreen1.dart';
import 'package:shoppa_app/screens/home/homeScreen2.dart';
import 'package:shoppa_app/screens/resetPassword/resetPassword_screen.dart';
import '../../../constants/constants.dart';
import 'package:shoppa_app/components/formError.dart';
import '../../../constants/size_configurations.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formkey = GlobalKey<FormState>();
  late String email;
  late String password;
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
            Text("Email Address", style: regTextStyle),
            SizedBox(height: getPropHeight(8)),
            buildEmailField(),
            SizedBox(height: getPropHeight(16)),
            Text("Password", style: regTextStyle),
            SizedBox(height: getPropHeight(8)),
            buildPasswordField(),
            const Align(
              alignment: Alignment.centerRight,
              child: ForgotPassword(),
            ),
            SizedBox(height: getPropHeight(10)),
            FormError(errors: errors),
            SizedBox(height: getPropHeight(60)),
            DefaultButton(
              text: "Login",
              press: () {
                // if (_formkey.currentState!.validate()) {
                //   // Go to Home screen
                //   () {
                //     _formkey.currentState!.save();

                //   };
                // }
                Navigator.of(context).pushNamed(HomeScreen.routeName);
              },
            )
          ],
        ));
  }

  TextFormField buildEmailField() {
    return TextFormField(
        onSaved: (newValue) => email = newValue!,
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(emailNullError)) {
            setState(() {
              errors.remove(emailNullError);
            });
          } else if (emailValidatorRegExp.hasMatch(value) &&
              errors.contains(invalidEmailError)) {
            setState(() {
              errors.remove(invalidEmailError);
            });
          }
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(emailNullError)) {
            setState(() {
              errors.add(emailNullError);
            });
            return "";
          } else if (!emailValidatorRegExp.hasMatch(value) &&
              !errors.contains(invalidEmailError)) {
            setState(() {
              errors.add(invalidEmailError);
            });
            return "";
          }
          return null;
        },
        keyboardType: TextInputType.text,
        decoration: textFieldDecoration('Enter Email Address'));
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
          // else if (value.length >= 8) {
          //   setState(() {
          //     removeError(error: shortPassError);
          //   });
          // }
          password = value;
        },
        validator: (value) {
          if (value!.isEmpty) {
            setState(() {
              addError(error: passNullError);
            });
            return "";
          }
          // else if (value.length < 8) {
          //   setState(() {
          //     addError(error: shortPassError);
          //   });
          //   return "";
          // }
          return null;
        },
        obscureText: true,
        keyboardType: TextInputType.text,
        decoration: textFieldDecoration('Enter Password'));
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed(ResetPasswordScreen.routeName);
        },
        child: const Text(
          "Forgot Password?",
          style: TextStyle(
              color: primaryColor, fontSize: 14, fontWeight: FontWeight.w400),
        ));
  }
}
