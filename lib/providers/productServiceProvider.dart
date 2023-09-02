// ignore_for_file: file_names
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoppa_app/models/productsModel.dart';
import 'package:shoppa_app/providers/AuthStateProvider.dart';
import 'dart:developer' as devtools show log;

import 'package:shoppa_app/services/ProductsServiceClass.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

final productService = Provider<ProductsAPI>((ref) {
  return const ProductsAPI();
});

final productsProvider = FutureProvider<List<ProductsModel>>((ref) async {
  final String authToken = ref.watch(authKeyProvider);
  final products = ref.watch(productService);

  return products.getProducts(authToken);
});

final refreshProductsProvider =
    Provider<void Function(AsyncValue<List<ProductsModel>>)>((ref) {
  return (productsAsyncValue) async {
    try {
      // Call ref.refresh() to trigger a refresh
      // ignore: unused_result
      ref.refresh(productsProvider);
      // Optionally, update the productsAsyncValue if it exists
      if (productsAsyncValue is AsyncData) {
        final refreshedData = await ref.watch(productsProvider.future);
        final refreshedAsyncValue =
            AsyncData<List<ProductsModel>>(refreshedData);
        productsAsyncValue = refreshedAsyncValue;
      }
    } catch (error) {
      // Handle error
    }
  };
});

