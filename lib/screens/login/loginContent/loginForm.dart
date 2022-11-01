// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/components/defaultButton.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/screens/resetPassword/resetPassword_screen.dart';
import '../../../constants/constants.dart';
import 'package:shoppa_app/components/formError.dart';

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
            Text("Email Address", style: fieldDesTextStyle()),
            buildEmailField(),
            const SizedBox(height: 25),
            Text("Password", style: fieldDesTextStyle()),
            buildPasswordField(),
            const Align(
              alignment: Alignment.centerRight,
              child: ForgotPassword(),
            ),
            const SizedBox(height: 10),
            FormError(errors: errors),
            const SizedBox(height: 50),
            DefaultButton(
              text: "Login",
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
