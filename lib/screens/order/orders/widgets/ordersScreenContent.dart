// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/screens/order/orders/widgets/createOrderWidget.dart';
import 'package:shoppa_app/screens/order/orders/widgets/historyListWidget.dart';
import 'package:shoppa_app/screens/order/orders/widgets/searchFieldWidget.dart';

class OrdersScreenContent extends StatefulWidget {
  const OrdersScreenContent({
    super.key,
  });

  @override
  State<OrdersScreenContent> createState() => _OrdersScreenContentState();
}

class _OrdersScreenContentState extends State<OrdersScreenContent> {
  @override
  Widget build(BuildContext context) {
    bool userNew = true;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getPropWidth(12),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: getPropHeight(25)),
          const CreateOrderWidget(),
          SizedBox(height: getPropHeight(25)),
          const SearchField(),
          SizedBox(height: getPropHeight(25)),
          Text('History', style: headerStyle3),
          SizedBox(height: getPropHeight(10)),
          (userNew == true)
              ? Expanded(
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/orders.png'),
                        SizedBox(
                          height: getPropHeight(5),
                        ),
                        Text(
                          'You have no orders yet',
                          style: regTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: regularTextColor.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
              )
              : Expanded(
                  child: PageView(
                  scrollDirection: Axis.horizontal,
                  physics: const ScrollPhysics(),
                  controller: PageController(),
                  children: const [
                    AllHistoryWidget(),
                    CompletedHistoryWidget(),
                    InProgressHistoryWidget(),
                    CancelledHistoryWidget()
                  ],
                ))
        ]),
      ),
    );
  }
}
