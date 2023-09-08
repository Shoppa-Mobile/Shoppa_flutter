// ignore_for_file: file_names
import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as devtools show log;
import 'package:shoppa_app/models/vendorModel.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

final sharedPreferencesProvider = FutureProvider<SharedPreferences>(
  (ref) async {
    return await SharedPreferences.getInstance();
  },
);

final myVendorProvider = FutureProvider.autoDispose<VendorModel>(
  (ref) async {
    final sharedPreferences = await ref.watch(sharedPreferencesProvider.future);
    final vendor = VendorModel.fromJson(
      json.decode(sharedPreferences.getString('user') ?? ''),
    );
    return vendor;
  },
);

final logoutVendorProvider = FutureProvider<bool>(
  (ref) async {
    final sharedPreferences = await ref.watch(sharedPreferencesProvider.future);
    await sharedPreferences.clear();
    return true;
  },
);

class VendorNotifier extends StateNotifier<VendorModel?> {
  VendorNotifier() : super(VendorModel.unknown());

  Future<VendorModel?> getVendor() async {
    final localStorage = await SharedPreferences.getInstance();
    final vendor = VendorModel.fromJson(
      json.decode(localStorage.getString('user') ?? ''),
    );
    state = vendor;
    return state;
  }

  void resetState() {
    state = VendorModel.unknown(); // Reset the state to its initial value
  }
}

class LogoutNotifier extends StateNotifier<bool?> {
  LogoutNotifier() : super(null);

  Future<bool> clearVendor() async {
    final localStorage = await SharedPreferences.getInstance();
    await localStorage.clear();
    return true;
  }
}

final vendorProvider =
    StateNotifierProvider.autoDispose<VendorNotifier, VendorModel?>((ref) {
  return VendorNotifier()..getVendor();
});

final logoutProvider = StateNotifierProvider<LogoutNotifier, bool?>(
  (ref) {
    return LogoutNotifier()..clearVendor();
  },
);
