// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/dummyData/all_dummy_data.dart';
import 'package:shoppa_app/screens/shop/addItemScreen.dart';
import 'package:shoppa_app/screens/shop/itemDisplayScreen.dart';
import 'package:shoppa_app/widgets/inventoryItemCard.dart';

class InventoryDisplayWidget extends StatelessWidget {
  const InventoryDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool userNew = true;
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: getPropWidth(220),
            height: getPropHeight(48),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: primaryColor,
              onPressed: () {
                Navigator.of(context).pushNamed(AddItemScreen.routeName);
              },
              child: Text(
                " +  Add new Item ",
                style: whiteHeaderStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            height: getPropHeight(32),
          ),
          Expanded(
            child: (userNew == true)
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/inventory.png'),
                        SizedBox(
                          height: getPropHeight(5),
                        ),
                        Text(
                          'Nothing to see here yet',
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
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
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
                                press: () {
                                  Navigator.of(context)
                                      .pushNamed(ItemDisplayScreen.routeName);
                                },
                              );
                            })
                      ],
                    ),
                  ),
          )
        ]);
  }
}
