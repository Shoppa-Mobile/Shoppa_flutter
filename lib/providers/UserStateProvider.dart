// ignore_for_file: file_names
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoppa_app/models/userModel.dart';
import 'package:shoppa_app/services/AuthServiceClass.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

class UserStateProvider extends StateNotifier<UserModel> {
  final _authenticator = const AuthApi();
  UserStateProvider([UserModel? state]) : super(UserModel.unknown());

  // Future<UserModel> login(
  //   String email,
  //   String password,
  // ) async {
  //   final result = await _authenticator.loginUser(
  //     email,
  //     password,
  //   );
  //   return result;
  // }

  // Future<UserModel?> register(
  //   Map payload,
  // ) async {
  //   final result = await _authenticator.register(
  //     payload,
  //   );
  //   return result;
  // }

  // Future<void> saveCurrentUser(UserModel user) async {
  //   Box userBox = await Hive.openBox<UserModel>('user');
  //   // Box tokenBox = Hive.box('token');
  //   final result = await userBox.add(user);
  //   // await tokenBox.put(1, token);
  //   debugPrint('Saved current user: $result');
  //   // debugPrint(tokenBox.get('1'));
  //   state = user;
  // }
}

final userProvider = StateNotifierProvider(
  (ref) => UserStateProvider(),
);
