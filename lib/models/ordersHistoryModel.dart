// ignore_for_file: file_names
class OrdersHistory {
  final String buyerFirstName, buyerLastName, goodsName, price, date, address;
  final bool inProgress, cancelled, completed;

  OrdersHistory({
    required this.address,
    required this.date,
    required this.buyerFirstName,
    required this.buyerLastName,
    required this.goodsName,
    required this.price,
    this.inProgress = false,
    this.cancelled = false,
    this.completed = false,
  });
}