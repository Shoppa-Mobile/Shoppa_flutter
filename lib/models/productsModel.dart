// ignore_for_file: file_names

class ProductsModel {
  final int productID;
  final String productName;
  final String productDescription;
  final double productPrice;
  final List<Map<String, dynamic>> goodsImage;

  ProductsModel({
    required this.productID,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.goodsImage,
  });

  ProductsModel.unknown()
      : productID = 0,
        productName = '',
        productDescription = '',
        productPrice = 0,
        goodsImage = [];

  factory ProductsModel.fromJson(Map<dynamic, dynamic> json) {
    return ProductsModel(
      productID: json['id'],
      productName: json['name'],
      productDescription: json['description'],
      productPrice: json['price'],
      goodsImage: json['images'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = productName;
    data['description'] = productDescription;
    data['price'] = productPrice;

    return data;
  }
}
