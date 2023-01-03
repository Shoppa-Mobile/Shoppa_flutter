// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'pendingOrdersList.dart';

class PendingOrders1 extends StatelessWidget {
  const PendingOrders1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pending Orders',
          style: headerStyle3,
        ),
        SizedBox(height: getPropHeight(2)),
        SizedBox(
          height: getPropHeight(250),
          width: double.infinity,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: demoOrders.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {},
                    child: PendingOrdersCard1(
                      boolo: demoOrders[index].inTransit,
                      buyerLastName: demoOrders[index].buyerLastName,
                      buyerFirstName: demoOrders[index].buyerFirstName,
                      price: demoOrders[index].price,
                      goodsName: demoOrders[index].goodsName,
                    ));
              }),
        ),
      ],
    );
  }
}

class PendingOrdersCard1 extends StatelessWidget {
  const PendingOrdersCard1({
    Key? key,
    required this.boolo,
    required this.buyerFirstName,
    required this.buyerLastName,
    required this.price,
    required this.goodsName,
  }) : super(key: key);

  final bool boolo;
  final String buyerFirstName, buyerLastName, price, goodsName;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        width: SizeConfig.screenWidth - 80,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: getPropHeight(25), horizontal: getPropWidth(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                        color: lightPrimaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(getPropWidth(06))),
                    child: (boolo == true)
                        ? Text(
                            'In-Transit',
                            style: ordersCardText2,
                          )
                        : Text(
                            'Pending-Transit',
                            style: ordersCardText2,
                          ),
                  ),
                  Text(
                    '10th September, 2022',
                    style: ordersCardText1,
                  )
                ],
              ),
              SizedBox(
                height: getPropHeight(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: lightPrimaryColor.withOpacity(0.3),
                      ),
                      child: Center(
                        child: Text(
                          "${buyerFirstName.characters.characterAt(0)}${buyerLastName.characters.characterAt(0).toUpperCase()}",
                          style: ordersCardText2,
                        ),
                      )),
                  const Icon(Icons.more_vert, size: 16, color: bgColor)
                ],
              ),
              SizedBox(height: getPropHeight(10)),
              Text("$buyerFirstName $buyerLastName", style: ordersCardText2),
              Text(
                'NGN $price',
                style: ordersCardText2,
              ),
              SizedBox(height: getPropHeight(17)),
              Text(
                'Ordered for: \n $goodsName',
                style: ordersCardText2,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PendingOrder2 extends StatelessWidget {
  const PendingOrder2({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: demoOrders.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              controller: ScrollController(),
              itemBuilder: (context, index) {
                return PendingOrdersCard2(
                  boolo: demoOrders[index].inTransit,
                  buyerLastName: demoOrders[index].buyerLastName,
                  buyerFirstName: demoOrders[index].buyerFirstName,
                  price: demoOrders[index].price,
                  goodsName: demoOrders[index].goodsName,
                  press: () {},
                );
              })
        ],
      ),
    );
  }
}

class PendingOrdersCard2 extends StatelessWidget {
  const PendingOrdersCard2(
      {super.key,
      required this.boolo,
      required this.buyerFirstName,
      required this.buyerLastName,
      required this.price,
      required this.goodsName,
      required this.press});
  final bool boolo;
  final String buyerFirstName, buyerLastName, price, goodsName;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Card(
            color: bgColor,
            elevation: 0,
            child: SizedBox(
              height: getPropHeight(80),
              width: SizeConfig.screenWidth - 30,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: primaryColor.withOpacity(0.10),
                            ),
                            child: Center(
                              child: Text(
                                "${buyerFirstName.characters.characterAt(0)}${buyerLastName.characters.characterAt(0).toUpperCase()}",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontFamily: 'Lato',
                                  fontSize: getPropHeight(16),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )),
                        const SizedBox(
                          width: 3,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "$buyerFirstName $buyerLastName",
                              style: TextStyle(
                                color: headerTextColor,
                                fontFamily: 'Manrope',
                                fontSize: getPropHeight(16),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              '"Ordered for',
                              style: TextStyle(
                                color: regularTextColor.withOpacity(0.3),
                                fontFamily: 'Lato',
                                fontSize: getPropHeight(10),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              goodsName,
                              style: TextStyle(
                                color: regularTextColor,
                                fontFamily: 'Lato',
                                fontSize: getPropHeight(14),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("NGN $price", style: regTextStyle),
                            const SizedBox(width: 3),
                            InkWell(
                              onTap: () {},
                              child: const Icon(Icons.more_vert,
                                  size: 16, color: regularTextColor),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.10),
                              borderRadius:
                                  BorderRadius.circular(getPropWidth(06))),
                          child: (boolo == true)
                              ? Text(
                                  'In-Transit',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontFamily: 'Lato',
                                      fontSize: getPropHeight(10),
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1.2),
                                )
                              : Text(
                                  'Pending-Transit',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontFamily: 'Lato',
                                      fontSize: getPropHeight(10),
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1.2),
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: 2,
            width: SizeConfig.screenWidth - 40,
            color: regularTextColor.withOpacity(0.1),
          )
        ],
      ),
    );
  }
}
