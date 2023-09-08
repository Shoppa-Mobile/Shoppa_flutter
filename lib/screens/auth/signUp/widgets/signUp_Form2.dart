// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/models/screenArguments.dart';
import 'package:shoppa_app/providers/AuthStateProvider.dart';
import 'package:shoppa_app/providers/GlobalStateProvider.dart';
import 'package:shoppa_app/providers/VendorProvider.dart';
import 'package:shoppa_app/screens/home/homeScreen.dart';
import 'package:shoppa_app/services/AuthServiceClass.dart';
import 'package:shoppa_app/widgets/defaultButton.dart';
import 'package:shoppa_app/widgets/formError.dart';
import 'package:shoppa_app/constants/constants.dart';

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
    final args =
        ModalRoute.of(context)!.settings.arguments as UserData1Arguments;
    return Consumer(
      builder: (context, ref, child) {
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
                text: "View Store",
                press: () async {
                  // Register User
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    var user = {
                      'first_name': args.firstName,
                      'last_name': args.lastName,
                      'phone': args.phoneNum,
                      'email': args.email,
                      'store_name': storeName,
                      'store_address': storeAddress,
                      'store_phone_number': storeNum,
                      'password': password,
                    };
                    ref.read(globalLoading.notifier).state = true;
                    try {
                      int response = await const AuthApi().registerUser(
                        user,
                        '/vendor/register',
                      );
                      if (response == 201) {
                        int status = await const AuthApi().loginUser(
                          {
                            'email': args.email,
                            'password': password,
                          },
                          '/auth/login',
                        );
                        // ignore: unnecessary_null_comparison
                        if (status == 200) {
                          ref.read(globalLoading.notifier).state = false;
                          ref.read(authProvider.notifier).setCurrentUser();
                          // ignore: use_build_context_synchronously
                          await ConstantFunction.showSuccessDialog(context,
                              'Vendor successfully created, proceed to Home',
                              () {
                            ref.read(vendorProvider.notifier).getVendor();
                            Navigator.of(context).pushReplacementNamed(
                              HomeScreen.routeName,
                            );
                          });
                        }
                        if (status == 422) {
                          ref.read(globalLoading.notifier).state = false;
                          // ignore: use_build_context_synchronously
                          await ConstantFunction.showFailureDialog(
                            context,
                            'Invalid Credentials, Unable to Sign In after creating vendor... \n Try again...',
                            () {
                              Navigator.pop(context);
                            },
                          );
                        }
                      } else {
                        ref.read(globalLoading.notifier).state = false;
                        // ignore: use_build_context_synchronously
                        await ConstantFunction.showFailureDialog(
                          context,
                          'Invalid Credentials, Unable to Create Vendor...',
                          () {
                            Navigator.pop(context);
                          },
                        );
                      }
                    } catch (e) {
                      ref.read(globalLoading.notifier).state = false;
                      var error = e.toString();
                      debugPrint(error);
                      await ConstantFunction.showFailureDialog(
                        context,
                        'Invalid Credentials, Unable to Create Vendor... \n Error: $error',
                        () {
                          Navigator.pop(context);
                        },
                      );
                    }
                  }
                },
              )
            ],
          ),
        );
      },
    );
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
