// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/constants.dart';

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
    decoration:
        textFieldDecoration('Enter Description').copyWith(hintMaxLines: 3),
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
