// ignore_for_file: file_names, unused_import
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/screens/order/orders/widgets/dropDownWidget.dart';
import 'package:shoppa_app/widgets/customNavBar.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/enums.dart';
import 'package:shoppa_app/screens/order/createOrder/createOrderScreen.dart';
import 'package:shoppa_app/screens/notifications/notifications.dart';
import 'package:shoppa_app/screens/order/orders/widgets/ordersScreenContent.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});
  static String routeName = "/orderScreen";

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 2,
        automaticallyImplyLeading: false,
        title: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Orders",
                style: headerStyle2,
              ),
              Padding(
                padding: EdgeInsets.all(getPropHeight(16)),
                child: const ProgessDropDownWidget(),
              ),
            ],
          ),
        ),
      ),
      body: const OrdersScreenContent(),
      bottomNavigationBar: const CustomNavBar(selectedMenu: MenuState.orders),
    );
  }
}
