// ignore_for_file: file_names, unused_import
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/widgets/customNavBar.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/enums.dart';
import 'package:shoppa_app/screens/order/createOrder/createOrderScreen.dart';
import 'package:shoppa_app/screens/notifications/notifications.dart';
import 'package:shoppa_app/screens/order/orders/components/ordersScreenContent.dart';

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
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.all(getPropHeight(16)),
        //     child: const ProgessDropDown(),
        //   ),
        //   const SizedBox(width: 16),
        // ],
      ),
      body: const OrdersScreenContent(),
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
  String? selectedValue = '';
  @override
  Widget build(BuildContext context) {
    List<String> items = ['In-Progress', 'Completed', 'Cancelled'];

    return SizedBox(
      width: getPropWidth(150),
      height: getPropHeight(55),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: ordersProgressCardColor.withOpacity(0.5),
            shape: BoxShape.rectangle),
        child: Center(
          child: DropdownButtonFormField(
              decoration: orderStatusFieldDecoration(),
              elevation: 15,
              hint: Text(selectedValue!),
              style: const TextStyle(
                color: ordersProgressCardColor,
                fontFamily: 'Lato',
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              icon: const Icon(Icons.arrow_drop_down_sharp),
              items: items.map((item) {
                return DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        color: ordersProgressCardColor,
                        fontFamily: 'Lato',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ));
              }).toList(),
              onSaved: (newValue) {},
              onChanged: (String? value) =>
                  setState(() => selectedValue = value)),
        ),
      ),
    );
  }
}
