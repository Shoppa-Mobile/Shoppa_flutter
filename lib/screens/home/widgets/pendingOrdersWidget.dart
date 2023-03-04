// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/dummyData/all_dummy_data.dart';

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
              itemCount: demoHistory.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {},
                    child: PendingOrdersCard1(
                      boolo: demoHistory[index].inProgress,
                      buyerLastName: demoHistory[index].buyerLastName,
                      buyerFirstName: demoHistory[index].buyerFirstName,
                      price: demoHistory[index].price,
                      goodsName: demoHistory[index].goodsName,
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
              itemCount: demoHistory.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              controller: ScrollController(),
              itemBuilder: (context, index) {
                return PendingOrdersCard2(
                  boolo: demoHistory[index].inProgress,
                  buyerLastName: demoHistory[index].buyerLastName,
                  buyerFirstName: demoHistory[index].buyerFirstName,
                  price: demoHistory[index].price,
                  goodsName: demoHistory[index].goodsName,
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
    return (boolo == true)
        ? GestureDetector(
            onTap: press,
            child: Card(
              color: bgColor,
              elevation: 0,
              child: SizedBox(
                height: getPropHeight(102),
                width: SizeConfig.screenWidth - 20,
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
                                width: 30,
                                height: 30,
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
                                ),
                              ),
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
                          Text("NGN $price",
                              style: regTextStyle.copyWith(
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      SizedBox(
                        height: getPropHeight(16),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: getPropWidth(6),
                                vertical: getPropHeight(5)),
                            decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.1),
                                borderRadius:
                                    BorderRadius.circular(getPropWidth(04))),
                            child: const Text(
                              'In Progress',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontFamily: 'Lato',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.0),
                            ),
                          ),
                          Text(
                            goodsName,
                            style: const TextStyle(
                                color: headerTextColor,
                                fontFamily: 'Raleway',
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 1.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getPropHeight(1),
                      ),
                      const Divider(
                        thickness: 1.0,
                        color: textFieldBorderColor,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
