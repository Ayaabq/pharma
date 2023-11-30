import 'package:http/http.dart' as http;
import 'package:pharma/models/rigex/register.dart';
import 'dart:convert';

import 'package:pharma/models/rigex/user.dart';
class AuthServices {
  Future<User> createUser({required String phone, required String email, required String password, required String userName, required String confPassword}) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/register'),
      headers: <String, String>{
        'Accept': 'application/json',
          //'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
            'Content-Type': 'application/json',
      },
      body: jsonEncode(RegisterModel(name: userName,
          password: password,
          phone: phone,
          email: email,
          passwordConfirmation:confPassword
      ).toJson())
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }
}