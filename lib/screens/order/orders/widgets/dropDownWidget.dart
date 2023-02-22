// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';

class ProgessDropDownWidget extends StatefulWidget {
  const ProgessDropDownWidget({super.key});

  @override
  State<ProgessDropDownWidget> createState() => _ProgessDropDownWidgetState();
}

class _ProgessDropDownWidgetState extends State<ProgessDropDownWidget> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'In-Progress',
      'Completed',
      'Cancelled',
    ];

    return SizedBox(
      width: getPropWidth(150),
      height: getPropHeight(55),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: ordersProgressCardColor.withOpacity(0.1),
            shape: BoxShape.rectangle),
        child: Center(
          child: DropdownButtonFormField(
            decoration: orderStatusFieldDecoration(),
            elevation: 15,
            hint: const Text("All"),
            style: const TextStyle(
              color: ordersProgressCardColor,
              fontFamily: 'Lato',
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            icon: const Icon(Icons.arrow_drop_down_sharp),
            items: items.map(
              (item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      color: ordersProgressCardColor,
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            ).toList(),
            value: selectedValue,
            onChanged: (String? value) {
              setState(
                () {
                  selectedValue = value as String;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
