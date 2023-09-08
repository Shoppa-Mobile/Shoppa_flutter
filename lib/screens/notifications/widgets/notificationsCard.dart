// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/size_configurations.dart';

class NotificationsCard extends StatelessWidget {
  const NotificationsCard(
      {super.key,
      required this.date,
      required this.time,
      required this.messages,
      required this.press});

  final String date, time, messages;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Card(
        color: bgColor,
        elevation: 0,
        child: SizedBox(
          width: SizeConfig.screenWidth - 32,
          height: getPropHeight(100),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: getPropHeight(6)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        color: primaryColor.withOpacity(0.5),
                        fontFamily: 'Lato',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: primaryColor.withOpacity(0.5),
                        fontFamily: 'Lato',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getPropHeight(5)),
                Text(
                  messages,
                  maxLines: 2,
                  style: const TextStyle(
                    color: regularTextColor,
                    fontFamily: 'Lato',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: getPropHeight(1),
                ),
                const Divider(
                  thickness: 1.0,
                  color: textFieldBorderColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
