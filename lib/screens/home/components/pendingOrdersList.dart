// ignore_for_file: file_names
class PendingOrders {
  final String buyerFirstName, buyerLastName;
  final String price;
  final String goodsName;
  bool inTransit;

  PendingOrders(
      {required this.buyerFirstName,
      required this.buyerLastName,
      required this.price,
      required this.goodsName,
      this.inTransit = true});
}

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
