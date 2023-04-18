// ignore_for_file: file_names, unused_import
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/enums.dart';
import 'package:shoppa_app/models/vendorModel.dart';
import 'package:shoppa_app/providers/AuthStateProvider.dart';
import 'package:shoppa_app/providers/GlobalStateProvider.dart';
import 'package:shoppa_app/providers/VendorProvider.dart';
import 'package:shoppa_app/screens/auth/inputReset/inputNum_screen.dart';
import 'package:shoppa_app/services/AuthServiceClass.dart';
import 'package:shoppa_app/widgets/defaultButton.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/screens/home/homeScreen.dart';
import 'package:shoppa_app/screens/auth/resetPassword/resetPassword_screen.dart';
import 'package:shoppa_app/widgets/formError.dart';
import 'package:shoppa_app/widgets/loading.dart';
import 'dart:developer' as devtools show log;

@override
extension Log on Object {
  void log() => devtools.log(toString());
}

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
    return Consumer(
      builder: (context, ref, child) {
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
                  press: () async {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      ref.read(globalLoading.notifier).state = true;
                      try {
                        int status = await const AuthApi().loginUser(
                          {
                            'email': email,
                            'password': password,
                          },
                          '/auth/login',
                        );
                        // ignore: unnecessary_null_comparison
                        if (status == 200) {
                          ref.read(authProvider.notifier).setCurrentUser();
                          // ignore: use_build_context_synchronously
                          await ConstantFunction.showSuccessDialog(context,
                              'Vendor successfully logged in, proceed to Home',
                              () {
                            ref.read(vendorProvider.notifier).getVendor();
                            Navigator.of(context).pushReplacementNamed(
                              HomeScreen.routeName,
                            );
                          });
                          ref.read(globalLoading.notifier).state = false;
                        }
                        if (status == 422) {
                          ref.read(globalLoading.notifier).state = false;
                          // ignore: use_build_context_synchronously
                          await ConstantFunction.showFailureDialog(
                            context,
                            'Invalid Credentials, Cannot Sign In...',
                            () {
                              Navigator.pop(context);
                            },
                          );
                        }
                      } catch (e) {
                        ref.read(globalLoading.notifier).state = false;
                        var error = e.toString();
                        // log();
                        debugPrint(error);
                        await ConstantFunction.showFailureDialog(
                          context,
                          'Error Signing into your account,\n $error \n Please try again...',
                          () {
                            Navigator.pop(context);
                          },
                        );
                      }
                    }
                  },
                )
              ],
            ));
      },
    );
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
        Navigator.of(context).pushNamed(InputNumberScreen.routeName);
      },
      child: const Text(
        "Forgot Password?",
        style: TextStyle(
          color: primaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
