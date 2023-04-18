// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/providers/AuthStateProvider.dart';
import 'package:shoppa_app/providers/GlobalStateProvider.dart';
import 'package:shoppa_app/screens/auth/authScreen.dart';

class LogOutCard extends StatelessWidget {
  const LogOutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        context;
        return InkWell(
          onTap: () async {
            ref.read(globalLoading.notifier).state = true;
            await ref.read(authProvider.notifier).clearCurrentUser();
            final localStorage = await SharedPreferences.getInstance();
            final loggedOut = await localStorage.clear();
            resetState();
            ref.read(globalLoading.notifier).state = false;
            debugPrint(loggedOut.toString());
            if (loggedOut == true) {
              // ignore: use_build_context_synchronously
              Navigator.pushReplacementNamed(
                context,
                AuthenticationScreen.routeName,
              );
            } else {
              // ignore: use_build_context_synchronously
              ConstantFunction.showFailureDialog(
                context,
                'Unable to Log out, Try again...',
                () {
                  Navigator.pop(context);
                },
              );
            }
          },
          child: Card(
            color: ordersCardColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: SizedBox(
              height: getPropHeight(56),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getPropHeight(9), horizontal: getPropWidth(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/logout_icon.svg',
                      color: deleteIconColor,
                    ),
                    SizedBox(
                      width: getPropWidth(12),
                    ),
                    Text(
                      "Log Out",
                      style: regTextStyle2.copyWith(
                        color: deleteIconColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// Reset state when user logs out
void resetState() {
  ProviderContainer().dispose();
}
