// ignore_for_file: file_names, avoid_print
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppa_app/components/defaultButton.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import '../../../constants/constants.dart';

class NINUploadContent extends StatefulWidget {
  const NINUploadContent({super.key});

  @override
  State<NINUploadContent> createState() => _NINUploadContentState();
}

class _NINUploadContentState extends State<NINUploadContent> {
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
              Text("NIN", style: headerStyle2),
              const SizedBox(height: 16),
              Text('Upload a picture of your National Identification Card',
                  style: subHeaderStyle),
              SizedBox(
                height: getPropHeight(45),
              ),
              InkWell(
                  onTap: () {
                    imagePicker(ImageSource.gallery);
                  },
                  child: image == null
                      ? Container(
                          height: getPropHeight(226),
                          width: getPropWidth(379),
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
                      : Padding(
                          padding: EdgeInsets.all(getPropWidth(10)),
                          child: Image.file(_image!))),
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
                press: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
