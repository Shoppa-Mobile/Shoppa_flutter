// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/enums.dart';
import 'package:shoppa_app/screens/shop/widgets/uploadProductForm.dart';
import 'package:shoppa_app/widgets/customNavBar.dart';
import 'package:shoppa_app/widgets/loading.dart';

class UploadProductScreen extends StatefulWidget {
  const UploadProductScreen({super.key});
  static String routeName = '/Add Items';

  @override
  State<UploadProductScreen> createState() => _UploadProductScreenState();
}

class _UploadProductScreenState extends State<UploadProductScreen> {
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
              child: const UploadProductForm(),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavBar(selectedMenu: MenuState.shop),
    );
  }
}
