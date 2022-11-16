// ignore_for_file: file_names
class PendingOrders {
  final String buyerName;
  final String price;
  final String goodsName;
  bool inTransit;

  PendingOrders(
      {required this.buyerName,
      required this.price,
      required this.goodsName,
      this.inTransit = true});
}

List<PendingOrders> demoOrders = [
  PendingOrders(
      buyerName: "Oluwagbemiloke Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag"),
  PendingOrders(
      buyerName: "Oluwagbemiloke Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag",
      inTransit: false),
  PendingOrders(
      buyerName: "Oluwagbemiloke Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag"),
  PendingOrders(
      buyerName: "Oluwagbemiloke Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag",
      inTransit: false),
  PendingOrders(
      buyerName: "Oluwagbemiloke Busayomi",
      price: "1000",
      goodsName: "10X Garri, 1X Versace Bag")
];
