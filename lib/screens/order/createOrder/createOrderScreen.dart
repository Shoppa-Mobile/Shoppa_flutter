// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/screens/notifications/notifications.dart';
import 'package:shoppa_app/widgets/customNavBar.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/enums.dart';
import 'package:shoppa_app/screens/order/createOrder/widgets/createOrderContent.dart';

class CreateOrderScreen extends StatelessWidget {
  const CreateOrderScreen({super.key});
  static String routeName = "/Create Order";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text(
          'Create Order',
          style: headerStyle3.copyWith(
            fontSize: 20,
          ),
        ),
      ),
      body: const CreateOrderContent(),
      bottomNavigationBar: const CustomNavBar(selectedMenu: MenuState.orders),
    );
  }
}
