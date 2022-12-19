// ignore_for_file: file_names, unused_import
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoppa_app/components/customNavBar.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/enums.dart';
import 'package:shoppa_app/screens/createOrder/createOrderScreen.dart';
import 'package:shoppa_app/screens/notifications/notifications.dart';
import 'package:shoppa_app/screens/orders/components/ordersScreenContent.dart';
import '../../constants/constants.dart';

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
        title: Text(
          "Orders",
          style: headerStyle2,
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Notifications.routeName);
            },
            child: SvgPicture.asset(
              'assets/icons/bell.svg',
              height: getPropHeight(32),
              width: getPropWidth(32),
            ),
          ),
          const SizedBox(width: 16)
        ],
      ),
      body: const OrdersScreenContent(),
      floatingActionButton: InkWell(
          onTap: (() {
            Navigator.pushNamed(context, CreateOrderScreen.routeName);
          }),
          child: SvgPicture.asset(
            "assets/icons/addActionButton.svg",
            width: 66.67,
            height: 66.67,
          )),
      bottomNavigationBar: const CustomNavBar(selectedMenu: MenuState.orders),
    );
  }
}

class ProgessDropDown extends StatefulWidget {
  const ProgessDropDown({super.key});

  @override
  State<ProgessDropDown> createState() => _ProgessDropDownState();
}

class _ProgessDropDownState extends State<ProgessDropDown> {
  @override
  Widget build(BuildContext context) {
    String? initialValue = "In-Progress";

    var items = ['In-Progress', 'Completed', 'Cancelled'];

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: ordersProgressCardColor),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Text(initialValue),
          elevation: 0,
          icon: const Icon(Icons.arrow_drop_down_outlined),
          items: items.map((items) {
            return DropdownMenuItem(value: items, child: Text(items));
          }).toList(),
          onChanged: (changedValue) => setState(() {
            initialValue = changedValue as String?;
          }),
          value: initialValue,
        ),
      ),
    );
  }
}
