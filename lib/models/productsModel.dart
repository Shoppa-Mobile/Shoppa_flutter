// ignore_for_file: file_names

class ProductsModel {
  final int productID;
  final String productName;
  final String productDescription;
  final double productPrice;
  final List<ImageModel> images;
  final List<ColorModel> colors;

  ProductsModel({
    required this.productID,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
   required this.images,
    required this.colors,
  });

//   ProductsModel.unknown()
//       : productID = 0,
//         productName = '',
//         productDescription = '',
//         productPrice = 0,
//         goodsImage = {};

//   factory ProductsModel.fromJson(Map<dynamic, dynamic> json) {
//     return ProductsModel(
//       productID: json['id'],
//       productName: json['name'],
//       productDescription: json['description'],
//       productPrice: json['price'],
//       goodsImage: json['images'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['name'] = productName;
//     data['description'] = productDescription;
//     data['price'] = productPrice;

//     return data;
//   }
}

class ImageModel {
  final String name;
  final String fileName;
  final String uuid;
  final String previewUrl;
  final String originalUrl;
  final String order;
  final List<String> customProperties;
  final String extension;
  final String size;

  ImageModel({
    required this.name,
    required this.fileName,
    required this.uuid,
    required this.previewUrl,
    required this.originalUrl,
    required this.order,
    required this.customProperties,
    required this.extension,
    required this.size,
  });
}

class ColorModel {
  final String name;
  final String hex;

  ColorModel({
    required this.name,
    required this.hex,
  });
}
