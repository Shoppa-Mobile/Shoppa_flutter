// ignore_for_file: file_names
class OrderDetailsArguments {
  final String buyerFirstName, buyerLastName, goodsName, price, date, address;
  final bool inTransit, completed, cancelled;

  OrderDetailsArguments(
      {required this.address,
      required this.buyerFirstName,
      required this.buyerLastName,
      required this.goodsName,
      required this.price,
      required this.date,
      required this.inTransit,
      required this.completed,
      required this.cancelled});
}

class UserData1Arguments {
  final String firstName;
  final String lastName;
  final String phoneNum;
  final String email;

  UserData1Arguments({
    required this.firstName,
    required this.lastName,
    required this.phoneNum,
    required this.email,
  });
}
