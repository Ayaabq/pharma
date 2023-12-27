/// data : [{"id":3,"user_id":2,"status":"In_Preparation","payment_status":"not_paid","order_price":200,"created_at":"2023-12-27T09:05:29.000000Z","updated_at":"2023-12-27T09:05:29.000000Z","products":[{"id":3,"category_id":1,"scientific_name":"انسولين","commercial_name":"بارانسولين","company":"لين","quantity_available":100,"createdat":"2023-12-07","cost":15,"created_at":"2023-12-27T07:13:11.000000Z","updated_at":"2023-12-27T07:13:11.000000Z","pivot":{"order_id":3,"product_id":3,"quantity":3}}]},null]
/// message : "this is your order"

// class OrderDetailsModel {
//   OrderDetailsModel({
//     List<Data>? data,
//     String? message,
//   }) {
//     _data = data;
//     _message = message;
//   }
//
//   OrderDetailsModel.fromJson(dynamic json) {
//     if (json['data'] != null) {
//       _data = [];
//       json['data'].forEach((v) {
//         _data?.add(Data.fromJson(v));
//       });
//     }
//     _message = json['message'];
//   }
//   List<Data>? _data;
//   String? _message;
//   OrderDetailsModel copyWith({
//     List<Data>? data,
//     String? message,
//   }) =>
//       OrderDetailsModel(
//         data: data ?? _data,
//         message: message ?? _message,
//       );
//   List<Data>? get data => _data;
//   String? get message => _message;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (_data != null) {
//       map['data'] = _data?.map((v) => v.toJson()).toList();
//     }
//     map['message'] = _message;
//     return map;
//   }
// }

/// id : 3
/// user_id : 2
/// status : "In_Preparation"
/// payment_status : "not_paid"
/// order_price : 200
/// created_at : "2023-12-27T09:05:29.000000Z"
/// updated_at : "2023-12-27T09:05:29.000000Z"
/// products : [{"id":3,"category_id":1,"scientific_name":"انسولين","commercial_name":"بارانسولين","company":"لين","quantity_available":100,"createdat":"2023-12-07","cost":15,"created_at":"2023-12-27T07:13:11.000000Z","updated_at":"2023-12-27T07:13:11.000000Z","pivot":{"order_id":3,"product_id":3,"quantity":3}}]

class Data {
  Data({
    num? id,
    num? userId,
    String? status,
    String? paymentStatus,
    num? orderPrice,
    String? createdAt,
    String? updatedAt,
    List<Products>? products,
  }) {
    _id = id;
    _userId = userId;
    _status = status;
    _paymentStatus = paymentStatus;
    _orderPrice = orderPrice;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _products = products;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _status = json['status'];
    _paymentStatus = json['payment_status'];
    _orderPrice = json['order_price'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }
  num? _id;
  num? _userId;
  String? _status;
  String? _paymentStatus;
  num? _orderPrice;
  String? _createdAt;
  String? _updatedAt;
  List<Products>? _products;
  Data copyWith({
    num? id,
    num? userId,
    String? status,
    String? paymentStatus,
    num? orderPrice,
    String? createdAt,
    String? updatedAt,
    List<Products>? products,
  }) =>
      Data(
        id: id ?? _id,
        userId: userId ?? _userId,
        status: status ?? _status,
        paymentStatus: paymentStatus ?? _paymentStatus,
        orderPrice: orderPrice ?? _orderPrice,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        products: products ?? _products,
      );
  num? get id => _id;
  num? get userId => _userId;
  String? get status => _status;
  String? get paymentStatus => _paymentStatus;
  num? get orderPrice => _orderPrice;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<Products>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['status'] = _status;
    map['payment_status'] = _paymentStatus;
    map['order_price'] = _orderPrice;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 3
/// category_id : 1
/// scientific_name : "انسولين"
/// commercial_name : "بارانسولين"
/// company : "لين"
/// quantity_available : 100
/// createdat : "2023-12-07"
/// cost : 15
/// created_at : "2023-12-27T07:13:11.000000Z"
/// updated_at : "2023-12-27T07:13:11.000000Z"
/// pivot : {"order_id":3,"product_id":3,"quantity":3}

class Products {
  Products({
    num? id,
    num? categoryId,
    String? scientificName,
    String? commercialName,
    String? company,
    num? quantityAvailable,
    String? createdat,
    num? cost,
    String? createdAt,
    String? updatedAt,
    Pivot? pivot,
  }) {
    _id = id;
    _categoryId = categoryId;
    _scientificName = scientificName;
    _commercialName = commercialName;
    _company = company;
    _quantityAvailable = quantityAvailable;
    _createdat = createdat;
    _cost = cost;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _pivot = pivot;
  }

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _categoryId = json['category_id'];
    _scientificName = json['scientific_name'];
    _commercialName = json['commercial_name'];
    _company = json['company'];
    _quantityAvailable = json['quantity_available'];
    _createdat = json['createdat'];
    _cost = json['cost'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
  num? _id;
  num? _categoryId;
  String? _scientificName;
  String? _commercialName;
  String? _company;
  num? _quantityAvailable;
  String? _createdat;
  num? _cost;
  String? _createdAt;
  String? _updatedAt;
  Pivot? _pivot;
  Products copyWith({
    num? id,
    num? categoryId,
    String? scientificName,
    String? commercialName,
    String? company,
    num? quantityAvailable,
    String? createdat,
    num? cost,
    String? createdAt,
    String? updatedAt,
    Pivot? pivot,
  }) =>
      Products(
        id: id ?? _id,
        categoryId: categoryId ?? _categoryId,
        scientificName: scientificName ?? _scientificName,
        commercialName: commercialName ?? _commercialName,
        company: company ?? _company,
        quantityAvailable: quantityAvailable ?? _quantityAvailable,
        createdat: createdat ?? _createdat,
        cost: cost ?? _cost,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        pivot: pivot ?? _pivot,
      );
  num? get id => _id;
  num? get categoryId => _categoryId;
  String? get scientificName => _scientificName;
  String? get commercialName => _commercialName;
  String? get company => _company;
  num? get quantityAvailable => _quantityAvailable;
  String? get createdat => _createdat;
  num? get cost => _cost;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Pivot? get pivot => _pivot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_id'] = _categoryId;
    map['scientific_name'] = _scientificName;
    map['commercial_name'] = _commercialName;
    map['company'] = _company;
    map['quantity_available'] = _quantityAvailable;
    map['createdat'] = _createdat;
    map['cost'] = _cost;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_pivot != null) {
      map['pivot'] = _pivot?.toJson();
    }
    return map;
  }
}

/// order_id : 3
/// product_id : 3
/// quantity : 3

class Pivot {
  Pivot({
    num? orderId,
    num? productId,
    num? quantity,
  }) {
    _orderId = orderId;
    _productId = productId;
    _quantity = quantity;
  }

  Pivot.fromJson(dynamic json) {
    _orderId = json['order_id'];
    _productId = json['product_id'];
    _quantity = json['quantity'];
  }
  num? _orderId;
  num? _productId;
  num? _quantity;
  Pivot copyWith({
    num? orderId,
    num? productId,
    num? quantity,
  }) =>
      Pivot(
        orderId: orderId ?? _orderId,
        productId: productId ?? _productId,
        quantity: quantity ?? _quantity,
      );
  num? get orderId => _orderId;
  num? get productId => _productId;
  num? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = _orderId;
    map['product_id'] = _productId;
    map['quantity'] = _quantity;
    return map;
  }
}
