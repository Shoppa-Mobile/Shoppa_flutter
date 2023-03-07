// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/widgets/defaultButton.dart';
import 'package:shoppa_app/widgets/formError.dart';

class SecurityInfoForm extends StatefulWidget {
  const SecurityInfoForm({super.key});

  @override
  State<SecurityInfoForm> createState() => _SecurityInfoFormState();
}

class _SecurityInfoFormState extends State<SecurityInfoForm> {
  final _formkey = GlobalKey<FormState>();
  late String oldPassword, newPassword, confirmPassword;
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
          Text("Enter Old Password", style: regTextStyle),
          SizedBox(height: getPropHeight(8)),
          buildOldPasswordField(),
          SizedBox(
            height: getPropHeight(16),
          ),
          Text("Enter New Password", style: regTextStyle),
          SizedBox(height: getPropHeight(8)),
          buildNewPasswordField(),
          SizedBox(
            height: getPropHeight(16),
          ),
          Text("Confirm New Password", style: regTextStyle),
          SizedBox(height: getPropHeight(8)),
          buildConfirmPasswordField(),
          SizedBox(
            height: getPropHeight(10),
          ),
          FormError(errors: errors),
          SizedBox(
            height: getPropHeight(120),
          ),
          DefaultButton(
            text: 'Update',
            press: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  TextFormField buildOldPasswordField() {
    return TextFormField(
      onSaved: (newValue) => oldPassword = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            removeError(error: passNullError);
          });
        }
        oldPassword = value;
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
      decoration: textFieldDecoration("Enter Old Password"),
      keyboardType: TextInputType.text,
    );
  }

  TextFormField buildNewPasswordField() {
    return TextFormField(
      onSaved: (newValue) => newPassword = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            removeError(error: passNullError);
          });
        }
        newPassword = value;
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
      decoration: textFieldDecoration("Enter New Password"),
      keyboardType: TextInputType.text,
    );
  }

  TextFormField buildConfirmPasswordField() {
    return TextFormField(
      onSaved: (newValue) => confirmPassword = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            removeError(error: passNullError);
          });
        }
        if (confirmPassword == newPassword) {
          setState(() {
            removeError(error: passMatchError);
          });
        }
        confirmPassword = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            addError(error: passNullError);
          });
          return '';
        }
        if (confirmPassword != newPassword) {
          setState(() {
            addError(error: passMatchError);
          });
          return "";
        }
        return null;
      },
      decoration: textFieldDecoration("Confirm New Password"),
      keyboardType: TextInputType.text,
    );
  }
}
