// ignore_for_file: file_names
import 'package:shoppa_app/models/notificationModel.dart';
import '../models/inventoryModel.dart';
import '../models/ordersHistoryModel.dart';
import '../models/pendingOrdersModel.dart';

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
      price: "20,000",
      goodsName: "10X Garri, 1X Versace Bag",
      address: "12 Sanwo-Ola Close, Agbara, Lagos, Nigeria",
      inTransit: true),
  OrdersHistory(
      buyerFirstName: "Eugene",
      buyerLastName: 'Adavore',
      date: "10th September 2022",
      price: "10,000",
      goodsName: "10X Garri, 1X Versace Bag",
      address: "12 Sanwo-Ola Close, Agbara, Lagos, Nigeria",
      processing: true),
  OrdersHistory(
      buyerFirstName: "Blessing",
      buyerLastName: "Abiodun Igwe",
      date: "10th September 2022",
      price: "15,000",
      goodsName: "10X Garri, 1X Versace Bag",
      address: "12 Sanwo-Ola Close, Agbara, Lagos, Nigeria",
      inTransit: true),
  OrdersHistory(
      buyerFirstName: "Daniel",
      buyerLastName: "Patanni",
      price: "1,000",
      date: "10th September 2022",
      goodsName: "10X Garri, 1X Versace Bag",
      address: "12 Sanwo-Ola Close, Agbara, Lagos, Nigeria",
      notProcessed: true),
  OrdersHistory(
      buyerFirstName: "Haminat",
      buyerLastName: "Abdulazeez",
      date: "10th September 2022",
      price: "150,000",
      goodsName: "10X Garri, 1X Versace Bag",
      address: "12 Sanwo-Ola Close, Agbara, Lagos, Nigeria",
      inTransit: true),
  OrdersHistory(
      date: "10th September 2022",
      buyerFirstName: "Oluwagbemiloke",
      buyerLastName: 'Busayomi',
      price: "20,000",
      goodsName: "10X Garri, 1X Versace Bag",
      address: "12 Sanwo-Ola Close, Agbara, Lagos, Nigeria",
      inTransit: true),
  OrdersHistory(
      buyerFirstName: "Blessing",
      buyerLastName: "Abiodun Igwe",
      date: "10th September 2022",
      price: "15,000",
      goodsName: "10X Garri, 1X Versace Bag",
      address: "12 Sanwo-Ola Close, Agbara, Lagos, Nigeria",
      inTransit: true),
  OrdersHistory(
      buyerFirstName: "Haminat",
      buyerLastName: "Abdulazeez",
      date: "10th September 2022",
      price: "150,000",
      goodsName: "10X Garri, 1X Versace Bag",
      address: "12 Sanwo-Ola Close, Agbara, Lagos, Nigeria",
      inTransit: true),
  OrdersHistory(
      buyerFirstName: "Eugene",
      buyerLastName: 'Adavore',
      date: "10th September 2022",
      price: "10,000",
      goodsName: "10X Garri, 1X Versace Bag",
      address: "12 Sanwo-Ola Close, Agbara, Lagos, Nigeria",
      processing: true),
  OrdersHistory(
      buyerFirstName: "Daniel",
      buyerLastName: "Patanni",
      price: "1,000",
      date: "10th September 2022",
      goodsName: "10X Garri, 1X Versace Bag",
      address: "12 Sanwo-Ola Close, Agbara, Lagos, Nigeria",
      notProcessed: true)
];

List<InventoryList> demoInventory = [
  InventoryList(
    goodsImage: 'assets/images/Image 1.png',
    goodsName: 'Gorgeous Dior Bag',
    price: '6500',
    outOfStock: false,
  ),
  InventoryList(
      goodsImage: 'assets/images/Image 2.png',
      goodsName: '4 in 1 Bracelets',
      price: '6500'),
  InventoryList(
    goodsImage: 'assets/images/Image 3.png',
    goodsName: 'Sets of Hand Jewellrey',
    price: '6500',
    outOfStock: false,
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
    outOfStock: false,
  ),
  InventoryList(
    goodsImage: 'assets/images/Image 4.png',
    goodsName: 'Lorep Ipsum',
    price: '6500',
    outOfStock: false,
  ),
  InventoryList(
    goodsImage: 'assets/images/Image 5.png',
    goodsName: 'Lorep Ipsum',
    price: '6500',
    outOfStock: false,
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
