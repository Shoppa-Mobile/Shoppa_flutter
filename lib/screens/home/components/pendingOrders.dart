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
                      buyerName: demoOrders[index].buyerName,
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
    required this.buyerName,
    required this.price,
    required this.goodsName,
  }) : super(key: key);

  final bool boolo;
  final String buyerName, price, goodsName;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryColor,
      // margin: EdgeInsets.symmetric(
      //     vertical: getPropHeight(30), horizontal: getPropWidth(15)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        width: getPropWidth(310),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: getPropHeight(30), horizontal: getPropWidth(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: primaryColor.withOpacity(0.7),
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
                    style: ordersCardText2,
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
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor.withOpacity(0.7),
                      ),
                      child: Text(
                        'O A',
                        style: ordersCardText2,
                      )),
                  const Icon(Icons.more_vert, size: 16, color: bgColor)
                ],
              ),
              SizedBox(height: getPropHeight(2)),
              Text(buyerName, style: ordersCardText2),
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
