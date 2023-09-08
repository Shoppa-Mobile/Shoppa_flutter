// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';

// ignore: must_be_immutable
class InventoryCard extends StatelessWidget {
  InventoryCard({
    super.key,
    required this.goodsImage,
    required this.goodsName,
    required this.price,
    this.outOfStock = false,
    this.homeColor = true,
    required this.press1,
    required this.press2,
    required this.press3,
    required this.colors,
  });

  final String goodsName, price;
  bool? outOfStock, homeColor;
  final GestureTapCallback press1, press2, press3;
  List goodsImage;
  List<dynamic> colors;

  @override
  Widget build(BuildContext context) {
    final List<String> dropdownitem = [
      'Edit Item',
      'Delete from Inventory',
    ];

    Color hexToColor(String hexString) {
      final buffer = StringBuffer();
      if (hexString.length == 6 || hexString.length == 7) {
        buffer.write('ff'); // Add alpha if it's not included in the hex string
      }
      buffer.write(hexString.replaceAll('#', ''));

      return Color(int.parse(buffer.toString(), radix: 16));
    }

    return InkWell(
      onTap: press3,
      child: Container(
        width: getPropWidth(185),
        height: getPropHeight(210),
        decoration: const BoxDecoration(
          color: cardBgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
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
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: ClipRect(
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: (goodsImage.isEmpty)
                            ? Center(
                                child:
                                    Image.asset('assets/images/inventory.png'),
                              )
                            : Image.network(
                                goodsImage[0],
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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getPropWidth(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(goodsName, style: regTextStyle2),
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
                          child: TextButton(
                            onPressed: press1,
                            child: Text(
                              dropdownitem[0],
                              style: regTextStyle,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: dropdownitem[0],
                          textStyle:
                              regTextStyle.copyWith(color: deleteIconColor),
                          child: TextButton(
                            onPressed: press2,
                            child: Text(
                              dropdownitem[1],
                              style:
                                  regTextStyle.copyWith(color: deleteIconColor),
                            ),
                          ),
                        ),
                      ];
                    },
                    child: const Icon(
                      Icons.more_vert,
                      size: 12,
                      color: regularTextColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: getPropHeight(2)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getPropWidth(8),
              ),
              child: Text(
                "$price NGN",
                style: (homeColor == true)
                    ? inventoryPriceText
                    : inventoryPriceText.copyWith(
                        color: regularTextColor,
                      ),
              ),
            ),
            SizedBox(height: getPropHeight(2)),
            (homeColor == false)
                ? (colors.isNotEmpty)
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getPropWidth(8),
                        ),
                        child: SizedBox(
                          height: getPropHeight(25),
                          width: getPropWidth(105),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: colors.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Container(
                                  width: getPropWidth(18),
                                  height: getPropHeight(18),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: hexToColor(
                                      colors[index],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getPropWidth(8),
                        ),
                        child: Text(
                          'No Colors available',
                          style: subTextStyle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
