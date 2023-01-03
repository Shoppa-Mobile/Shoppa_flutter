// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/screens/home/components/inventory.dart';
import 'package:shoppa_app/screens/home/components/pendingOrders.dart';
import '../../constants/constants.dart';
import '../../constants/size_configurations.dart';

class HomeScreenContent1 extends StatefulWidget {
  const HomeScreenContent1({super.key});

  @override
  State<HomeScreenContent1> createState() => _HomeScreenContent1State();
}

class _HomeScreenContent1State extends State<HomeScreenContent1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getPropWidth(20), vertical: getPropHeight(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: getPropHeight(10)),
          const PendingOrders1(),
          SizedBox(height: getPropHeight(15)),
          Text(
            'Inventory',
            style: headerStyle3,
          ),
          SizedBox(height: getPropHeight(10)),
          const Expanded(child: Inventory1())
        ],
      ),
    );
  }
}
