import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';

TextStyle headerStyle = const TextStyle(
  color: headerTextColor,
  fontFamily: 'Raleway',
  fontSize: 32,
  fontWeight: FontWeight.w600,
);

TextStyle headerStyle2 = const TextStyle(
  color: headerTextColor,
  fontFamily: 'Raleway',
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

TextStyle headerStyle3 = const TextStyle(
  color: headerTextColor,
  fontFamily: 'Raleway',
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

TextStyle whiteHeaderStyle = const TextStyle(
  color: bgColor,
  fontFamily: 'Raleway',
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

TextStyle subHeaderStyle = const TextStyle(
  color: subHeaderTextColor,
  fontFamily: 'Raleway',
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

TextStyle subHeaderStyle2 = const TextStyle(
  color: subHeaderTextColor,
  fontFamily: 'Raleway',
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

TextStyle regTextStyle = const TextStyle(
  color: regularTextColor,
  fontFamily: 'Raleway',
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

TextStyle regTextStyle2 = const TextStyle(
  color: regularTextColor,
  fontFamily: 'Lato',
  fontSize: 12,
  fontWeight: FontWeight.w400,
);

TextStyle subTextStyle = const TextStyle(
  color: subTextColor,
  fontFamily: 'Raleway',
  fontSize: 12,
  fontWeight: FontWeight.w400,
);

TextStyle primaryButtonText = const TextStyle(
  color: primaryButtonTextColor,
  fontFamily: 'Raleway',
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

TextStyle secondaryButtonText = const TextStyle(
  color: secondaryButtonTextColor,
  fontFamily: 'Raleway',
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

TextStyle ordersCardText1 = const TextStyle(
  color: bgColor,
  fontFamily: 'Raleway',
  fontSize: 10,
  fontWeight: FontWeight.w400,
);

TextStyle ordersCardText2 = const TextStyle(
  color: bgColor,
  fontFamily: 'Raleway',
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

TextStyle ordersCardText3 = const TextStyle(
  color: bgColor,
  fontFamily: 'Raleway',
  fontSize: 12,
  fontWeight: FontWeight.w400,
);

TextStyle inventoryPriceText = const TextStyle(
  color: secondaryButtonTextColor,
  fontFamily: 'Raleway',
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

const animationduration = Duration(seconds: 3);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9,]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String emailNullError = "Please enter your email address";
const String invalidEmailError = "Please enter a valid email";
const String passNullError = "Please enter your password";
const String incorrectPassError = "Password is incorrect";
const String shortPassError = "Password is too short";
const String passMatchError = "Password's does not match";
const String nameNullError = "Please enter your name";
const String phoneNumberNullError = "Please enter your phone number";
const String firstNameNullError = "Please enter your First Name";
const String lastNameNullError = "Please enter your Last Name";
const String phoneNumNullError = "Please enter your Phone Number";
const String storeNameNullError = "Please enter your Store Name";
const String addressNullError = "Please enter your Store address";
const String storeNumNullError = "Please enter your Store's Phone Number";

InputDecoration textFieldDecoration(String fieldtext) {
  return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      hintText: fieldtext,
      hintStyle: subTextStyle,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: textFieldBorderColor,
          ),
          gapPadding: 10));
}

InputDecoration textCreateOrderFieldDecoration(String fieldtext) {
  return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      hintText: fieldtext,
      hintStyle: subTextStyle,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: textFieldBorderColor,
          ),
          gapPadding: 10));
}

InputDecoration orderStatusFieldDecoration() {
  return InputDecoration(
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: ordersProgressCardColor.withOpacity(0.5),
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: ordersProgressCardColor.withOpacity(0.5),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: ordersProgressCardColor.withOpacity(0.5),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: ordersProgressCardColor.withOpacity(0.5),
      ),
    ),
  );
}
