import '../user.dart';

/// user : {"name":"malek","phone":"92882327","password":"fsjahfl","email":"mama@gmail.com","updated_at":"2023-12-07T20:54:54.000000Z","created_at":"2023-12-07T20:54:54.000000Z","id":12}
/// token : "16|vaarYWFC8QLE9Q4aqnWoFOlQn0PWqOgOAZqgqrgv1f65ec5b"

class RegisterModel {
  RegisterModel({
    User? user,
    String? token,
  }) {
    _user = user;
    _token = token;
  }

  RegisterModel.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _token = json['token'];
  }
  User? _user;
  String? _token;
  RegisterModel copyWith({
    User? user,
    String? token,
  }) =>
      RegisterModel(
        user: user ?? _user,
        token: token ?? _token,
      );
  User? get user => _user;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['token'] = _token;
    return map;
  }
}

/// name : "malek"
/// phone : "92882327"
/// password : "fsjahfl"
/// email : "mama@gmail.com"
/// updated_at : "2023-12-07T20:54:54.000000Z"
/// created_at : "2023-12-07T20:54:54.000000Z"
/// id : 12
