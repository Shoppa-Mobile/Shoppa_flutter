// ignore_for_file: file_names
import 'package:shoppa_app/models/notificationModel.dart';
import '../models/inventoryModel.dart';
import '../models/ordersHistoryModel.dart';
import '../models/pendingOrdersModel.dart';

List<Map<String, String>> onBoardingData = [
  {
    'text1': "Manage all your shoppa’s, in one app.",
    'text2':
        "Reduce the stress of running your business across multiple social media platforms. With Shoppa, you get to easily manage business from one spot.",
    'buttontext': "Create Account",
    'image': 'assets/images/Onboarding_img_1.png'
  },
  {
    'text1': "Get a personal shop for your business.",
    'text2':
        "Have all your products displayed in your shop and improve customer satisfaction with  page, share your product page and have your customers enjoy shopping better.",
    'buttontext': "Create Account",
    'image': 'assets/images/Onboarding_img_2.png'
  },
  {
    'text1': "Get Started",
    'text2': '',
    'buttontext': "Create Account",
    'image': 'assets/images/Onboarding_img_3.png'
  }
];

List<NotificationModel> demoNotifications = [
  NotificationModel(
      date: "10th September 2022",
      time: "9:00AM",
      message: "Oluwagbemiloke Busayomi's order has been delivered"),
  NotificationModel(
      date: "10th September 2022",
      time: "9:00AM",
      message: "Oluwagbemiloke Busayomi's order has been delivered"),
  NotificationModel(
      date: "10th September 2022",
      time: "9:00AM",
      message: "Oluwagbemiloke Busayomi's order has been delivered"),
  NotificationModel(
      date: "10th September 2022",
      time: "9:00AM",
      message: "Oluwagbemiloke Busayomi's order has been delivered"),
  NotificationModel(
      date: "10th September 2022",
      time: "9:00AM",
      message: "Oluwagbemiloke Busayomi's order has been delivered"),
  NotificationModel(
      date: "10th September 2022",
      time: "9:00AM",
      message: "Oluwagbemiloke Busayomi's order has been delivered"),
  NotificationModel(
      date: "10th September 2022",
      time: "9:00AM",
      message: "Oluwagbemiloke Busayomi's order has been delivered"),
  NotificationModel(
      date: "10th September 2022",
      time: "9:00AM",
      message: "Oluwagbemiloke Busayomi's order has been delivered"),
  NotificationModel(
      date: "10th September 2022",
      time: "9:00AM",
      message: "Oluwagbemiloke Busayomi's order has been delivered"),
  NotificationModel(
      date: "10th September 2022",
      time: "9:00AM",
      message: "Oluwagbemiloke Busayomi's order has been delivered"),
  NotificationModel(
      date: "10th September 2022",
      time: "9:00AM",
      message: "Oluwagbemiloke Busayomi's order has been delivered"),
  NotificationModel(
      date: "10th September 2022",
      time: "9:00AM",
      message: "Oluwagbemiloke Busayomi's order has been delivered"),
  NotificationModel(
      date: "10th September 2022",
      time: "9:00AM",
      message: "Oluwagbemiloke Busayomi's order has been delivered"),
  NotificationModel(
      date: "10th September 2022",
      time: "9:00AM",
      message: "Oluwagbemiloke Busayomi's order has been delivered"),
  NotificationModel(
      date: "10th September 2022",
      time: "9:00AM",
      message: "Oluwagbemiloke Busayomi's order has been delivered"),
  NotificationModel(
      date: "10th September 2022",
      time: "9:00AM",
      message: "Oluwagbemiloke Busayomi's order has been delivered"),
];

List<OrdersHistory> demoHistory = [
  OrdersHistory(
      date: "10th September 2022",
      buyerFirstName: "Oluwagbemiloke",
      buyerLastName: 'Busayomi',
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag",
      address: "12 Sanwo-Ola Close, Agbara, Lagos, Nigeria",
      inProgress: true),
  OrdersHistory(
      buyerFirstName: "Eugene",
      buyerLastName: 'Adavore',
      date: "10th September 2022",
      price: "10,000",
      goodsName: "10X Garri, 1X Versace Bag",
      address: "12 Sanwo-Ola Close, Agbara, Lagos, Nigeria",
      cancelled: true),
  OrdersHistory(
      buyerFirstName: "Blessing",
      buyerLastName: "Abiodun Igwe",
      date: "10th September 2022",
      price: "15,000",
      goodsName: "10X Garri, 1X Versace Bag",
      address: "12 Sanwo-Ola Close, Agbara, Lagos, Nigeria",
      inProgress: true),
  OrdersHistory(
      buyerFirstName: "Daniel",
      buyerLastName: "Patanni",
      price: "1,000",
      date: "10th September 2022",
      goodsName: "10X Garri, 1X Versace Bag",
      address: "12 Sanwo-Ola Close, Agbara, Lagos, Nigeria",
      completed: true),
  OrdersHistory(
      buyerFirstName: "Haminat",
      buyerLastName: "Abdulazeez",
      date: "10th September 2022",
      price: "150,000",
      goodsName: "10X Garri, 1X Versace Bag",
      address: "12 Sanwo-Ola Close, Agbara, Lagos, Nigeria",
      inProgress: true),
  OrdersHistory(
      date: "10th September 2022",
      buyerFirstName: "Oluwagbemiloke",
      buyerLastName: 'Busayomi',
      price: "100",
      goodsName: "10X Garri, 1X Versace Bag",
      address: "12 Sanwo-Ola Close, Agbara, Lagos, Nigeria",
      inProgress: true),
  OrdersHistory(
      buyerFirstName: "Blessing",
      buyerLastName: "Abiodun Igwe",
      date: "10th September 2022",
      price: "15,000",
      goodsName: "10X Garri, 1X Versace Bag",
      address: "12 Sanwo-Ola Close, Agbara, Lagos, Nigeria",
      cancelled: true),
  OrdersHistory(
      buyerFirstName: "Haminat",
      buyerLastName: "Abdulazeez",
      date: "10th September 2022",
      price: "150,000",
      goodsName: "10X Garri, 1X Versace Bag",
      address: "12 Sanwo-Ola Close, Agbara, Lagos, Nigeria",
      inProgress: true),
  OrdersHistory(
      buyerFirstName: "Eugene",
      buyerLastName: 'Adavore',
      date: "10th September 2022",
      price: "10,000",
      goodsName: "10X Garri, 1X Versace Bag",
      address: "12 Sanwo-Ola Close, Agbara, Lagos, Nigeria",
      completed: true),
  OrdersHistory(
      buyerFirstName: "Daniel",
      buyerLastName: "Patanni",
      price: "1,000",
      date: "10th September 2022",
      goodsName: "10X Garri, 1X Versace Bag",
      address: "12 Sanwo-Ola Close, Agbara, Lagos, Nigeria",
      completed: true)
];

List<InventoryList> demoInventory = [
  InventoryList(
    goodsImage: 'assets/images/Image 1.png',
    goodsName: 'Gorgeous Dior Bag',
    price: '6500',
    outOfStock: true,
  ),
  InventoryList(
      goodsImage: 'assets/images/Image 2.png',
      goodsName: '4 in 1 Bracelets',
      price: '6500'),
  InventoryList(
    goodsImage: 'assets/images/Image 3.png',
    goodsName: 'Sets of Hand Jewellrey',
    price: '6500',
    outOfStock: true,
  ),
  InventoryList(
      goodsImage: 'assets/images/Image 4.png',
      goodsName: 'Set of Ear jewellery',
      price: '6500'),
  InventoryList(
      goodsImage: 'assets/images/Image 5.png',
      goodsName: 'Big T-Shirts',
      price: '6500'),
  InventoryList(
      goodsImage: 'assets/images/Image 6.png',
      goodsName: 'Long-Sleeved Tur...',
      price: '6500'),
  InventoryList(
    goodsImage: 'assets/images/Image 2.png',
    goodsName: 'Lorep Ipsum',
    price: '6500',
    outOfStock: true,
  ),
  InventoryList(
    goodsImage: 'assets/images/Image 4.png',
    goodsName: 'Lorep Ipsum',
    price: '6500',
    outOfStock: true,
  ),
  InventoryList(
    goodsImage: 'assets/images/Image 5.png',
    goodsName: 'Lorep Ipsum',
    price: '6500',
    outOfStock: true,
  ),
  InventoryList(
      goodsImage: 'assets/images/Image 1.png',
      goodsName: 'Lorep Ipsum',
      price: '6500'),
  InventoryList(
      goodsImage: 'assets/images/Image 3.png',
      goodsName: 'Lorep Ipsum',
      price: '6500'),
];

List<PendingOrders> demoOrders = [
  PendingOrders(
      buyerFirstName: "Oluwagbemiloke",
      buyerLastName: "Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag"),
  PendingOrders(
      buyerFirstName: "Oluwagbemiloke",
      buyerLastName: "Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag",
      inTransit: false),
  PendingOrders(
      buyerFirstName: "Oluwagbemiloke",
      buyerLastName: "Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag"),
  PendingOrders(
      buyerFirstName: "Oluwagbemiloke",
      buyerLastName: "Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag",
      inTransit: false),
  PendingOrders(
      buyerFirstName: "Oluwagbemiloke",
      buyerLastName: "Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag"),
  PendingOrders(
      buyerFirstName: "Oluwagbemiloke",
      buyerLastName: "Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag",
      inTransit: false),
  PendingOrders(
      buyerFirstName: "Oluwagbemiloke",
      buyerLastName: "Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag"),
  PendingOrders(
      buyerFirstName: "Oluwagbemiloke",
      buyerLastName: "Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag",
      inTransit: false),
  PendingOrders(
      buyerFirstName: "Oluwagbemiloke",
      buyerLastName: "Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag"),
  PendingOrders(
      buyerFirstName: "Oluwagbemiloke",
      buyerLastName: "Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag"),
];
