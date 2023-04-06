// ignore_for_file: file_names
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

class AuthStateProvider extends StateNotifier<bool> {
  AuthStateProvider(bool state) : super(false);

  setCurrentUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = localStorage.getString('user');
    user?.log();
    // ignore: unnecessary_null_comparison
    if (user != null) {
      state = true;
    } else {
      state = false;
    }
    return state;
  }

  clearCurrentUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    await localStorage.remove('user');
    await localStorage.remove('token');
    state = false;
  }
}

final authProvider = StateNotifierProvider<AuthStateProvider, bool>(
  (ref) => AuthStateProvider(false),
);
