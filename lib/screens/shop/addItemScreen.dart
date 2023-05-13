// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/enums.dart';
import 'package:shoppa_app/providers/GlobalStateProvider.dart';
import 'package:shoppa_app/screens/shop/shopScreen.dart';
import 'package:shoppa_app/screens/shop/widgets/addItemScreenWidgets.dart';
import 'package:shoppa_app/widgets/customNavBar.dart';
import 'package:shoppa_app/widgets/defaultButton.dart';
import 'package:shoppa_app/widgets/loading.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});
  static String routeName = '/Add Items';

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formkey = GlobalKey<FormState>();
  String? itemName;
  String? description;
  String? color;
  File? itemImage;
  int? price;
  final List<String> errors = [];

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0.0,
        title: Text(
          'Add New Item',
          style: headerStyle3.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        scrolledUnderElevation: 2.0,
      ),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Loading(
          isLoading: false,
          text: '',
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getPropWidth(18),
                vertical: getPropHeight(20),
              ),
              child: Consumer(
                builder: (context, ref, child) {
                  return Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Item Name", style: regTextStyle),
                        SizedBox(height: getPropHeight(8)),
                        buildItemNameField(itemName ?? "", errors),
                        SizedBox(height: getPropHeight(16)),
                        Text("Description", style: regTextStyle),
                        SizedBox(height: getPropHeight(8)),
                        Material(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: subHeaderTextColor,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          color: Colors.transparent,
                          child: SizedBox(
                            width: getPropWidth(381),
                            height: getPropHeight(131),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: Flexible(
                                child: buildItemDescriptionField(
                                    description ?? "", errors),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: getPropHeight(16)),
                        Text("Photos", style: regTextStyle),
                        SizedBox(height: getPropHeight(8)),
                        ItemImageField(
                          itemImage: itemImage,
                        ),
                        SizedBox(height: getPropHeight(16)),
                        Text("Colors Available in...", style: regTextStyle),
                        SizedBox(height: getPropHeight(8)),
                        buildColorField(color ?? "", errors),
                        SizedBox(height: getPropHeight(16)),
                        Text("Price", style: regTextStyle),
                        SizedBox(height: getPropHeight(8)),
                        BuildPriceField(errors: errors),
                        SizedBox(height: getPropHeight(48)),
                        DefaultButton(
                          text: 'Add Item',
                          press: () async {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();
                              ref.read(globalLoading.notifier).state = true;
                              await ConstantFunction.showSuccessDialog(
                                context,
                                'Item Successfully added',
                                () {
                                  Navigator.of(context).pushReplacementNamed(
                                    ShopScreen.routeName,
                                  );
                                },
                              );
                            } else {
                              await ConstantFunction.showFailureDialog(
                                context,
                                'Your item could not be added at this time',
                                () {
                                  Navigator.pop(context);
                                },
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavBar(selectedMenu: MenuState.shop),
    );
  }
}
