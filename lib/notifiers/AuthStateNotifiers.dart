import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoppa_app/services/AuthServiceClass.dart';
import 'package:shoppa_app/states/AuthState.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final _authenticator = AuthApi();
  AuthStateNotifier() : super(const AuthState.unknown()) {
    
  }
}
