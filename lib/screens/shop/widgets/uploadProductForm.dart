// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors_in_immutables, use_build_context_synchronously
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/providers/AuthStateProvider.dart';
import 'package:shoppa_app/providers/GlobalStateProvider.dart';
import 'package:shoppa_app/providers/productServiceProvider.dart';
import 'package:shoppa_app/screens/shop/shopScreen.dart';
import 'package:shoppa_app/services/ProductsServiceClass.dart';
import 'package:shoppa_app/widgets/defaultButton.dart';
import 'package:shoppa_app/widgets/productColorWidget.dart';
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
  String? productName;
  String? description;
  File? itemImage;
  var pickedColor = <Color>[];
  var imageList = <File?>[];
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
        imageList.add(itemImage);
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
  List<String> convertColorListToHex(List<Color> colorList) {
    List<String> hexList = colorList.map((color) {
      return '#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}';
    }).toList();
    return hexList;
  }

  List<String> convertImagesToBase64(List<File?> imageFiles) {
    List<String> base64Strings = [];
    for (File? imageFile in imageFiles) {
      List<int> imageBytes = imageFile!.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      base64Strings.add(base64Image);
    }
    return base64Strings;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final productsAsyncValue = ref.watch(productsProvider);
        final refreshProducts = ref.read(refreshProductsProvider);
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
                // press: () {
                //   String authKey = ref.watch(authKeyProvider);
                //   Log(authKey).log();
                // },
                press: () async {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    ref.read(globalLoading.notifier).state = true;
                    List hexColorList = convertColorListToHex(pickedColor);
                    List<String> imageBase64List =
                        convertImagesToBase64(imageList);
                    Map productsPayload = {
                      'name': productName,
                      'in_stock': 100,
                      'description': description,
                      'price': price,
                      'colour': hexColorList,
                      'image': imageBase64List,
                    };
                    String authKey = ref.watch(authKeyProvider);
                    // ignore: unnecessary_null_comparison
                    Log(authKey).log();
                    Log(productsPayload).log();
                    try {
                      int response = await const ProductsAPI().createNewProduct(
                          productName: productName!,
                          productDescription: description!,
                          price: price!,
                          authKey: authKey,
                          colors: hexColorList,
                          file: itemImage);
                      if (response == 201) {
                        refreshProducts(productsAsyncValue);
                        ref.read(globalLoading.notifier).state = false;
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
                        ref.read(globalLoading.notifier).state = false;
                        await ConstantFunction.showFailureDialog(
                          context,
                          'Your item could not be added at this time, Check your internet connection.',
                          () {
                            Navigator.pop(context);
                          },
                        );
                        Log(response).log();
                      }
                    } catch (e) {
                      e.toString();
                    }
                  } else {
                    ref.read(globalLoading.notifier).state = false;
                    await ConstantFunction.showFailureDialog(
                      context,
                      'Your item could not be added at this time, Check that form is complete.',
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
      onSaved: (newValue) => productName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(productNameNullError)) {
          errors.remove(productNameNullError);
        }
        productName = value;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(productNameNullError)) {
          errors.add(productNameNullError);
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
        if (value.isNotEmpty && errors.contains(productNameNullError)) {
          errors.remove(productNameNullError);
        }
        description = value;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(productNameNullError)) {
          errors.add(productNameNullError);
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

  buildProductColorField() {
    Color defaultcolor = Colors.transparent;
    Widget buildColorPicker() => ColorPicker(
          pickerColor: defaultcolor,
          enableAlpha: false,
          // ignore: deprecated_member_use
          showLabel: false,
          onColorChanged: (color) => setState(
            () => defaultcolor = color,
          ),
        );

    return Stack(
      children: [
        Container(
          height: getPropHeight(60),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(
                style: BorderStyle.solid, color: textFieldBorderColor),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 14,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (pickedColor.isNotEmpty)
                  ? Wrap(
                      direction: Axis.horizontal,
                      spacing: 4.0, // Adjust the spacing as needed
                      runSpacing: 4.0, // Adjust the run spacing as needed
                      children: pickedColor.map((item) {
                        // Build individual widgets here based on the data in the list
                        Widget widget = ColorWidget(productColor: item);
                        // item.log();
                        return widget; // Replace 'YourCustomWidget' with your widget class
                      }).toList(),
                    )
                  : Text(
                      'Select Color',
                      style: subTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
              InkWell(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'Pick your Product Color',
                      style: headerStyle3.copyWith(
                        color: primaryColor,
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildColorPicker(),
                        TextButton(
                          child: Text(
                            'Add Product Color',
                            style: headerStyle3.copyWith(
                              color: primaryColor,
                            ),
                          ),
                          onPressed: () {
                            // defaultcolor.toString().log();
                            setState(() {
                              pickedColor.add(defaultcolor);
                            });
                            // pickedColor.log();
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.arrow_circle_down_outlined,
                  size: 20,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  buildProductImageField() {
    return InkWell(
      onTap: () {
        imagePicker(ImageSource.camera);
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

  buildProductPriceField() {
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
                  if (value.isNotEmpty && errors.contains(priceNullError)) {
                    errors.remove(priceNullError);
                  }
                  price = double.parse(value);
                },
                validator: (value) {
                  if (value!.isEmpty && !errors.contains(priceNullError)) {
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
