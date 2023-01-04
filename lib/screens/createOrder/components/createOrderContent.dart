// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/widgets/defaultButton.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';

class CreateOrderContent extends StatefulWidget {
  const CreateOrderContent({super.key});

  @override
  State<CreateOrderContent> createState() => _CreateOrderContentState();
}

class _CreateOrderContentState extends State<CreateOrderContent> {
  final _formkey = GlobalKey<FormState>();
  late String customerName, deliveryAddress, itemName;
  late int phoneNum, itemQty;
  final List<String> errors = [];

  static var index;

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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getPropWidth(18)),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Create Order', style: headerStyle2),
            SizedBox(height: getPropHeight(25)),
            Text("Customer Name", style: regTextStyle),
            SizedBox(height: getPropHeight(8)),
            buildCustomerNameField(),
            SizedBox(height: getPropHeight(16)),
            Text("Phone Number", style: regTextStyle),
            SizedBox(height: getPropHeight(8)),
            buildPhoneNumField(),
            SizedBox(height: getPropHeight(16)),
            Text("Store Item", style: regTextStyle),
            SizedBox(height: getPropHeight(8)),
            buildSelectItemField(),
            SizedBox(height: getPropHeight(16)),
            TextButton(
                onPressed: () {},
                child: Text(
                  '+ Add another item',
                  style: TextStyle(
                    color: regularTextColor,
                    fontFamily: 'Lato',
                    fontSize: getPropHeight(16),
                    fontWeight: FontWeight.w500,
                  ),
                )),
            Text("Delivery Address", style: regTextStyle),
            SizedBox(height: getPropHeight(8)),
            buildDeliveryAddressField(),
            SizedBox(height: getPropHeight(80)),
            DefaultButton(
              text: "Create Order",
              press: () {},
            )
          ],
        ),
      ),
    );
  }

  TextFormField buildCustomerNameField() {
    return TextFormField(
      onSaved: (newValue) => customerName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            removeError(error: firstNameNullError);
          });
        }
        customerName = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            addError(error: firstNameNullError);
          });
          return "";
        }
        return null;
      },
      decoration: textCreateOrderFieldDecoration("Customer Name"),
      keyboardType: TextInputType.text,
    );
  }

  TextFormField buildPhoneNumField() {
    return TextFormField(
      onSaved: (newValue) => phoneNum = newValue as int,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            removeError(error: phoneNumNullError);
          });
        }
        phoneNum = value as int;
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            addError(error: phoneNumNullError);
          });
          return "";
        }
        return null;
      },
      decoration: textCreateOrderFieldDecoration("Enter Phone Number"),
      keyboardType: TextInputType.number,
    );
  }

  TextFormField buildDeliveryAddressField() {
    return TextFormField(
      onSaved: (newValue) => deliveryAddress = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            removeError(error: addressNullError);
          });
        }
        deliveryAddress = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            addError(error: addressNullError);
          });
          return "";
        }
        return null;
      },
      decoration: textCreateOrderFieldDecoration("Enter Delivery Address"),
      keyboardType: TextInputType.text,
    );
  }

  TextFormField buildSelectItemField() {
    return TextFormField(
      onSaved: (newValue) => itemName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            removeError(error: addressNullError);
          });
        }
        itemName = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            addError(error: addressNullError);
          });
          return "";
        }
        return null;
      },
      decoration: textCreateOrderFieldDecoration("Select Item"),
      keyboardType: TextInputType.text,
    );
  }

  DropdownButtonFormField buildDropdownFormField(index) {
    return DropdownButtonFormField(
        decoration: textFieldDecoration('Select Store Item'),
        items: [],
        onChanged: (value) {});
  }
}
