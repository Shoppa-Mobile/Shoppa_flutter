// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors_in_immutables
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';

TextFormField buildItemNameField(String itemName, List<String> errors) {
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

TextFormField buildItemDescriptionField(
    String description, List<String> errors) {
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

TextFormField buildColorField(String color, List<String> errors) {
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

class ItemImageField extends StatefulWidget {
  ItemImageField({
    super.key,
    this.itemImage,
  });
  File? itemImage;

  @override
  State<ItemImageField> createState() => _ItemImageFieldState();
}

class _ItemImageFieldState extends State<ItemImageField> {
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
        widget.itemImage = _itemImage;
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
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
}

List<String> currency = [
  'NGN',
  'USD',
  'GBP',
];

String? selectedCur;

class BuildPriceField extends StatefulWidget {
  BuildPriceField({
    super.key,
    required this.errors,
  });
  final List<String> errors;
  @override
  State<BuildPriceField> createState() => _BuildPriceFieldState();
}

class _BuildPriceFieldState extends State<BuildPriceField> {
  double? price;

  @override
  Widget build(BuildContext context) {
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
                      widget.errors.contains(priceNullError)) {
                    widget.errors.remove(priceNullError);
                  }
                  price = double.parse(value);
                },
                validator: (value) {
                  if (value!.isEmpty &&
                      !widget.errors.contains(priceNullError)) {
                    widget.errors.add(priceNullError);
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
