import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppa_app/dummyData/all_dummy_data.dart';
import 'package:shoppa_app/screens/notifications/widgets/notificationsCard.dart';
import 'package:shoppa_app/widgets/customNavBar.dart';
import 'package:shoppa_app/enums.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../constants/size_configurations.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});
  static String routeName = "/notifications";

  @override
  Widget build(BuildContext context) {
    bool newUser = true;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 2,
        elevation: 0,
        backgroundColor: bgColor.withOpacity(0.8),
        centerTitle: true,
        title: Text(
          "Notifications",
          style: headerStyle2,
        ),
        actions: [
          SvgPicture.asset(
            'assets/icons/bell.svg',
            height: getPropHeight(32),
            width: getPropWidth(32),
          ),
          const SizedBox(width: 10)
        ],
      ),
      backgroundColor: bgColor,
      body: (newUser == true)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/notification.png'),
                  SizedBox(
                    height: getPropHeight(5),
                  ),
                  Text(
                    'You have no notifications yet',
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
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getPropWidth(16), vertical: getPropHeight(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 3),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: demoNotifications.length,
                        itemBuilder: (context, index) {
                          return NotificationsCard(
                              date: demoNotifications[index].date,
                              time: demoNotifications[index].time,
                              messages: demoNotifications[index].message,
                              press: () {});
                        }),
                    const SizedBox(height: 2)
                  ],
                ),
              ),
            ),
      bottomNavigationBar: const CustomNavBar(selectedMenu: MenuState.empty),
    );
  }
}
