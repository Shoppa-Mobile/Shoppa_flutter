// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/screens/shop/widgets/addItemScreenWidgets.dart';
import 'package:shoppa_app/widgets/loading.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});
  static String routeName = '/Add Items';

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formkey = GlobalKey<FormState>();
  String? itemName;
  String? description;
  String? color;
  final List<String> errors = [];

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0.0,
        title: Text(
          'Add New Item',
          style: headerStyle3.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        scrolledUnderElevation: 2.0,
      ),
      backgroundColor: bgColor,
      body: SafeArea(
          child: Loading(
        isLoading: false,
        text: '',
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getPropWidth(18),
            vertical: getPropHeight(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Item Name", style: regTextStyle),
              SizedBox(height: getPropHeight(8)),
              buildItemNameField(itemName ?? "", errors),
              SizedBox(height: getPropHeight(16)),
              Text("Description", style: regTextStyle),
              SizedBox(height: getPropHeight(8)),
              buildItemNameField(description ?? "", errors),
              SizedBox(height: getPropHeight(16)),
              Text("Colors Available in...", style: regTextStyle),
              SizedBox(height: getPropHeight(8)),
              buildColorField(color ?? "", errors),
            ],
          ),
        ),
      )),
    );
  }
}
