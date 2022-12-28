import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'inventoryList.dart';

class Inventory1 extends StatelessWidget {
  const Inventory1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Inventory',
          style: headerStyle3,
        ),
        SizedBox(height: getPropHeight(5)),
        GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: getPropWidth(250),
                childAspectRatio: 1,
                crossAxisSpacing: getPropWidth(10),
                mainAxisSpacing: getPropHeight(10)),
            shrinkWrap: true,
            itemCount: demoInventory.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return InventoryCard(
                  goodsImage: demoInventory[index].goodsImage,
                  goodsName: demoInventory[index].goodsName,
                  price: demoInventory[index].price,
                  outOfStock: demoInventory[index].outOfStock,
                  press: () {});
            })
      ],
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
      child: Padding(
        padding: EdgeInsets.all(getPropWidth(8)),
        child: SizedBox(
          width: getPropWidth(190),
          height: getPropHeight(192),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getPropHeight(128),
                width: getPropWidth(185),
                child: ClipRect(
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [
                      Image.asset(
                        goodsImage,
                        fit: BoxFit.fill,
                        height: getPropHeight(128),
                        width: getPropWidth(178),
                      ),
                      Positioned(
                          top: getPropHeight(88),
                          left: getPropWidth(75),
                          right: getPropWidth(5),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: getPropWidth(5),
                                vertical: getPropHeight(7)),
                            decoration: BoxDecoration(
                                color: secondaryButtonTextColor,
                                borderRadius:
                                    BorderRadius.circular(getPropWidth(16))),
                            child: (outOfStock == true)
                                ? Text(
                                    'Out of Stock',
                                    style: ordersCardText1,
                                  )
                                : Center(
                                    child: Text(
                                      'In Stock',
                                      style: ordersCardText1,
                                    ),
                                  ),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(height: getPropHeight(2)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(goodsName, style: regTextStyle),
                  const Icon(Icons.more_vert, size: 16, color: regularTextColor)
                ],
              ),
              SizedBox(height: getPropHeight(2)),
              Text(
                "$price NGN",
                style: inventoryPriceText,
              )
            ],
          ),
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
        Text(
          'Inventory',
          style: headerStyle3,
        ),
        SizedBox(height: getPropHeight(5)),
        SizedBox(
          height: getPropHeight(230),
          width: double.infinity,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: demoInventory.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InventoryCard(
                    goodsImage: demoInventory[index].goodsImage,
                    goodsName: demoInventory[index].goodsName,
                    price: demoInventory[index].price,
                    outOfStock: demoInventory[index].outOfStock,
                    press: () {});
              }),
        )
      ],
    );
  }
}
