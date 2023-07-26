// ignore_for_file: file_names

class ProductsModel {
  final String productName;
  final String productDescription;
  final int productPrice;

  ProductsModel({
    required this.productName,
    required this.productDescription,
    required this.productPrice,
  });

  ProductsModel.unknown()
      : productName = '',
        productDescription = '',
        productPrice = 0;

  factory ProductsModel.fromJson(Map<dynamic, dynamic> json) => ProductsModel(
        productName: json['name'],
        productDescription: json['description'],
        productPrice: json['price'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = productName;
    data['description'] = productDescription;
    data['price'] = productPrice;

    return data;
  }
}
