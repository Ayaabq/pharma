class User {
  User({
    String? name,
    String? phone,
    String? password,
    String? email,
    String? updatedAt,
    String? createdAt,
    num? id,}){
    _name = name;
    _phone = phone;
    _password = password;
    _email = email;
    _id = id;
  }

  User.fromJson(dynamic json) {
    _name = json['name'];
    _phone = json['phone'];
    _password = json['password'];
    _email = json['email'];
    _id = json['id'];
  }
  String? _name;
  String? _phone;
  String? _password;
  String? _email;
  num? _id;
  User copyWith({  String? name,
    String? phone,
    String? password,
    String? email,
    String? updatedAt,
    String? createdAt,
    num? id,
  }) => User(  name: name ?? _name,
    phone: phone ?? _phone,
    password: password ?? _password,
    email: email ?? _email,

    id: id ?? _id,
  );
  String? get name => _name;
  String? get phone => _phone;
  String? get password => _password;
  String? get email => _email;

  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['phone'] = _phone;
    map['password'] = _password;
    map['email'] = _email;
    map['id'] = _id;
    return map;
  }

}