// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/constants/colors.dart';
import '../../../dummyData/all_dummy_data.dart';

class Inventory1 extends StatelessWidget {
  const Inventory1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: getPropHeight(200),
                  childAspectRatio: 1,
                  crossAxisSpacing: getPropWidth(6),
                  mainAxisSpacing: getPropHeight(15)),
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
                    outOfStock: demoInventory[index].outOfStock,
                    press: () {});
              })
        ],
      ),
    );
  }
}

class InventoryCard extends StatelessWidget {
  const InventoryCard(
      {super.key,
      required this.goodsImage,
      required this.goodsName,
      required this.price,
      required this.outOfStock,
      required this.press});

  final String goodsImage, goodsName, price;
  final bool outOfStock;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getPropWidth(185),
        height: getPropHeight(200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                )),
                height: getPropHeight(145),
                width: getPropWidth(185),
                child: SizedBox(
                  height: getPropHeight(140),
                  width: getPropWidth(180),
                  child: ClipRect(
                    clipBehavior: Clip.hardEdge,
                    child: Stack(
                      children: [
                        Image.asset(
                          goodsImage,
                          fit: BoxFit.fill,
                          height: getPropHeight(135),
                          width: getPropWidth(185),
                        ),
                        (outOfStock == true)
                            ? Positioned(
                                top: getPropHeight(92),
                                left: getPropWidth(70),
                                right: getPropWidth(5),
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: getPropWidth(5),
                                        vertical: getPropHeight(7)),
                                    decoration: BoxDecoration(
                                        color: secondaryButtonTextColor,
                                        borderRadius: BorderRadius.circular(
                                            getPropWidth(16))),
                                    child: Center(
                                      child: Text(
                                        'Out  of  Stock',
                                        style: ordersCardText1,
                                      ),
                                    )))
                            : const SizedBox()
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: getPropHeight(2)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(goodsName, style: regTextStyle2),
                const Icon(Icons.more_vert, size: 12, color: regularTextColor)
              ],
            ),
            SizedBox(height: getPropHeight(6)),
            Text(
              "$price NGN",
              style: inventoryPriceText,
            )
          ],
        ),
      ),
    );
  }
}

class Inventory2 extends StatelessWidget {
  const Inventory2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: getPropHeight(230),
          width: double.infinity,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: demoInventory.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: getPropWidth(10)),
                  child: InventoryCard(
                      goodsImage: demoInventory[index].goodsImage,
                      goodsName: demoInventory[index].goodsName,
                      price: demoInventory[index].price,
                      outOfStock: demoInventory[index].outOfStock,
                      press: () {}),
                );
              }),
        )
      ],
    );
  }
}
