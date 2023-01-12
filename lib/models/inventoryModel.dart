// ignore_for_file: file_names
class InventoryList {
  final String goodsImage, goodsName, price;
  final bool outOfStock;

  InventoryList(
      {required this.goodsImage,
      required this.goodsName,
      required this.price,
      this.outOfStock = false});
}