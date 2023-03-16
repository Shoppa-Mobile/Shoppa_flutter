// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/enums.dart';
import 'package:shoppa_app/screens/notifications/notifications.dart';
import 'package:shoppa_app/screens/shop/widgets/inventoryDisplayWidget.dart';
import 'package:shoppa_app/screens/shop/widgets/reviewsDisplayWidget.dart';
import 'package:shoppa_app/screens/shop/widgets/searchInvFieldWidget.dart';
import 'package:shoppa_app/widgets/customNavBar.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});
  static String routeName = '/Shop';

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.animateTo(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: bgColor,
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 2.0,
          actions: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Notifications.routeName);
              },
              child: SafeArea(
                child: SvgPicture.asset(
                  'assets/icons/bell.svg',
                  height: getPropHeight(28),
                  width: getPropWidth(28),
                ),
              ),
            ),
            const SizedBox(width: 24),
          ],
        ),
        backgroundColor: bgColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getPropWidth(18),
            vertical: getPropHeight(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shop',
                style: headerStyle.copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.02,
                ),
              ),
              SizedBox(
                height: getPropHeight(32),
              ),
              const SearchInventoryField(),
              SizedBox(
                height: getPropHeight(32),
              ),
              Container(
                width: getPropWidth(225),
                height: getPropHeight(36),
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                color: Colors.transparent,
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: primaryColor,
                  unselectedLabelColor: regularTextColor.withOpacity(0.6),
                  unselectedLabelStyle:
                      regTextStyle.copyWith(fontWeight: FontWeight.w500),
                  labelColor: regularTextColor,
                  labelStyle:
                      regTextStyle.copyWith(fontWeight: FontWeight.w700),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
                    Text('Inventory'),
                    Text('Review'),
                  ],
                ),
              ),
              SizedBox(
                height: getPropHeight(32),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    InventoryDisplayWidget(),
                    ReviewDisplayWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: const CustomNavBar(selectedMenu: MenuState.shop));
  }
}
