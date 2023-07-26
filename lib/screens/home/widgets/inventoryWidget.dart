// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/screens/shop/uploadProductScreen.dart';
import 'package:shoppa_app/widgets/inventoryItemCard.dart';
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
                  press: () {},
                );
              })
        ],
      ),
    );
  }
}

class Inventory2 extends StatelessWidget {
  const Inventory2({super.key});

  @override
  Widget build(BuildContext context) {
    bool newUser = true;
    return (newUser == true)
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
                SizedBox(
                  height: getPropHeight(5),
                ),
                SizedBox(
                  width: getPropWidth(210),
                  height: getPropHeight(40),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: primaryColor,
                    onPressed: () {
                      Navigator.of(context).pushNamed(UploadProductScreen.routeName);
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
              ],
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getPropHeight(230),
                width: double.infinity,
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(right: 10),
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
                          press: () {},
                        ),
                      );
                    }),
              )
            ],
          );
  }
}
