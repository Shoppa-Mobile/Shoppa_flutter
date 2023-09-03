// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/dummyData/all_dummy_data.dart';
import 'package:shoppa_app/screens/shop/reviewDisplayScreen.dart';
import 'package:shoppa_app/widgets/inventoryItemCard.dart';

class ReviewDisplayWidget extends StatelessWidget {
  const ReviewDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool userNew = true;
    return (userNew == true)
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/reviews.png'),
                SizedBox(
                  height: getPropHeight(5),
                ),
                Text(
                  'You have no reviews yet',
                  style: regTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: regularTextColor.withOpacity(0.4),
                  ),
                ),
              ],
            ),
          )
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: getPropHeight(200),
                        childAspectRatio: 1.2,
                        crossAxisSpacing: getPropWidth(15),
                        mainAxisSpacing: getPropHeight(25)),
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemCount: demoInventory.length,
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InventoryCard(
                        goodsImage: '',
                        goodsName: demoInventory[index].goodsName,
                        price: demoInventory[index].price,
                        homeColor: false,
                        press1: () {
                          Navigator.of(context)
                              .pushNamed(ReviewDisplayScreen.routeName);
                        },
                        press2: () {},
                      );
                    })
              ],
            ),
          );
  }
}
