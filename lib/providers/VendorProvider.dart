// ignore_for_file: file_names
import 'dart:convert';
// import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as devtools show log;
import 'package:shoppa_app/models/vendorModel.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

final sharedPreferencesProvider =
    FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

final myVendorProvider = FutureProvider<VendorModel>((ref) async {
  final sharedPreferences = await ref.watch(sharedPreferencesProvider.future);
  return VendorModel.fromJson(
      json.decode(sharedPreferences.getString('user') ?? ''),);
});
