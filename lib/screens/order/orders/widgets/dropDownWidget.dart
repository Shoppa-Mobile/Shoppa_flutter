// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
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
      'All',
      'In-Progress',
      'Completed',
      'Cancelled',
    ];

    return SizedBox(
      width: getPropWidth(140),
      height: getPropHeight(35),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: ordersProgressCardColor.withOpacity(0.05),
            shape: BoxShape.rectangle),
        child: Center(
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              elevation: 15,
              isDense: true,
              icon: const Icon(
                Icons.arrow_downward_sharp,
                size: 14,
              ),
              items: items.map(
                (String item) {
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
              onChanged: (String? value) => setState(() {
                selectedValue = value;
              }),
            ),
          ),
        ),
      ),
    );
  }
}
