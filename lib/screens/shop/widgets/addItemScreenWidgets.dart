// ignore_for_file: file_names
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
      if (value.isNotEmpty && errors.contains(descriptionNullError)) {
        errors.remove(descriptionNullError);
      }
    },
    validator: (value) {
      if (value!.isEmpty && !errors.contains(descriptionNullError)) {
        errors.add(descriptionNullError);
        return "";
      }
      return null;
    },
    keyboardType: TextInputType.text,
    decoration: textFieldDecoration('Select Colors').copyWith(),
  );
}

// ignore: must_be_immutable
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

class BuildPriceField extends StatelessWidget {
  const BuildPriceField({super.key});

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
      ),
    );
  }
}
