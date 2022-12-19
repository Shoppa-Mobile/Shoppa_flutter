// ignore_for_file: file_names
class OrdersHistory {
  final String buyerFirstName, buyerLastName, goodsName, price, date;
  final bool inTransit, processing, notProcessed;

  OrdersHistory({
    required this.date,
    required this.buyerFirstName,
    required this.buyerLastName,
    required this.goodsName,
    required this.price,
    this.inTransit = false,
    this.processing = false,
    this.notProcessed = false,
  });
}

List<OrdersHistory> demoHistory = [
  OrdersHistory(
      date: "10th September 2022",
      buyerFirstName: "Oluwagbemiloke",
      buyerLastName: 'Busayomi',
      price: "20,000",
      goodsName: "10X Garri, 1X Versace Bag",
      inTransit: true),
  OrdersHistory(
      buyerFirstName: "Eugene",
      buyerLastName: 'Adavore',
      date: "10th September 2022",
      price: "10,000",
      goodsName: "10X Garri, 1X Versace Bag",
      processing: true),
  OrdersHistory(
      buyerFirstName: "Blessing",
      buyerLastName: "Abiodun Igwe",
      date: "10th September 2022",
      price: "15,000",
      goodsName: "10X Garri, 1X Versace Bag",
      inTransit: true),
  OrdersHistory(
      buyerFirstName: "Daniel",
      buyerLastName: "Patanni",
      price: "1,000",
      date: "10th September 2022",
      goodsName: "10X Garri, 1X Versace Bag",
      notProcessed: true),
  OrdersHistory(
      buyerFirstName: "Haminat",
      buyerLastName: "Abdulazeez",
      date: "10th September 2022",
      price: "150,000",
      goodsName: "10X Garri, 1X Versace Bag",
      inTransit: true),
  OrdersHistory(
      date: "10th September 2022",
      buyerFirstName: "Oluwagbemiloke",
      buyerLastName: 'Busayomi',
      price: "20,000",
      goodsName: "10X Garri, 1X Versace Bag",
      inTransit: true),
  OrdersHistory(
      buyerFirstName: "Blessing",
      buyerLastName: "Abiodun Igwe",
      date: "10th September 2022",
      price: "15,000",
      goodsName: "10X Garri, 1X Versace Bag",
      inTransit: true),
  OrdersHistory(
      buyerFirstName: "Haminat",
      buyerLastName: "Abdulazeez",
      date: "10th September 2022",
      price: "150,000",
      goodsName: "10X Garri, 1X Versace Bag",
      inTransit: true),
  OrdersHistory(
      buyerFirstName: "Eugene",
      buyerLastName: 'Adavore',
      date: "10th September 2022",
      price: "10,000",
      goodsName: "10X Garri, 1X Versace Bag",
      processing: true),
  OrdersHistory(
      buyerFirstName: "Daniel",
      buyerLastName: "Patanni",
      price: "1,000",
      date: "10th September 2022",
      goodsName: "10X Garri, 1X Versace Bag",
      notProcessed: true)
];
