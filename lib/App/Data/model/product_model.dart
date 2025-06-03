class ProductModel {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final int categoryId; // Link to a category

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
  });
}