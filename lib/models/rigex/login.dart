import 'package:pharma/models/rigex/login.dart';
import 'package:pharma/models/user.dart';

class LoginModel {
  String? phone;
  String? password;
  String? token;
  User? user;
  LoginModel({this.phone, this.password, this.token,  this.user});
  
  factory LoginModel.fromJson(Map<String , dynamic> json){
    return LoginModel(
        //phone:json["phone"],
       // password:json["password"],
        token:json["token"],
         user: User.fromJson(json["user"] ?? {}));
  }


  Map<String , dynamic> toJson(){
    Map<String, dynamic> loginMap={
    "phone":phone,
    "password": password
  };
    return loginMap;
    }
}

