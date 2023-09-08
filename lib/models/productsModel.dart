// ignore_for_file: file_names

class ProductsModel {
  final int productID;
  final String productName;
  final String productDescription;
  final double productPrice;
  final List<dynamic> images;
  final List<dynamic> colors;

  ProductsModel({
    required this.productID,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.images,
    required this.colors,
  });
}

class ColorModel {
  final String? name;
  final String hex;

  ColorModel({
    this.name,
    required this.hex,
  });
}
