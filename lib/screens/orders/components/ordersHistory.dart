// ignore_for_file: file_names
class OrdersHistory {
  final String buyerName, goodsName, price;
  final bool inTransit, processing, notProcessed;

  OrdersHistory({
    required this.buyerName,
    required this.goodsName,
    required this.price,
    this.inTransit = false,
    this.processing = false,
    this.notProcessed = false,
  });
}

List<OrdersHistory> demoHistory = [
  OrdersHistory(
      buyerName: "Oluwagbemiloke Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag",
      inTransit: true),
  OrdersHistory(
      buyerName: "Oluwagbemiloke Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag",
      processing: true),
  OrdersHistory(
      buyerName: "Oluwagbemiloke Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag",
      inTransit: true),
  OrdersHistory(
      buyerName: "Oluwagbemiloke Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag",
      notProcessed: true),
  OrdersHistory(
      buyerName: "Oluwagbemiloke Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag",
      inTransit: true),
  OrdersHistory(
      buyerName: "Oluwagbemiloke Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag",
      inTransit: true),
  OrdersHistory(
      buyerName: "Oluwagbemiloke Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag",
      notProcessed: true),
  OrdersHistory(
      buyerName: "Oluwagbemiloke Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag",
      processing: true),
  OrdersHistory(
      buyerName: "Oluwagbemiloke Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag",
      inTransit: true),
  OrdersHistory(
      buyerName: "Oluwagbemiloke Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag",
      notProcessed: true)
];
