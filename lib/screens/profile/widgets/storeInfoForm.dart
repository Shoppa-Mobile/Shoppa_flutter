// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/widgets/defaultButton.dart';
import 'package:shoppa_app/widgets/formError.dart';

class StoreInfoForm extends StatefulWidget {
  const StoreInfoForm({super.key});

  @override
  State<StoreInfoForm> createState() => _StoreInfoFormState();
}

class _StoreInfoFormState extends State<StoreInfoForm> {
  final _formkey = GlobalKey<FormState>();
  late String storeAddress;
  late int storeNum;
  late String storeName;
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
            Text(
              "Store Name",
              style: regTextStyle,
            ),
            SizedBox(height: getPropHeight(8)),
            buildStoreNameField(),
            SizedBox(height: getPropHeight(16)),
            Text(
              "Store Address",
              style: regTextStyle,
            ),
            SizedBox(height: getPropHeight(8)),
            buildStoreAddressField(),
            SizedBox(height: getPropHeight(16)),
            Text(
              "Store Phone Number",
              style: regTextStyle,
            ),
            SizedBox(height: getPropHeight(8)),
            buildStoreNumField(),
            SizedBox(height: getPropHeight(10)),
            FormError(errors: errors),
            SizedBox(height: getPropHeight(120)),
            DefaultButton(
              text: 'Update',
              press: () {
                Navigator.pop(context);
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

  TextFormField buildStoreNumField() {
    return TextFormField(
      onSaved: (newValue) => storeNum = newValue as int,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            removeError(error: storeNumNullError);
          });
        }
        storeNum = value as int;
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
      keyboardType: TextInputType.text,
    );
  }
}
