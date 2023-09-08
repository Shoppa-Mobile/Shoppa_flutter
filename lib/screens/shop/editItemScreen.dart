// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/enums.dart';
import 'package:shoppa_app/providers/GlobalStateProvider.dart';
import 'package:shoppa_app/screens/shop/widgets/editProductForm.dart';
import 'package:shoppa_app/widgets/customNavBar.dart';
import 'package:shoppa_app/widgets/loading.dart';

class EditItemScreen extends StatelessWidget {
  const EditItemScreen({super.key});
  static String routeName = '/EditItemScreen';

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        bool loading = ref.watch(globalLoading);
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
              actions: const [
                Icon(
                  Icons.more_vert,
                  color: regularTextColor,
                  size: 14,
                ),
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
