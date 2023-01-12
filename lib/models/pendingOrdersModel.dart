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