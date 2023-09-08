// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/enums.dart';
import 'package:shoppa_app/models/screenArguments.dart';
import 'package:shoppa_app/screens/order/orderDetails/widgets/socialIconsData.dart';
import 'package:shoppa_app/widgets/customNavBar.dart';
import 'package:shoppa_app/widgets/defaultButton.dart';
import 'package:shoppa_app/screens/order/orderDetails/widgets/socialButtonWidget.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});
  static String routeName = "/OrderDetails";

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as OrderDetailsArguments;
    final List<String> dropdownitem = [
      'Change Order Status',
      'Track Order',
      'Share Order',
      'Cancel Order'
    ];
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          'Order Details',
          style: headerStyle3.copyWith(
            fontSize: 20,
          ),
        ),
        actions: [
          PopupMenuButton(
            color: bgColor,
            padding: EdgeInsets.only(
                left: getPropWidth(30),
                right: getPropWidth(10),
                top: getPropHeight(23)),
            position: PopupMenuPosition.under,
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: dropdownitem[0],
                  textStyle: regTextStyle,
                  child: Text(dropdownitem[0]),
                ),
                PopupMenuItem(
                  value: dropdownitem[1],
                  textStyle: regTextStyle,
                  child: Text(dropdownitem[1]),
                ),
                PopupMenuItem(
                  value: dropdownitem[2],
                  textStyle: regTextStyle,
                  child: Text(dropdownitem[2]),
                ),
                PopupMenuItem(
                  value: dropdownitem[3],
                  textStyle: regTextStyle.copyWith(color: deleteIconColor),
                  child: Text(dropdownitem[3]),
                )
              ];
            },
            child: const Icon(
              Icons.more_vert,
              color: regularTextColor,
              size: 14,
            ),
          ),
          const SizedBox(width: 10)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getPropWidth(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
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
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.65),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order Status",
                          style: TextStyle(
                            color: regularTextColor.withOpacity(0.4),
                            fontFamily: 'Raleway',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: getPropHeight(10),
                        ),
                        if (args.inTransit == true)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFBEFCC),
                              borderRadius: BorderRadius.circular(
                                getPropWidth(4),
                              ),
                            ),
                            child: const Text(
                              'In-progress',
                              style: TextStyle(
                                  color: Color(0xFFE8AE00),
                                  fontFamily: 'Lato',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.0),
                            ),
                          ),
                        if (args.completed == true)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(
                                getPropWidth(4),
                              ),
                            ),
                            child: const Text(
                              'Completed',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontFamily: 'Lato',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.0),
                            ),
                          ),
                        if (args.cancelled == true)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFE8DF),
                              borderRadius: BorderRadius.circular(
                                getPropWidth(4),
                              ),
                            ),
                            child: const Text(
                              'Cancelled',
                              style: TextStyle(
                                  color: Color(0xFFE2060A),
                                  fontFamily: 'Lato',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.0),
                            ),
                          ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: getPropHeight(32),
                ),
                Text(
                  "${args.buyerFirstName} ${args.buyerLastName}",
                  style: headerStyle3,
                ),
                SizedBox(
                  height: getPropHeight(32),
                ),
                Text(
                  "Total Amount",
                  style: TextStyle(
                    color: regularTextColor.withOpacity(0.4),
                    fontFamily: 'Raleway',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: getPropWidth(8),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'NGN',
                      style: headerStyle.copyWith(
                        color: primaryColor,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      args.price,
                      style: headerStyle.copyWith(
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getPropHeight(32),
                ),
                Text(
                  "Ordered for",
                  style: TextStyle(
                    color: regularTextColor.withOpacity(0.4),
                    fontFamily: 'Raleway',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: getPropWidth(8),
                ),
                Text(args.goodsName, style: regTextStyle),
                SizedBox(
                  height: getPropHeight(32),
                ),
                Text(
                  "Delivery Address",
                  style: TextStyle(
                    color: regularTextColor.withOpacity(0.4),
                    fontFamily: 'Raleway',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: getPropWidth(8),
                ),
                Text(args.address, style: regTextStyle),
                SizedBox(
                  height: getPropHeight(32),
                ),
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
                            fontFamily: 'Raleway',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: getPropWidth(8),
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
                            fontFamily: 'Raleway',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: getPropWidth(8),
                        ),
                        const Text(
                          "123466789",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: regularTextColor,
                            fontFamily: 'Lato',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            DefaultButton(
              text: 'Share',
              press: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  context: context,
                  builder: ((context) {
                    return Container(
                      height: getPropHeight(280),
                      decoration: const BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: getPropHeight(30),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'Share',
                                style: regTextStyle.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getPropHeight(10),
                            ),
                            const Divider(
                              height: 1.5,
                              thickness: 1.5,
                            ),
                            SizedBox(
                              height: getPropHeight(10),
                            ),
                            Wrap(
                              direction: Axis.horizontal,
                              spacing: 10,
                              runSpacing: 15,
                              children: List.generate(
                                demoSocials.length,
                                (index) {
                                  return SocialIconWidget(
                                    icon: demoSocials[index].icon,
                                    pressed: demoSocials[index].pressed,
                                    iconName: demoSocials[index].iconName,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
            const SizedBox(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(selectedMenu: MenuState.orders),
    );
  }
}
