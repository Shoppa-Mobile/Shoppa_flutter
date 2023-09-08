// ignore_for_file: file_names
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

final colorListProvider = StateProvider<List<Color>>(
  (ref) => [],
);

final readColorList = FutureProvider<List<Color>>(
  (ref) async {
    final colorList = ref.watch(colorListProvider);
    return colorList;
  },
);

final refreshColorList =
    Provider<void Function(AsyncValue<List<Color>>)>((ref) {
  return (colorAsyncValue) async {
    try {
      // ignore: unused_result
      ref.refresh(readColorList);
      if (colorAsyncValue is AsyncData) {
        final refreshedData = await ref.watch(readColorList.future);
        final refreshedAsyncValue = AsyncData<List<Color>>(refreshedData);
        colorAsyncValue = refreshedAsyncValue;
      }
    } catch (error) {
      // handle error
    }
  };
});
