// ignore_for_file: file_names
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/screens/home/homeScreen.dart';
import 'package:shoppa_app/widgets/defaultButton.dart';
import 'package:image_picker/image_picker.dart';

class DriLicenseUploadContent extends StatefulWidget {
  const DriLicenseUploadContent({super.key});

  @override
  State<DriLicenseUploadContent> createState() =>
      _DriLicenseUploadContentState();
}

class _DriLicenseUploadContentState extends State<DriLicenseUploadContent> {
  XFile? image;
  File? _image;

  Future<XFile?> imagePicker(ImageSource source) async {
    try {
      var imageT = await ImagePicker().pickImage(source: source);
      if (imageT == null) {
        return null;
      }
      final image = File(imageT.path);
      setState(() {
        _image = image;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick image: $e');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropWidth(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getPropHeight(10),
              ),
              Text("Driver's License", style: headerStyle2),
              const SizedBox(height: 16),
              Text("Upload a picture of your Driver's License",
                  style: subHeaderStyle),
              SizedBox(
                height: getPropHeight(45),
              ),
              InkWell(
                  onTap: () {
                    imagePicker(ImageSource.gallery);
                  },
                  child: _image == null
                      ? Container(
                          height: getPropHeight(226),
                          width: SizeConfig.screenWidth - 20,
                          decoration: BoxDecoration(
                              color: subTextColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image,
                                color: subHeaderTextColor,
                                size: getPropHeight(80),
                              ),
                              SizedBox(
                                height: getPropHeight(13),
                              ),
                              Text(
                                "Click to Upload a picture from your phone ",
                                style: subHeaderStyle,
                              )
                            ],
                          )),
                        )
                      : SizedBox(
                          height: getPropHeight(226),
                          width: SizeConfig.screenWidth - 20,
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(getPropWidth(8)),
                              clipBehavior: Clip.hardEdge,
                              child: Image.file(
                                _image!,
                                fit: BoxFit.fill,
                              )))),
              SizedBox(
                height: getPropHeight(38),
              ),
              InkWell(
                onTap: () {
                  imagePicker(ImageSource.camera);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: getPropHeight(24),
                      color: secondaryButtonTextColor,
                    ),
                    const Text(
                      "Use Camera Instead",
                      style: TextStyle(color: secondaryButtonTextColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getPropHeight(52),
              ),
              DefaultButton(
                text: "Submit",
                press: () {
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
