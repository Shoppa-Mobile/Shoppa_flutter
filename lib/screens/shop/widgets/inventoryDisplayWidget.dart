// ignore_for_file: file_names, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/providers/AuthStateProvider.dart';
import 'package:shoppa_app/providers/GlobalStateProvider.dart';
import 'package:shoppa_app/screens/shop/uploadProductScreen.dart';
import 'package:shoppa_app/screens/shop/itemDisplayScreen.dart';
import 'package:shoppa_app/services/ProductsServiceClass.dart';
import 'package:shoppa_app/widgets/inventoryItemCard.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoppa_app/providers/productServiceProvider.dart';

import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

class InventoryDisplayWidget extends StatelessWidget {
  const InventoryDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsAPI productService = const ProductsAPI();
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: getPropWidth(220),
            height: getPropHeight(48),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: primaryColor,
              onPressed: () {
                Navigator.of(context).pushNamed(UploadProductScreen.routeName);
              },
              child: Text(
                " +  Add new Item ",
                style: whiteHeaderStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            height: getPropHeight(32),
          ),
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final productsAsyncValue = ref.watch(productsProvider);
                return productsAsyncValue.when(
                  data: (products) {
                    if (products.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'Unable to retrieve vendors products',
                                style: regTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: regularTextColor.withOpacity(0.4),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'Check your Internet connection or Contact your Admin',
                                style: regTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: regularTextColor.withOpacity(0.4),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisExtent: getPropHeight(200),
                                      childAspectRatio: 1.2,
                                      crossAxisSpacing: getPropWidth(15),
                                      mainAxisSpacing: getPropHeight(25)),
                              shrinkWrap: true,
                              controller: ScrollController(),
                              itemCount: products.length,
                              scrollDirection: Axis.vertical,
                              physics: const ScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InventoryCard(
                                  goodsImage:
                                      products[index].images.first.previewUrl,
                                  goodsName: products[index].productName,
                                  price:
                                      products[index].productPrice.toString(),
                                  homeColor: false,
                                  press1: () {
                                    Navigator.of(context)
                                        .pushNamed(ItemDisplayScreen.routeName);
                                  },
                                  press2: () async {
                                    Navigator.pop(context);
                                    ref.read(globalLoading.notifier).state =
                                        true;
                                    String authToken =
                                        ref.read(authKeyProvider);
                                    int productID = products[index].productID;
                                    try {
                                      int response = await productService
                                          .deleteProduct(productID, authToken);
                                      if (response == 200) {
                                        ref.read(globalLoading.notifier).state =
                                            false;
                                        await ConstantFunction
                                            .showSuccessDialog(
                                          context,
                                          'Item successfully deleted',
                                          () {
                                            ref.watch(productsProvider);
                                            Navigator.pop(context);
                                          },
                                        );
                                      } else {
                                        ref.read(globalLoading.notifier).state =
                                            false;
                                        await ConstantFunction
                                            .showFailureDialog(
                                          context,
                                          'Unable to delete Item, Check Internet Connection',
                                          () {
                                            Navigator.pop(context);
                                          },
                                        );
                                        debugPrint(response.toString());
                                      }
                                    } catch (e) {
                                      ref.read(globalLoading.notifier).state =
                                          false;
                                      await ConstantFunction.showFailureDialog(
                                        context,
                                        'Unable to delete Item, Check Internet Connection',
                                        () {
                                          Navigator.pop(context);
                                        },
                                      );
                                      debugPrint(e.toString());
                                    }
                                  },
                                );
                              })
                        ],
                      ),
                    );
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                      strokeWidth: 2.0,
                    ),
                  ),
                  error: (error, stackTrace) {
                    debugPrint(error.toString());
                    debugPrint(stackTrace.toString());
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/inventory.png'),
                          SizedBox(
                            height: getPropHeight(5),
                          ),
                          Text(
                            'Nothing to see here yet',
                            style: regTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: regularTextColor.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          )
        ]);
  }
}
