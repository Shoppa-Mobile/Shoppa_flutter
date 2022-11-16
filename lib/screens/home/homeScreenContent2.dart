// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 36,
                      width: 36,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset("assets/images/profile.png",
                          fit: BoxFit.fill),
                    ),
                    SizedBox(
                      width: getPropWidth(5),
                    ),
                    Text(
                      "Hello, Oghenefejiro",
                      style: headerStyle3,
                    ),
                  ],
                ),
                const Icon(
                  Icons.notifications,
                  size: 32,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
