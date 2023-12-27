/// user_id : "1"
/// order_price : 500
/// products : [{"quantity":"4","id":"1"},{"id":"1","quantity":"5"}]

class Ordermodel {
  Ordermodel({
    String? userId,
    num? orderPrice,
    List<Products>? products,
  }) {
    _userId = userId;
    _orderPrice = orderPrice;
    _products = products;
  }

  Ordermodel.fromJson(dynamic json) {
    _userId = json['user_id'];
    _orderPrice = json['order_price'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }
  String? _userId;
  num? _orderPrice;
  List<Products>? _products;
  Ordermodel copyWith({
    String? userId,
    num? orderPrice,
    List<Products>? products,
  }) =>
      Ordermodel(
        userId: userId ?? _userId,
        orderPrice: orderPrice ?? _orderPrice,
        products: products ?? _products,
      );
  String? get userId => _userId;
  num? get orderPrice => _orderPrice;
  List<Products>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['order_price'] = _orderPrice;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// quantity : "4"
/// id : "1"

class Products {
  Products({
    String? quantity,
    String? id,
  }) {
    _quantity = quantity;
    _id = id;
  }

  Products.fromJson(dynamic json) {
    _quantity = json['quantity'];
    _id = json['id'];
  }
  String? _quantity;
  String? _id;
  Products copyWith({
    String? quantity,
    String? id,
  }) =>
      Products(
        quantity: quantity ?? _quantity,
        id: id ?? _id,
      );
  String? get quantity => _quantity;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quantity'] = _quantity;
    map['id'] = _id;
    return map;
  }
}
