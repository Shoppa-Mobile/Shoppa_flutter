// ignore_for_file: file_names
import 'package:flutter/foundation.dart' show immutable;
import 'package:shoppa_app/enums.dart';
import 'package:shoppa_app/models/userModel.dart';

@immutable
class AuthState {
  final AuthResult? result;
  final bool isLoading;
  final UserToken? userToken;

  const AuthState({
    required this.result,
    required this.isLoading,
    required this.userToken,
  });

  // Unknown state that is seen when app initially runs.
  const AuthState.unknown()
      : result = null,
        isLoading = false,
        userToken = null;

  AuthState copyWithIsLoading(bool isLoading) {
    return AuthState(
      result: result,
      isLoading: isLoading,
      userToken: userToken,
    );
  }

  @override
  bool operator ==(covariant AuthState other) =>
      identical(this, other) ||
      (result == other.result &&
          isLoading == other.isLoading &&
          userToken == other.userToken);

  @override
  int get hashCode => Object.hash(
        result,
        isLoading,
        userToken,
      );
}
