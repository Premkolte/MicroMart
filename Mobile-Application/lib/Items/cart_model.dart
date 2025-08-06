class CartItem {
  final String productName;
  final String price;
  final String imagePath;
  final String category;

  CartItem({
    required this.productName,
    required this.price,
    required this.imagePath,
    required this.category,
  });

  // Convert CartItem to JSON
  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'price': price,
      'imagePath': imagePath,
      'category': category,
    };
  }

  // Convert JSON to CartItem
  static CartItem fromJson(Map<String, dynamic> json) {
    return CartItem(
      productName: json['productName'],
      price: json['price'],
      imagePath: json['imagePath'],
      category: json['category'],
    );
  }
}