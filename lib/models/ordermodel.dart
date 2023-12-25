/// user_id : 1
/// products : [{"id":1,"quantity":2},{"id":1,"quantity":3}]

class Ordermodel {
  Ordermodel({
    num? userId,
    List<Products>? products,
  }) {
    _userId = userId;
    _products = products;
  }

  Ordermodel.fromJson(dynamic json) {
    _userId = json['user_id'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }
  num? _userId;
  List<Products>? _products;
  Ordermodel copyWith({
    num? userId,
    List<Products>? products,
  }) =>
      Ordermodel(
        userId: userId ?? _userId,
        products: products ?? _products,
      );
  num? get userId => _userId;
  List<Products>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// quantity : 2

class Products {
  Products({
    String? id,
    num? quantity,
  }) {
    _id = id;
    _quantity = quantity;
  }

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _quantity = json['quantity'];
  }
  String? _id;
  num? _quantity;
  Products copyWith({
    String? id,
    num? quantity,
  }) =>
      Products(
        id: id ?? _id,
        quantity: quantity ?? _quantity,
      );
  String? get id => _id;
  num? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['quantity'] = _quantity;
    return map;
  }
}
