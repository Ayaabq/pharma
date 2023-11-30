/// name : "ayaba"
/// phone : "0966381848"
/// email : "ayabac@gmail.com"
/// password : "1234567gj"
/// password_confirmation : "1234567gj"

class RegisterModel {
  RegisterModel({
      String? name, 
      String? phone, 
      String? email, 
      String? password, 
      String? passwordConfirmation,}){
    _name = name;
    _phone = phone;
    _email = email;
    _password = password;
    _passwordConfirmation = passwordConfirmation;
}

  RegisterModel.fromJson(dynamic json) {
    _name = json['name'];
    _phone = json['phone'];
    _email = json['email'];
    _password = json['password'];
    _passwordConfirmation = json['password_confirmation'];
  }
  String? _name;
  String? _phone;
  String? _email;
  String? _password;
  String? _passwordConfirmation;
RegisterModel copyWith({  String? name,
  String? phone,
  String? email,
  String? password,
  String? passwordConfirmation,
}) => RegisterModel(  name: name ?? _name,
  phone: phone ?? _phone,
  email: email ?? _email,
  password: password ?? _password,
  passwordConfirmation: passwordConfirmation ?? _passwordConfirmation,
);
  String? get name => _name;
  String? get phone => _phone;
  String? get email => _email;
  String? get password => _password;
  String? get passwordConfirmation => _passwordConfirmation;

  Map<String, String> toJson() {
    final map = <String, String >{};
    map['name'] = _name ?? "";
    map['phone'] = _phone ?? "";
    map['email'] = _email ?? "";
    map['password'] = _password ?? "";
    map['password_confirmation'] = _passwordConfirmation ?? "";
    return map;
  }

}