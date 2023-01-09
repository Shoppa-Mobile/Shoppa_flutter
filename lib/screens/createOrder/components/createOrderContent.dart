// ignore_for_file: file_names, unnecessary_null_comparison
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
  late String customerName, deliveryAddress, itemName, newDate;
  late int phoneNum;
  late int itemQty = 0;
  DateTime? deliveryDate;
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

  void increment() {
    if (itemQty >= 0) {
      setState(() {
        itemQty++;
      });
    }
  }

  void decrement() {
    if (itemQty >= 1) {
      setState(() {
        itemQty--;
      });
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getPropWidth(18)),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        child: Form(
          key: _formkey,
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
                  child: const Text(
                    '+ Add another item',
                    style: TextStyle(
                      color: regularTextColor,
                      fontFamily: 'Lato',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              SizedBox(height: getPropHeight(16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Quantity", style: regTextStyle),
                      SizedBox(height: getPropHeight(8)),
                      buildItemCountField(),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Delivery Date", style: regTextStyle),
                      SizedBox(height: getPropHeight(8)),
                      buildDateTextField()
                    ],
                  )
                ],
              ),
              SizedBox(height: getPropHeight(16)),
              Text("Delivery Address", style: regTextStyle),
              SizedBox(height: getPropHeight(8)),
              buildDeliveryAddressField(),
              SizedBox(height: getPropHeight(40)),
              DefaultButton(
                text: "Create Order",
                press: () {},
              )
            ],
          ),
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

  buildItemCountField() {
    return Container(
      height: getPropHeight(64),
      width: getPropWidth(179),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: textFieldBorderColor)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () => decrement(),
              icon: const Icon(
                Icons.remove,
                color: primaryColor,
                size: 16,
              )),
          Text(
            itemQty.toString(),
            style: const TextStyle(
              color: primaryColor,
              fontFamily: 'Lato',
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          IconButton(
              onPressed: () => increment(),
              icon: const Icon(
                Icons.add,
                color: primaryColor,
                size: 16,
              ))
        ],
      ),
    );
  }

  buildDateTextField() {
    return Container(
      height: getPropHeight(64),
      width: getPropWidth(179),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: textFieldBorderColor)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            deliveryDate == null ? 'dd/mm/yyyy' : newDate,
            style: deliveryDate == null ? subTextStyle : regTextStyle,
          ),
          IconButton(
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2222))
                    .then((date) {
                  setState(() {
                    deliveryDate = date;
                    newDate =
                        '${deliveryDate!.day}/${deliveryDate!.month}/${deliveryDate!.year}';
                  });
                });
              },
              icon: const Icon(
                Icons.calendar_today,
                size: 16,
                color: regularTextColor,
              ))
        ],
      ),
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

  // DropdownButtonFormField buildDropdownFormField(index) {
  //   return DropdownButtonFormField(
  //       decoration: textFieldDecoration('Select Store Item'),
  //       items: [],
  //       onChanged: (value) {});
  // }
}
