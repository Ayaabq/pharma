// // class Order {
// //   final int userId;
// //   final List<Product> products;
// //
// //   Order({required this.userId, required this.products});
// //
// //   Map<String, dynamic> toJson() {
// //     return {
// //       'user_id': userId,
// //       'products': products.map((product) => product.toJson()).toList(),
// //     };
// //   }
// // }
// //
// // class Product {
// //   final int id;
// //   final int quantity;
// //
// //   Product({required this.id, required this.quantity});
// //
// //   Map<String, dynamic> toJson() {
// //     return {
// //       'id': id,
// //       'quantity': quantity,
// //     };
// //   }
// // }
//
// class OrderModel {
//   // int userId;
//   // List<Product> products;
//
//   OrderModel({
//     String? userId,
//     List<dynamic>? products,
//   }) {
//     _userId = userId;
//     _products = products;
//   }
//
//   // OrderModel({required this.userId, required this.products});
//
//   factory OrderModel.fromJson(Map<String, dynamic> json) {
//     var productsList = json['products'] as List;
//     List<Product> productList =
//         productsList.map((product) => Product.fromJson(product)).toList();
//
//     return OrderModel(
//       userId: json['user_id'],
//       products: productList,
//     );
//   }
// }
//
// class Product {
//   int id;
//   int quantity;
//
//   Product({required this.id, required this.quantity});
//
//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       quantity: json['quantity'],
//     );
//   }
// }
