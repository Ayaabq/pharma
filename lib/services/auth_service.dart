import 'package:http/http.dart' as http;
import 'package:pharma/models/rigex/login.dart';
import 'package:pharma/models/rigex/register.dart';
import 'dart:convert';

import 'package:pharma/models/rigex/user.dart';
class AuthServices {
  Future<User> createUser(RegisterModel register) async {

   final url= Uri.parse("http://10.0.2.2:8000/api/register");
   final response = await http.post(url,
     headers: <String, String>{
       'Accept': 'application/json',
       'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
       'Content-Type': 'application/json',
     },
     body: json.encode(
        register.toJson()
     ),
   );
    print(register.toJson().toString());
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create user.');
    }
  }

  // Future<User> getUser(LoginModel login) async{
  //   final url
  // }
}