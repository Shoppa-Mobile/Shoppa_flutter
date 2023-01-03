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

List<InventoryList> demoInventory = [
  InventoryList(
    goodsImage: 'assets/images/Image 1.png',
    goodsName: 'Gorgeous Dior Bag',
    price: '6500',
    outOfStock: false,
  ),
  InventoryList(
      goodsImage: 'assets/images/Image 2.png',
      goodsName: '4 in 1 Bracelets',
      price: '6500'),
  InventoryList(
    goodsImage: 'assets/images/Image 3.png',
    goodsName: 'Sets of Hand Jewellrey',
    price: '6500',
    outOfStock: false,
  ),
  InventoryList(
      goodsImage: 'assets/images/Image 4.png',
      goodsName: 'Set of Ear jewellery',
      price: '6500'),
  InventoryList(
      goodsImage: 'assets/images/Image 5.png',
      goodsName: 'Big T-Shirts',
      price: '6500'),
  InventoryList(
      goodsImage: 'assets/images/Image 6.png',
      goodsName: 'Long-Sleeved Tur...',
      price: '6500'),
  InventoryList(
    goodsImage: 'assets/images/Image 2.png',
    goodsName: 'Lorep Ipsum',
    price: '6500',
    outOfStock: false,
  ),
  InventoryList(
    goodsImage: 'assets/images/Image 4.png',
    goodsName: 'Lorep Ipsum',
    price: '6500',
    outOfStock: false,
  ),
  InventoryList(
    goodsImage: 'assets/images/Image 5.png',
    goodsName: 'Lorep Ipsum',
    price: '6500',
    outOfStock: false,
  ),
  InventoryList(
      goodsImage: 'assets/images/Image 1.png',
      goodsName: 'Lorep Ipsum',
      price: '6500'),
  InventoryList(
      goodsImage: 'assets/images/Image 3.png',
      goodsName: 'Lorep Ipsum',
      price: '6500'),
];
