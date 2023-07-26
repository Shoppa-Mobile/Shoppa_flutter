// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors_in_immutables
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/providers/GlobalStateProvider.dart';
import 'package:shoppa_app/screens/shop/shopScreen.dart';
import 'package:shoppa_app/widgets/defaultButton.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

class UploadProductForm extends StatefulWidget {
  const UploadProductForm({
    super.key,
  });

  @override
  State<UploadProductForm> createState() => _UploadProductFormState();
}

class _UploadProductFormState extends State<UploadProductForm> {
  final _formkey = GlobalKey<FormState>();
  String? itemName;
  String? description;
  String? color;
  File? itemImage;
  double? price;
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

  File? _itemImage;
  Future<XFile?> imagePicker(ImageSource source) async {
    try {
      var imageT = await ImagePicker().pickImage(source: source);
      if (imageT == null) {
        return null;
      }
      final image = File(imageT.path);
      setState(() {
        _itemImage = image;
        itemImage = _itemImage;
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
    return null;
  }

  List<String> currency = [
    'NGN',
    'USD',
    'GBP',
  ];

  String? selectedCur;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Item Name", style: regTextStyle),
              SizedBox(height: getPropHeight(8)),
              buildProductNameField(),
              SizedBox(height: getPropHeight(16)),
              Text("Description", style: regTextStyle),
              SizedBox(height: getPropHeight(8)),
              Material(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: subHeaderTextColor,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                color: Colors.transparent,
                child: SizedBox(
                  width: getPropWidth(381),
                  height: getPropHeight(131),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Flexible(
                      child: buildProductDescriptionField(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: getPropHeight(16)),
              Text("Photos", style: regTextStyle),
              SizedBox(height: getPropHeight(8)),
              buildProductImageField(),
              SizedBox(height: getPropHeight(16)),
              Text("Colors Available in...", style: regTextStyle),
              SizedBox(height: getPropHeight(8)),
              buildProductColorField(),
              SizedBox(height: getPropHeight(16)),
              Text("Price", style: regTextStyle),
              SizedBox(height: getPropHeight(8)),
              buildProductPriceField(),
              SizedBox(height: getPropHeight(48)),
              DefaultButton(
                text: 'Add Item',
                press: () async {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    ref.read(globalLoading.notifier).state = true;
                    var productsPayload = {
                      'name': itemName,
                      'in_stock': 100,
                      'description': description,
                      'price': price,
                    };
                    productsPayload.log();
                    await ConstantFunction.showSuccessDialog(
                      context,
                      'Item Successfully added',
                      () {
                        Navigator.of(context).pushReplacementNamed(
                          ShopScreen.routeName,
                        );
                      },
                    );
                  } else {
                    await ConstantFunction.showFailureDialog(
                      context,
                      'Your item could not be added at this time',
                      () {
                        Navigator.pop(context);
                      },
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  TextFormField buildProductNameField() {
    return TextFormField(
      onSaved: (newValue) => itemName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(itemNameNullError)) {
          errors.remove(itemNameNullError);
        }
        itemName = value;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(itemNameNullError)) {
          errors.add(itemNameNullError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.text,
      decoration: textFieldDecoration('Enter Item Name'),
    );
  }

  TextFormField buildProductDescriptionField() {
    return TextFormField(
      onSaved: (newValue) => description = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(itemNameNullError)) {
          errors.remove(itemNameNullError);
        }
        description = value;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(itemNameNullError)) {
          errors.add(itemNameNullError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.text,
      maxLines: null,
      decoration: InputDecoration.collapsed(
        hintText: "Enter Description",
        hintStyle: subTextStyle,
      ),
    );
  }

  TextFormField buildProductColorField() {
    return TextFormField(
      onSaved: (newValue) => color = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(priceNullError)) {
          errors.remove(priceNullError);
        }
        color = value;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(priceNullError)) {
          errors.add(priceNullError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.text,
      decoration: textFieldDecoration('Select Colors').copyWith(),
    );
  }

  buildProductImageField() {
    return InkWell(
      onTap: () {
        imagePicker(ImageSource.gallery);
      },
      child: _itemImage == null
          ? Container(
              height: getPropHeight(169),
              width: getPropWidth(385),
              decoration: BoxDecoration(
                color: subTextColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      color: subHeaderTextColor,
                      size: getPropHeight(30),
                    ),
                    SizedBox(
                      height: getPropHeight(13),
                    ),
                    Text(
                      "Upload product photo(s)",
                      style: subHeaderStyle.copyWith(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
            )
          : SizedBox(
              height: getPropHeight(169),
              width: getPropWidth(385),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  getPropWidth(8),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.file(
                  _itemImage!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
    );
  }

  buildProductPriceField(){
    return Material(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: subHeaderTextColor,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: Colors.transparent,
      child: SizedBox(
        width: getPropWidth(381),
        height: getPropHeight(64),
        child: Row(
          children: [
            Container(
              width: getPropWidth(103),
              height: getPropHeight(62),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.0),
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                ),
                color: primaryColor,
              ),
              child: DropdownButtonHideUnderline(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: DropdownButton(
                    dropdownColor: primaryColor,
                    value: selectedCur,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 14,
                      color: bgColor,
                    ),
                    items: currency.map(
                      (String cur) {
                        return DropdownMenuItem(
                          value: cur,
                          child: Text(
                            cur,
                            style: whiteHeaderStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        );
                      },
                    ).toList(),
                    onChanged: (String? value) => setState(
                      () {
                        selectedCur = value;
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: getPropWidth(8.0),
            ),
            Expanded(
              child: TextFormField(
                onSaved: (newValue) => price = double.parse(newValue!),
                onChanged: (value) {
                  if (value.isNotEmpty &&
                      errors.contains(priceNullError)) {
                    errors.remove(priceNullError);
                  }
                  price = double.parse(value);
                },
                validator: (value) {
                  if (value!.isEmpty &&
                      !errors.contains(priceNullError)) {
                    errors.add(priceNullError);
                    return "";
                  }
                  return null;
                },
                decoration: InputDecoration.collapsed(
                  hintText: "Enter your Item's price",
                  hintStyle: subTextStyle,
                ),
                keyboardType: TextInputType.text,
              ),
            )
          ],
        ),
      ),
    );
  }
}