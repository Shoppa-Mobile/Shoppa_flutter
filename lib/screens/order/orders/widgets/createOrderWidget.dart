// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/screens/order/createOrder/createOrderScreen.dart';

class CreateOrderWidget extends StatelessWidget {
  const CreateOrderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Container(
          width: SizeConfig.screenWidth - 10,
          height: getPropHeight(90),
          decoration: BoxDecoration(
              color: ordersCardColor, borderRadius: BorderRadius.circular(8)),
        ),
        Positioned(
          left: getPropWidth(32),
          top: getPropHeight(16),
          child: TextButton.icon(
            onPressed: () {
              Navigator.of(context).pushNamed(CreateOrderScreen.routeName);
            },
            icon: const Icon(Icons.add, color: regularTextColor),
            label: const Text(
              "Create a new order",
              style: TextStyle(
                color: regularTextColor,
                fontFamily: 'Lato',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        Positioned(
          top: getPropHeight(20),
          left: getPropWidth(250),
          child: Image.asset('assets/images/orderCardImage.png'),
        ),
      ],
    );
  }
}
