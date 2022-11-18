// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/screens/home/components/inventory.dart';
import 'package:shoppa_app/screens/home/components/pendingOrders.dart';
import '../../constants/size_configurations.dart';

class HomeScreenContent2 extends StatefulWidget {
  const HomeScreenContent2({super.key});

  @override
  State<HomeScreenContent2> createState() => _HomeScreenContent2State();
}

class _HomeScreenContent2State extends State<HomeScreenContent2> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getPropWidth(20), vertical: getPropHeight(20)),
        child: Column(
          children: [
            SizedBox(height: getPropHeight(10)),
            const Inventory2(),
            SizedBox(height: getPropHeight(10)),
            const PendingOrder2()
          ],
        ),
      ),
    );
  }
}
