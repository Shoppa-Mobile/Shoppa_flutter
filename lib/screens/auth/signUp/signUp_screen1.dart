// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/providers/GlobalStateProvider.dart';
import 'package:shoppa_app/screens/auth/signUp/widgets/signUp_content1.dart';
import 'package:shoppa_app/widgets/loading.dart';

class SignUpScreen1 extends StatelessWidget {
  static String routeName = "/SignUp1";
  const SignUpScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        bool loading = ref.watch(globalLoading);
        return Loading(
          isLoading: loading,
          text: 'Creating Vendor Account...',
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: bgColor,
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: true,
              backgroundColor: bgColor,
              scrolledUnderElevation: 1.5,
              centerTitle: true,
              title: Text(
                'Create your account',
                style: headerStyle2.copyWith(fontSize: 20),
              ),
            ),
            body: const SafeArea(
              child: SignUpContent(),
            ),
          ),
        );
      },
    );
  }
}
