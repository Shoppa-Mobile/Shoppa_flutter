// ignore_for_file: file_names
class OrderDetailsArguments {
  final String buyerFirstName, buyerLastName, goodsName, price, date, address;
  final bool inTransit, processing, notProcessed;

  OrderDetailsArguments(
      {required this.address,
      required this.buyerFirstName,
      required this.buyerLastName,
      required this.goodsName,
      required this.price,
      required this.date,
      required this.inTransit,
      required this.processing,
      required this.notProcessed});
}
