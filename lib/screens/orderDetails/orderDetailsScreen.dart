// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/models/screenArguments.dart';
import '../../constants/size_configurations.dart';
import '../../enums.dart';
import '../../widgets/customNavBar.dart';
import '../notifications/notifications.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});
  static String routeName = "/OrderDetails";

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as OrderDetailsArguments;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        automaticallyImplyLeading: true,
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
          const SizedBox(width: 10)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getPropWidth(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text(
              'Order Details',
              style: headerStyle2,
            ),
            const SizedBox(height: 45),
            Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor.withOpacity(0.10),
                ),
                child: Center(
                  child: Text(
                    "${args.buyerFirstName.characters.characterAt(0)}${args.buyerLastName.characters.characterAt(0).toUpperCase()}",
                    style: const TextStyle(
                      color: primaryColor,
                      fontFamily: 'Lato',
                      fontSize: 28.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )),
            const SizedBox(height: 32),
            Text(
              "${args.buyerFirstName} ${args.buyerLastName}",
              style: headerStyle3,
            ),
            SizedBox(height: getPropHeight(16)),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Ordered for",
                      style: TextStyle(
                        color: regularTextColor.withOpacity(0.4),
                        fontFamily: 'Lato',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(args.goodsName, style: regTextStyle)
                  ],
                ),
                SizedBox(width: getPropWidth(10)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Total Amount",
                      style: TextStyle(
                        color: regularTextColor.withOpacity(0.4),
                        fontFamily: 'Lato',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(args.price, style: regTextStyle)
                  ],
                ),
              ],
            ),
            SizedBox(height: getPropHeight(32)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Delivery Address",
                  style: TextStyle(
                    color: regularTextColor.withOpacity(0.4),
                    fontFamily: 'Lato',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(args.address, style: regTextStyle)
              ],
            ),
            SizedBox(height: getPropHeight(32)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Delivery Date",
                      style: TextStyle(
                        color: regularTextColor.withOpacity(0.4),
                        fontFamily: 'Lato',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text("9th, September, 2022", style: regTextStyle),
                  ],
                ),
                SizedBox(width: getPropWidth(32)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Tracking ID",
                      style: TextStyle(
                        color: regularTextColor.withOpacity(0.4),
                        fontFamily: 'Lato',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Text("123466789",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: regularTextColor,
                          fontFamily: 'Lato',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
                SizedBox(width: getPropWidth(32)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Delivery Status",
                      style: TextStyle(
                        color: regularTextColor.withOpacity(0.4),
                        fontFamily: 'Lato',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Text("Delivered",
                        style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'Lato',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(selectedMenu: MenuState.orders),
    );
  }
}
