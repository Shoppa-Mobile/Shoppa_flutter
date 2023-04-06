import 'package:flutter/material.dart';
import 'package:shoppa_app/screens/auth/authScreen.dart';
import 'package:shoppa_app/screens/auth/signUp/signUpOptionsScreen.dart';
import 'package:shoppa_app/screens/order/createOrder/createOrderScreen.dart';
import 'package:shoppa_app/screens/home/homeScreen.dart';
import 'package:shoppa_app/screens/auth/inputReset/inputNum_screen.dart';
import 'package:shoppa_app/screens/auth/login/login_screen.dart';
import 'package:shoppa_app/screens/notifications/notifications.dart';
import 'package:shoppa_app/screens/auth/onBoarding/onboarding_screen.dart';
import 'package:shoppa_app/screens/order/orderDetails/orderDetailsScreen.dart';
import 'package:shoppa_app/screens/order/orders/ordersScreen.dart';
import 'package:shoppa_app/screens/auth/otp/otpScreen.dart';
import 'package:shoppa_app/screens/profile/PersonalInformationScreen.dart';
import 'package:shoppa_app/screens/profile/ProfileScreen.dart';
import 'package:shoppa_app/screens/auth/proofOfIdentity/driLicenseUpload/driLicenseUploadScreen.dart';
import 'package:shoppa_app/screens/auth/proofOfIdentity/nINUpload/nINUploadScreen.dart';
import 'package:shoppa_app/screens/auth/proofOfIdentity/proofOfIdentityScreen.dart';
import 'package:shoppa_app/screens/auth/proofOfIdentity/utiiBillUpload/utilBillUploadScreen.dart';
import 'package:shoppa_app/screens/auth/proofOfIdentity/votersCardUpload/votersCardUploadScreen.dart';
import 'package:shoppa_app/screens/auth/resetPassword/resetPassword_screen.dart';
import 'package:shoppa_app/screens/auth/signUp/signUp_Screen2.dart';
import 'package:shoppa_app/screens/auth/signUp/signUp_screen1.dart';
import 'package:shoppa_app/screens/profile/SecurityInfoScreen.dart';
import 'package:shoppa_app/screens/profile/SupportInfoScreen.dart';
import 'package:shoppa_app/screens/profile/storeInformationScreen.dart';
import 'package:shoppa_app/screens/shop/addItemScreen.dart';
import 'package:shoppa_app/screens/shop/itemDisplayScreen.dart';
import 'package:shoppa_app/screens/shop/reviewDisplayScreen.dart';
import 'package:shoppa_app/screens/shop/shopScreen.dart';
import 'package:shoppa_app/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  AuthenticationScreen.routeName: (context) => const AuthenticationScreen(),
  OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
  SignUpOptionsScreen.routeName: (context) => const SignUpOptionsScreen(),
  SignUpScreen1.routeName: (context) => const SignUpScreen1(),
  SignUpScreen2.routeName: (context) => const SignUpScreen2(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  InputNumberScreen.routeName: (context) => const InputNumberScreen(),
  ResetPasswordScreen.routeName: (context) => const ResetPasswordScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  ProofOfIdentityScreen.routeName: (context) => const ProofOfIdentityScreen(),
  NINUploadScreen.routeName: (context) => const NINUploadScreen(),
  UtilBillUploadScreen.routeName: (context) => const UtilBillUploadScreen(),
  DriLicenseUploadScreen.routeName: (context) => const DriLicenseUploadScreen(),
  VotersCardUploadScreen.routeName: (context) => const VotersCardUploadScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  Notifications.routeName: (context) => const Notifications(),
  OrdersScreen.routeName: (context) => const OrdersScreen(),
  CreateOrderScreen.routeName: (context) => const CreateOrderScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  OrderDetailsScreen.routeName: (context) => const OrderDetailsScreen(),
  PersonalInformationScreen.routeName: (context) =>
      const PersonalInformationScreen(),
  StoreInformationScreen.routeName: (context) => const StoreInformationScreen(),
  SecurityInfoScreen.routeName: (context) => const SecurityInfoScreen(),
  SupportInfoScreen.routeName: (context) => const SupportInfoScreen(),
  ShopScreen.routeName: (context) => const ShopScreen(),
  ItemDisplayScreen.routeName: (context) => const ItemDisplayScreen(),
  ReviewDisplayScreen.routeName: (context) => const ReviewDisplayScreen(),
  AddItemScreen.routeName: (context) => const AddItemScreen()
};
