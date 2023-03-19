// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';

// ignore: must_be_immutable
class InventoryCard extends StatelessWidget {
  InventoryCard(
      {super.key,
      required this.goodsImage,
      required this.goodsName,
      required this.price,
      this.outOfStock = false,
      this.homeColor = true,
      required this.press});

  final String goodsImage, goodsName, price;
  bool? outOfStock, homeColor;
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
                height: getPropHeight(145),
                width: getPropWidth(185),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: ClipRect(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: Image.asset(
                          goodsImage,
                          fit: BoxFit.cover,
                          height: getPropHeight(135),
                          width: getPropWidth(185),
                        ),
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
                                    getPropWidth(16),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Out  of  Stock',
                                    style: ordersCardText1,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox()
                    ],
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
              style: (homeColor == true)
                  ? inventoryPriceText
                  : inventoryPriceText.copyWith(color: regularTextColor),
            )
          ],
        ),
      ),
    );
  }
}
