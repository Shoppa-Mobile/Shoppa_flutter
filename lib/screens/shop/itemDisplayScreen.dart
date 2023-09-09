// ignore_for_file: file_names, use_build_context_synchronously
import 'package:expandable/expandable.dart';
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
import 'package:shoppa_app/screens/shop/editItemScreen.dart';
import 'package:shoppa_app/screens/shop/shopScreen.dart';
import 'package:shoppa_app/services/ProductsServiceClass.dart';
import 'package:shoppa_app/widgets/customNavBar.dart';
import 'package:shoppa_app/widgets/loading.dart';

class ItemDisplayScreen extends StatelessWidget {
  const ItemDisplayScreen({super.key});
  static String routeName = '/ItemsDisplay';

  @override
  Widget build(BuildContext context) {
    ProductsAPI productService = const ProductsAPI();
    final args =
        ModalRoute.of(context)!.settings.arguments as ItemDisplayArguments;
    final List<String> dropdownitem = [
      'Edit Item',
      'Delete from Inventory',
    ];
    Color hexToColor(String hexString) {
      final buffer = StringBuffer();
      if (hexString.length == 6 || hexString.length == 7) {
        buffer.write('ff'); // Add alpha if it's not included in the hex string
      }
      buffer.write(hexString.replaceAll('#', ''));

      return Color(int.parse(buffer.toString(), radix: 16));
    }

    return Consumer(
      builder: (context, ref, child) {
        bool isLoading = ref.watch(globalLoading);
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
          isLoading: isLoading,
          text: 'Deleting product',
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: bgColor,
              elevation: 0,
              automaticallyImplyLeading: true,
              scrolledUnderElevation: 2.0,
            ),
            backgroundColor: bgColor,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getPropWidth(18),
                  vertical: getPropHeight(20),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            args.productName,
                            style: inventoryPriceText.copyWith(
                              color: regularTextColor,
                            ),
                          ),
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
                                  textStyle: regTextStyle,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(
                                        EditItemScreen.routeName,
                                        arguments: ItemDisplayArguments(
                                          productID: args.productID,
                                          productName: args.productName,
                                          productDescription:
                                              args.productDescription,
                                          productPrice: args.productPrice,
                                          images: args.images,
                                          colors: args.colors,
                                        ),
                                      );
                                    },
                                    child: Text(
                                      dropdownitem[0],
                                      style: regTextStyle,
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                  value: dropdownitem[0],
                                  textStyle: regTextStyle.copyWith(
                                      color: deleteIconColor),
                                  child: TextButton(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      ref.read(globalLoading.notifier).state =
                                          true;
                                      String authToken =
                                          ref.read(authKeyProvider);
                                      try {
                                        bool response = await deleteProduct(
                                            args.productID,
                                            authToken,
                                            productsAsyncValue);
                                        if (response == true) {
                                          ref
                                              .read(globalLoading.notifier)
                                              .state = false;
                                          await ConstantFunction
                                              .showSuccessDialog(
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
                                          ref
                                              .read(globalLoading.notifier)
                                              .state = false;
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
                                        await ConstantFunction
                                            .showFailureDialog(
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
                                      dropdownitem[1],
                                      style: regTextStyle.copyWith(
                                          color: deleteIconColor),
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
                          )
                        ],
                      ),
                      SizedBox(
                        height: getPropHeight(5),
                      ),
                      Text(
                        "${args.productPrice.toString()} NGN",
                        style: inventoryPriceText.copyWith(
                          color: regularTextColor,
                        ),
                      ),
                      SizedBox(
                        height: getPropHeight(30),
                      ),
                      Text(
                        'Available Colors',
                        style: inventoryPriceText.copyWith(
                          color: regularTextColor,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      SizedBox(
                        height: getPropHeight(10),
                      ),
                      (args.colors.isNotEmpty)
                          ? SizedBox(
                              height: getPropHeight(25),
                              width: getPropWidth(125),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: args.colors.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Container(
                                      width: getPropWidth(18),
                                      height: getPropHeight(18),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: hexToColor(
                                          args.colors[index],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: getPropHeight(25),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: regularTextColor.withOpacity(0.1),
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: ExpandablePanel(
                          collapsed: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              args.productDescription,
                              style: regTextStyle2.copyWith(fontSize: 14),
                            ),
                          ),
                          expanded: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              args.productDescription,
                              style: regTextStyle2.copyWith(fontSize: 14),
                            ),
                          ),
                          controller:
                              ExpandableController(initialExpanded: true),
                        ),
                      ),
                      SizedBox(
                        height: getPropHeight(30),
                      ),
                      (args.images.isEmpty)
                          ? Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset('assets/images/inventory.png'),
                                  SizedBox(
                                    height: getPropHeight(10),
                                  ),
                                  Text(
                                    'No product image uploaded',
                                    style: inventoryPriceText.copyWith(
                                      color: regularTextColor,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            )
                          : SizedBox(
                              height: getPropHeight(200),
                              width: double.infinity,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: args.images.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          right: getPropWidth(10)),
                                      child: Container(
                                        height: getPropHeight(180),
                                        width: getPropWidth(165),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(16),
                                            topRight: Radius.circular(16),
                                            bottomLeft: Radius.circular(16),
                                            bottomRight: Radius.circular(16),
                                          ),
                                        ),
                                        child: Image.network(
                                          args.images[index],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                      SizedBox(
                        height: getPropHeight(30),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Customer Feedback',
                            style: inventoryPriceText.copyWith(
                              color: regularTextColor,
                            ),
                          ),
                          Text(
                            'See all',
                            style: regTextStyle2.copyWith(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: getPropHeight(30),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset('assets/images/reviews.png'),
                            SizedBox(
                              height: getPropHeight(5),
                            ),
                            Text(
                              'You have no reviews yet',
                              style: regTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: regularTextColor.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: const CustomNavBar(
              selectedMenu: MenuState.shop,
            ),
          ),
        );
      },
    );
  }
}
