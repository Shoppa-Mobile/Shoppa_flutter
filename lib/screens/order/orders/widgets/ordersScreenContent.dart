// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/dummyData/all_dummy_data.dart';
import 'package:shoppa_app/models/screenArguments.dart';
import 'package:shoppa_app/screens/order/orderDetails/orderDetailsScreen.dart';
import 'package:shoppa_app/screens/order/orders/widgets/createOrderWidget.dart';
import 'package:shoppa_app/screens/order/orders/widgets/searchFieldWidget.dart';

class OrdersScreenContent extends StatefulWidget {
  const OrdersScreenContent({super.key});

  @override
  State<OrdersScreenContent> createState() => _OrdersScreenContentState();
}

class _OrdersScreenContentState extends State<OrdersScreenContent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getPropWidth(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getPropHeight(25)),
            const CreateOrderWidget(),
            SizedBox(height: getPropHeight(25)),
            const SearchField(),
            SizedBox(height: getPropHeight(25)),
            Text('History', style: headerStyle3),
            SizedBox(height: getPropHeight(10)),
            Expanded(
              child: ListView.builder(
                  physics: const ScrollPhysics(),
                  itemCount: demoHistory.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return OrdersHistoryCard(
                      date: demoHistory[index].date,
                      buyerFirstName: demoHistory[index].buyerFirstName,
                      buyerLastName: demoHistory[index].buyerLastName,
                      goodsName: demoHistory[index].goodsName,
                      price: demoHistory[index].price,
                      inTransit: demoHistory[index].inProgress,
                      cancelled: demoHistory[index].cancelled,
                      completed: demoHistory[index].completed,
                      press: () {
                        Navigator.pushNamed(
                          context,
                          OrderDetailsScreen.routeName,
                          arguments: OrderDetailsArguments(
                              buyerFirstName: demoHistory[index].buyerFirstName,
                              buyerLastName: demoHistory[index].buyerLastName,
                              goodsName: demoHistory[index].goodsName,
                              price: demoHistory[index].price,
                              date: demoHistory[index].date,
                              inTransit: demoHistory[index].inProgress,
                              cancelled: demoHistory[index].cancelled,
                              completed: demoHistory[index].completed,
                              address: demoHistory[index].address),
                        );
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class OrdersHistoryCard extends StatelessWidget {
  OrdersHistoryCard({
    super.key,
    required this.buyerFirstName,
    required this.buyerLastName,
    required this.goodsName,
    required this.price,
    this.inTransit = false,
    this.completed = false,
    this.cancelled = false,
    required this.press,
    required this.date,
  });

  final String buyerFirstName, buyerLastName, goodsName, price, date;
  bool inTransit, completed, cancelled;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    final List<String> dropdownitem = [
      'Change Order Status',
      'Track Order',
      'Share Order',
      'Cancel Order'
    ];

    return GestureDetector(
      onTap: press,
      child: Card(
        color: bgColor,
        elevation: 0,
        child: SizedBox(
          height: getPropHeight(102),
          width: SizeConfig.screenWidth - 15,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 2,
              vertical: 1,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: primaryColor.withOpacity(0.10),
                            ),
                            child: Center(
                              child: Text(
                                "${buyerFirstName.characters.characterAt(0)}${buyerLastName.characters.characterAt(0).toUpperCase()}",
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontFamily: 'Lato',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          "$buyerFirstName $buyerLastName",
                          style: const TextStyle(
                            color: headerTextColor,
                            fontFamily: 'Raleway',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "NGN $price",
                          style: const TextStyle(
                            color: headerTextColor,
                            fontFamily: 'Raleway',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
                                textStyle: regTextStyle.copyWith(
                                    color: deleteIconColor),
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
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: getPropHeight(16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (inTransit == true)
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
                    if (completed == true)
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
                    if (cancelled == true)
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
                    Text(
                      goodsName,
                      style: const TextStyle(
                        color: regularTextColor,
                        fontFamily: 'Raleway',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 2,
                  width: SizeConfig.screenWidth - 15,
                  color: regularTextColor.withOpacity(0.1),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
