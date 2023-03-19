// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/dummyData/all_dummy_data.dart';
import 'package:shoppa_app/widgets/inventoryItemCard.dart';

class ReviewDisplayWidget extends StatelessWidget {
  const ReviewDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool showReviews = true;
    return (showReviews == true)
        ? SingleChildScrollView(
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
                        goodsImage: demoInventory[index].goodsImage,
                        goodsName: demoInventory[index].goodsName,
                        price: demoInventory[index].price,
                        homeColor: false,
                        press: () {},
                      );
                    })
              ],
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.library_add_sharp,
                size: getPropWidth(200),
                color: primaryColor.withOpacity(0.3),
              )
            ],
          );
  }
}
