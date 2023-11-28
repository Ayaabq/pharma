import 'dart:convert';
class User {

   int id;
   String name;
  String phoneNumber;
  String password;
  String email;

   User({required this.id,
     required this.phoneNumber,
     required this.password,
     required this.email
   , required this.name});

factory User.fromJson(Map<String, dynamic>json){
  return User(
      id: json["id"] ?? 0,
      phoneNumber: json["phone"]?? "",
      password: json["password"] ?? "",
      email: json["email"] ?? "",
      name: json["name"] ?? "");
}
}