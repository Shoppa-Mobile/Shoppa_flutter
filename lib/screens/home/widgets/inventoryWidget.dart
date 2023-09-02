// ignore_for_file: file_names, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/models/productsModel.dart';
import 'package:shoppa_app/providers/AuthStateProvider.dart';
import 'package:shoppa_app/providers/GlobalStateProvider.dart';
import 'package:shoppa_app/providers/productServiceProvider.dart';
import 'package:shoppa_app/screens/shop/uploadProductScreen.dart';
import 'package:shoppa_app/services/ProductsServiceClass.dart';
import 'package:shoppa_app/widgets/inventoryItemCard.dart';
import 'package:shoppa_app/screens/shop/itemDisplayScreen.dart';

class Inventory2 extends StatelessWidget {
  const Inventory2({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsAPI productService = const ProductsAPI();

    return Consumer(
      builder: (context, ref, child) {
        final productsAsyncValue = ref.watch(productsProvider);
        final refreshProducts = ref.read(refreshProductsProvider);
        Future<bool> deleteProduct(int productID, String authToken,
            AsyncValue<List<ProductsModel>> productsAsyncValue) async {
          try {
            // Perform the deletion operation here
            int response =
                await productService.deleteProduct(productID, authToken);
            if (response == 200) {
              refreshProducts(productsAsyncValue);
              return true;
            } else {
              return false;
            }
          } catch (error) {
            // Handle error
            debugPrint(error.toString());
            return false;
          }
        }

        return productsAsyncValue.when(
          data: (products) {
            if (products.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/inventory.png'),
                    SizedBox(
                      height: getPropHeight(5),
                    ),
                    Center(
                      child: Text(
                        'Nothing to see here yet, \n Check your Internet connection or Contact your Admin',
                        style: regTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: regularTextColor.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getPropHeight(230),
                  width: double.infinity,
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(right: 10),
                      itemCount: products.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.only(right: getPropWidth(10)),
                            child: InventoryCard(
                              goodsImage: products[index].goodsImage[0],
                              goodsName: products[index].productName,
                              price: products[index].productPrice.toString(),
                              homeColor: true,
                              press1: () {
                                Navigator.of(context)
                                    .pushNamed(ItemDisplayScreen.routeName);
                              },
                              press2: () async {
                                Navigator.pop(context);
                                ref.read(globalLoading.notifier).state = true;
                                String authToken = ref.read(authKeyProvider);
                                int productID = products[index].productID;
                                try {
                                  bool response = await deleteProduct(
                                      productID, authToken, productsAsyncValue);
                                  if (response == true) {
                                    ref.read(globalLoading.notifier).state =
                                        false;
                                    await ConstantFunction.showSuccessDialog(
                                      context,
                                      'Item successfully deleted',
                                      () {
                                        Navigator.pop(context);
                                      },
                                    );
                                  } else {
                                    ref.read(globalLoading.notifier).state =
                                        false;
                                    await ConstantFunction.showFailureDialog(
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
                            ));
                      }),
                )
              ],
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
            debugPrintStack(stackTrace: stackTrace);
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
                  SizedBox(
                    height: getPropHeight(5),
                  ),
                  SizedBox(
                    width: getPropWidth(210),
                    height: getPropHeight(40),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: primaryColor,
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(UploadProductScreen.routeName);
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
                ],
              ),
            );
          },
        );
      },
    );
  }
}
