// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';

class ImagepickerWidget extends StatefulWidget {
  const ImagepickerWidget({
    super.key,
    required this.envelopingwidget,
  });

  final Widget envelopingwidget;

  @override
  State<ImagepickerWidget> createState() => _ImagepickerWidgetState();
}

class _ImagepickerWidgetState extends State<ImagepickerWidget> {
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
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
    return null;
  }

  Future<File> _getImageFromGallery() async {
    var status = await Permission.photos.request();
    File? itemImage;
    if (status.isGranted) {
      try {
        var image = await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image != null) {
          setState(() {
            itemImage = File(image.path);
          });
        } else {
          debugPrint('Image returned is null');
        }
      } on PlatformException catch (e) {
        debugPrint('Failed to pick image: $e');
      }
    } else {
      // Handle the case when the user denies access
      debugPrint('User has denied you access to the gallery.');
    }
    return itemImage!;
  }

  Future<File> _getImageFromCamera() async {
    var status = await Permission.camera.request();
    File? itemImage;
    if (status.isGranted) {
      try {
        var image = await ImagePicker().pickImage(source: ImageSource.camera);
        if (image != null) {
          setState(() {
            itemImage = File(image.path);
          });
        } else {
          debugPrint('Image returned is null');
        }
      } on PlatformException catch (e) {
        debugPrint('Failed to pick image: $e');
      }
    } else {
      // Handle the case when the user denies access
      debugPrint('User has denied you access to the gallery.');
    }
    return itemImage!;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: widget.envelopingwidget,
      onTap: () => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                child: Text(
                  'Select from Gallery',
                  style: headerStyle3.copyWith(
                    color: primaryColor,
                  ),
                ),
                onPressed: () {
                  _getImageFromGallery();
                },
              ),
              TextButton(
                child: Text(
                  'Take a photo',
                  style: headerStyle3.copyWith(
                    color: primaryColor,
                  ),
                ),
                onPressed: () {
                  _getImageFromCamera();
                },
              ),
            ],
          ));
        },
      ),
    );
  }
}
