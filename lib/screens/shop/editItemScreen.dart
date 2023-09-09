// ignore_for_file: file_names, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/enums.dart';
import 'package:shoppa_app/models/productsModel.dart';
import 'package:shoppa_app/models/screenArguments.dart';
import 'package:shoppa_app/providers/AuthStateProvider.dart';
import 'package:shoppa_app/providers/GlobalStateProvider.dart';
import 'package:shoppa_app/providers/productServiceProvider.dart';
import 'package:shoppa_app/screens/shop/shopScreen.dart';
import 'package:shoppa_app/screens/shop/widgets/editProductForm.dart';
import 'package:shoppa_app/services/ProductsServiceClass.dart';
import 'package:shoppa_app/widgets/customNavBar.dart';
import 'package:shoppa_app/widgets/loading.dart';

class EditItemScreen extends StatelessWidget {
  const EditItemScreen({super.key});
  static String routeName = '/EditItemScreen';

  @override
  Widget build(BuildContext context) {
    ProductsAPI productService = const ProductsAPI();
    final args =
        ModalRoute.of(context)!.settings.arguments as ItemDisplayArguments;
    final List<String> dropdownitem = [
      'Delete from Inventory',
    ];
    return Consumer(
      builder: (context, ref, child) {
        bool loading = ref.watch(globalLoading);
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

        return Loading(
          isLoading: loading,
          text: 'Updating product...',
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: bgColor,
              elevation: 0.0,
              title: Text(
                'Edit Item',
                style: headerStyle3.copyWith(fontSize: 20),
              ),
              centerTitle: true,
              scrolledUnderElevation: 2.0,
              actions: [
                PopupMenuButton(
                  color: bgColor,
                  padding: EdgeInsets.only(
                      left: getPropWidth(30),
                      right: getPropWidth(10),
                      top: getPropHeight(23)),
                  position: PopupMenuPosition.under,
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        value: dropdownitem[0],
                        textStyle:
                            regTextStyle.copyWith(color: deleteIconColor),
                        child: TextButton(
                          onPressed: () async {
                            Navigator.pop(context);
                            ref.read(globalLoading.notifier).state = true;
                            String authToken = ref.read(authKeyProvider);
                            try {
                              bool response = await deleteProduct(
                                  args.productID,
                                  authToken,
                                  productsAsyncValue);
                              if (response == true) {
                                ref.read(globalLoading.notifier).state = false;
                                await ConstantFunction.showSuccessDialog(
                                  context,
                                  'Item successfully deleted',
                                  () {
                                    Navigator.pop(context);
                                    Navigator.pushReplacementNamed(
                                      context,
                                      ShopScreen.routeName,
                                    );
                                  },
                                );
                              } else {
                                ref.read(globalLoading.notifier).state = false;
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
                              ref.read(globalLoading.notifier).state = false;
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
                          child: Text(
                            dropdownitem[0],
                            style:
                                regTextStyle.copyWith(color: deleteIconColor),
                          ),
                        ),
                      ),
                    ];
                  },
                  child: const Icon(
                    Icons.more_vert,
                    size: 18,
                    color: regularTextColor,
                  ),
                ),
                SizedBox(
                  width: getPropWidth(15),
                )
              ],
            ),
            backgroundColor: bgColor,
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getPropWidth(18),
                    vertical: getPropHeight(20),
                  ),
                  child: const EditProductForm(),
                ),
              ),
            ),
            bottomNavigationBar:
                const CustomNavBar(selectedMenu: MenuState.shop),
          ),
        );
      },
    );
  }
}
