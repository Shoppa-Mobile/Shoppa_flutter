// ignore_for_file: file_names
import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppa_app/models/userModel.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

class UserStateProvider extends StateNotifier<UserModel> {
  // final _authenticator = const AuthApi();

  UserStateProvider([UserModel? state]) : super(UserModel.unknown());

  Future<void> saveCurrentUser(Map user) async {
    Box userBox = await Hive.openBox<UserModel>('user');
    await userBox.add(user);
  }

  Future<void> saveUserToken(String token) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString(
      'token',
      token,
    );
    // getUserToken();
    // localStorage.log();
  }

  Future<String?> getUserToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return token!;
  }

  Future<void> deleteUserToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('token');
  }
}

final userProvider = StateNotifierProvider(
  (ref) => UserStateProvider(),
);
