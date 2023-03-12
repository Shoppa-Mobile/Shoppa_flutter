// ignore_for_file: file_names
import 'package:flutter/material.dart';

class SocialIconModel {
  final String icon;
  final String iconName;
  final GestureTapCallback pressed;

  SocialIconModel({
    required this.icon,
    required this.iconName,
    required this.pressed,
  });
}

List<SocialIconModel> demoSocials = [
  SocialIconModel(
    icon: 'assets/images/whatsapp.png',
    iconName: 'Whatsapp',
    pressed: () {},
  ),
  SocialIconModel(
    icon: 'assets/images/bluetooth.png',
    iconName: 'Bluetooth',
    pressed: () {},
  ),
  SocialIconModel(
    icon: 'assets/images/gmail.png',
    iconName: 'Gmail',
    pressed: () {},
  ),
  SocialIconModel(
    icon: 'assets/images/googleDrive.png',
    iconName: 'Google Drive',
    pressed: () {},
  ),
  SocialIconModel(
    icon: 'assets/images/instagram.png',
    iconName: 'Instagram',
    pressed: () {},
  ),
  SocialIconModel(
    icon: 'assets/images/printer.png',
    iconName: 'Printer',
    pressed: () {},
  ),
];
