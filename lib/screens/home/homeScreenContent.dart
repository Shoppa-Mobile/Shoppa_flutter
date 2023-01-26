// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/screens/home/components/inventory.dart';
import 'package:shoppa_app/screens/home/components/pendingOrders.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../constants/size_configurations.dart';

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getPropWidth(20), vertical: getPropHeight(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: getPropHeight(10)),
          Text(
            'Inventory',
            style: headerStyle3,
          ),
          SizedBox(height: getPropHeight(10)),
          const Inventory2(),
          SizedBox(height: getPropHeight(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pending Orders',
                style: headerStyle3,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'View all',
                    style: TextStyle(
                        color: primaryColor.withOpacity(0.7),
                        fontFamily: 'Lato',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.underline),
                  ))
            ],
          ),
          SizedBox(height: getPropHeight(3)),
          const Expanded(child: PendingOrder2())
        ],
      ),
    );
  }
}
