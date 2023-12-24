class Order {
  final int userId;
  final List<Product> products;

  Order({required this.userId, required this.products});

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }
}

class Product {
  final int id;
  final int quantity;

  Product({required this.id, required this.quantity});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
    };
  }
}
