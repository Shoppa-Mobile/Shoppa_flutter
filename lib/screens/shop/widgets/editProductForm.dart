// ignore_for_file: file_names, use_build_context_synchronously
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/models/screenArguments.dart';
import 'package:shoppa_app/providers/AuthStateProvider.dart';
import 'package:shoppa_app/providers/GlobalStateProvider.dart';
import 'package:shoppa_app/providers/coloursProvider.dart';
import 'package:shoppa_app/providers/productServiceProvider.dart';
import 'package:shoppa_app/screens/shop/shopScreen.dart';
import 'package:shoppa_app/services/ProductsServiceClass.dart';
import 'package:shoppa_app/widgets/defaultButton.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

class EditProductForm extends StatefulWidget {
  const EditProductForm({super.key});

  @override
  State<EditProductForm> createState() => _EditProductFormState();
}

class _EditProductFormState extends State<EditProductForm> {
  // ignore: unused_field
  final _formkey = GlobalKey<FormState>();
  String? productName;
  String? description;
  File? itemImage;
  var pickedColor = <Color>[];
  double? price;
  final List<String> errors = [];
  List<File> imagePayload = [];

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

  List<String> colorList = [];

  List<String> currency = [
    'NGN',
    'USD',
    'GBP',
  ];

  String? selectedCur;

  List<String> convertColorsToMaps(List<Color> colors) {
    List<String> colorMaps = [];

    for (Color color in colors) {
      // String colorName =
      //     "colorName"; // Get the color name (e.g., "Color(0xffRRGGBB)")
      String colorHex = colorToHex(color); // Get the hex value of the color

      // Create a map for the color and add it to the list
      colorMaps.add(colorHex);
    }

    return colorMaps;
  }

  @override
  void dispose() {
    colorList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ItemDisplayArguments;

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
              buildProductNameField(
                TextEditingController(text: args.productName),
              ),
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
                    child: buildProductDescriptionField(
                      TextEditingController(
                        text: args.productDescription,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: getPropHeight(16)),
              Text("Photos", style: regTextStyle),
              SizedBox(height: getPropHeight(8)),
              buildProductImageField(args.images.cast()),
              SizedBox(height: getPropHeight(16)),
              Text("Colors Available in...", style: regTextStyle),
              SizedBox(height: getPropHeight(8)),
              ColorField(listColors: args.colors),
              SizedBox(height: getPropHeight(16)),
              Text("Price", style: regTextStyle),
              SizedBox(height: getPropHeight(8)),
              buildProductPriceField(
                TextEditingController(
                  text: args.productPrice.toString(),
                ),
              ),
              SizedBox(height: getPropHeight(48)),
              DefaultButton(
                text: 'Update Item',
                press: () async {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    ref.read(globalLoading.notifier).state = true;
                    List<Color> selectedColors =
                        ref.read(colorListProvider.notifier).state;
                    var colorList = convertColorsToMaps(selectedColors);
                    Map productsPayload = {
                      'ID': args.productID,
                      'name': productName,
                      'in_stock': 100,
                      'description': description,
                      'price': price,
                      'colours': colorList,
                      'images': imagePayload,
                    };
                    String authKey = ref.watch(authKeyProvider);
                    // ignore: unnecessary_null_comparison
                    Log(authKey).log();
                    Log(productsPayload).log();

                    try {
                      int response = await const ProductsAPI().updateProduct(
                        productID: args.productID,
                        productName: productName!,
                        productDescription: description!,
                        price: price!,
                        authKey: authKey,
                        colors: colorList,
                        images: imagePayload,
                      );
                      if (response == 201) {
                        refreshProducts(productsAsyncValue);
                        ref.read(globalLoading.notifier).state = false;
                        ref.read(colorListProvider.notifier).state.clear();
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
                          'Your item could not be updated at this time, Check your internet connection.',
                          () {
                            Navigator.pop(context);
                          },
                        );
                        Log(response).log();
                      }
                    } catch (error) {
                      error.toString();
                      ref.read(globalLoading.notifier).state = false;
                      await ConstantFunction.showFailureDialog(
                        context,
                        'Your item could not be updated at this time, Check your internet connection.',
                        () {
                          Navigator.pop(context);
                        },
                      );
                    }
                  } else {
                    ref.read(globalLoading.notifier).state = false;
                    await ConstantFunction.showFailureDialog(
                      context,
                      'Your item could not be updated at this time, Check that form is complete.',
                      () {
                        Navigator.pop(context);
                      },
                    );
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }

  TextFormField buildProductNameField(TextEditingController nameController) {
    return TextFormField(
      controller: nameController,
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

  TextFormField buildProductDescriptionField(
      TextEditingController descriptionController) {
    return TextFormField(
      controller: descriptionController,
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

  buildProductPriceField(TextEditingController priceController) {
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
                controller: priceController,
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

  buildProductImageField(List<dynamic> imageList) {
    File? itemImage;
    Future<XFile?> imagePicker(ImageSource source) async {
      try {
        var imageT = await ImagePicker().pickImage(source: source);
        if (imageT == null) {
          return null;
        }
        final image = File(imageT.path);
        setState(() {
          itemImage = image;
          imagePayload.add(itemImage!);
        });
      } on PlatformException catch (e) {
        debugPrint('Failed to pick image: $e');
      }
      return null;
    }

    Future<void> chooseImageSource(BuildContext context) async {
      final source = await showDialog<ImageSource>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text("Choose Image Source"),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () => Navigator.pop(context, ImageSource.camera),
                child: const Text("Camera"),
              ),
              SimpleDialogOption(
                onPressed: () => Navigator.pop(context, ImageSource.gallery),
                child: const Text("Gallery"),
              ),
            ],
          );
        },
      );
      if (source != null) {
        imagePicker(source);
      }
    }

    return (imageList.isEmpty)
        ? InkWell(
            onTap: () {
              chooseImageSource(context);
            },
            child: Container(
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
            ))
        : SizedBox(
            height: getPropHeight(175),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: imageList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          right: getPropWidth(7),
                        ),
                        child: SizedBox(
                          height: getPropHeight(169),
                          width: getPropWidth(175),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              getPropWidth(8),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: (imageList[index] is String) // Work on this.
                                ? Image.network(
                                    imageList[index].toString(),
                                    fit: BoxFit.fill,
                                  )
                                : Image.file(
                                    imageList[index],
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: getPropWidth(.05),
                ),
                IconButton(
                  onPressed: () {
                    chooseImageSource(context);
                  },
                  icon: Icon(
                    Icons.add_a_photo_outlined,
                    size: 16,
                    color: regularTextColor.withOpacity(0.3),
                  ),
                )
              ],
            ),
          );
  }
}

// ignore: must_be_immutable
class ColorField extends ConsumerWidget {
  ColorField({
    super.key,
    required this.listColors,
  });
  List<dynamic> listColors;
  Color hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) {
      buffer.write('ff'); // Add alpha if it's not included in the hex string
    }
    buffer.write(hexString.replaceAll('#', ''));

    return Color(int.parse(buffer.toString(), radix: 16));
  }

  bool operationExecuted = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    buildColorPicker() => Expanded(
          child: MaterialPicker(
            pickerColor: Colors.transparent,
            enableLabel: false,
            onColorChanged: (color) {
              ref.read(colorListProvider.notifier).state.add(color);
            },
          ),
        );
    final colorList = ref.watch(readColorList);
    final refreshColors = ref.read(refreshColorList);
    return Container(
      height: getPropHeight(60),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.rectangle,
        border:
            Border.all(style: BorderStyle.solid, color: textFieldBorderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            colorList.when(
              data: (colors) {
                return (colors.isEmpty)
                    ? Text(
                        'Select Colors',
                        style: subTextStyle.copyWith(
                          fontSize: 18,
                        ),
                      )
                    : SizedBox(
                        width: getPropWidth(300),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: colors.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                width: getPropWidth(24),
                                height: getPropHeight(24),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colors[index],
                                ),
                              ),
                            );
                          },
                        ),
                      );
              },
              error: (error, stackTrace) {
                return Text(
                  'No color selected yet',
                  style: subTextStyle.copyWith(
                    fontSize: 18,
                  ),
                );
              },
              loading: () {
                return const RefreshProgressIndicator(
                  color: primaryColor,
                  strokeWidth: 2.0,
                );
              },
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
                          ref.read(colorListProvider.notifier).state.addAll(
                                listColors.map(
                                  (hexValue) => hexToColor(hexValue),
                                ),
                              );
                          refreshColors(colorList);
                          final colorListNew = ref.watch(colorListProvider);
                          debugPrint(colorListNew.toString());
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
            )
          ],
        ),
      ),
    );
  }
}
