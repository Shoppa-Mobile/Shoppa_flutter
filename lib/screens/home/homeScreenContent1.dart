import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/screens/home/components/pendingOrders.dart';
import '../../constants/size_configurations.dart';

class HomeScreenContent1 extends StatefulWidget {
  const HomeScreenContent1({super.key});

  @override
  State<HomeScreenContent1> createState() => _HomeScreenContent1State();
}

class _HomeScreenContent1State extends State<HomeScreenContent1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getPropWidth(20), vertical: getPropHeight(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Welcome \nto Shoppa",
                  style: headerStyle,
                ),
                const Icon(
                  Icons.notifications,
                  size: 32,
                ),
              ],
            ),
            SizedBox(height: getPropHeight(15)),
            const PendingOrders1()
          ],
        ),
      ),
    );
  }
}
