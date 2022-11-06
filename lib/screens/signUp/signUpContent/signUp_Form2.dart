// ignore_for_file: file_names
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shoppa_app/components/defaultButton.dart';
import 'package:shoppa_app/components/formError.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/screens/otp/otpScreen.dart';
import '../../../constants/size_configurations.dart';

class SignUpForm2 extends StatefulWidget {
  const SignUpForm2({super.key});

  @override
  State<SignUpForm2> createState() => _SignUpForm2State();
}

class _SignUpForm2State extends State<SignUpForm2> {
  final _formkey = GlobalKey<FormState>();
  late String storeName;
  late String storeAddress;
  late String storeNum;
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
            Text("Store Name", style: regTextStyle),
            SizedBox(height: getPropHeight(8)),
            buildStoreNameField(),
            SizedBox(height: getPropHeight(20)),
            Text(
              "Store Address",
              style: regTextStyle,
            ),
            SizedBox(height: getPropHeight(8)),
            buildStoreAddressField(),
            SizedBox(height: getPropHeight(20)),
            Text(
              "Store Phone Number",
              style: regTextStyle,
            ),
            SizedBox(height: getPropHeight(8)),
            buildStoreNumberField(),
            SizedBox(height: getPropHeight(20)),
            Text(
              "Password",
              style: regTextStyle,
            ),
            SizedBox(height: getPropHeight(8)),
            buildPasswordField(),
            SizedBox(height: getPropHeight(10)),
            FormError(errors: errors),
            SizedBox(height: getPropHeight(35)),
            DefaultButton(
              text: "Create Account",
              press: () {
                // if (_formkey.currentState!.validate()) {
                //   // Go to Otp Screen
                //   () {
                //     _formkey.currentState!.save();
                //     Navigator.of(context).pushNamed(OtpScreen.routeName);
                //   };
                // }
                _formkey.currentState!.save();
                Navigator.of(context)
                    .pushNamed(OtpScreen.routeName, arguments: storeNum);
              },
            )
          ],
        ));
  }

  TextFormField buildStoreNameField() {
    return TextFormField(
      onSaved: (newValue) => storeName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            removeError(error: storeNameNullError);
          });
        }
        storeName = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            addError(error: storeNameNullError);
          });
          return "";
        }
        return null;
      },
      decoration: textFieldDecoration("Enter Store Name"),
      keyboardType: TextInputType.text,
    );
  }

  TextFormField buildStoreAddressField() {
    return TextFormField(
      onSaved: (newValue) => storeAddress = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            removeError(error: addressNullError);
          });
        }
        storeAddress = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            addError(error: addressNullError);
          });
          return "";
        }
        return null;
      },
      decoration: textFieldDecoration("Enter Store Address"),
      keyboardType: TextInputType.text,
    );
  }

  TextFormField buildStoreNumberField() {
    return TextFormField(
      onSaved: (newValue) => storeNum = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            removeError(error: storeNumNullError);
          });
        }
        storeNum = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            addError(error: storeNumNullError);
          });
          return "";
        }
        return null;
      },
      decoration: textFieldDecoration("Enter Store Phone Number"),
      keyboardType: TextInputType.number,
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
        onSaved: (newValue) => password = newValue!,
        onChanged: (value) {
          if (value.isNotEmpty) {
            setState(() {
              removeError(error: passNullError);
            });
          } else if (value.length >= 8) {
            setState(() {
              removeError(error: shortPassError);
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
          } else if (value.length < 8) {
            setState(() {
              addError(error: shortPassError);
            });
            return "";
          }
          return null;
        },
        obscureText: true,
        keyboardType: TextInputType.text,
        decoration: textFieldDecoration('Enter Password'));
  }
}
