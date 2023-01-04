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