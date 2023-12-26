import 'package:http/http.dart' as http;
import 'package:pharma/models/rigex/login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma/models/rigex/register.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pharma/models/user.dart';

import '../data/error_message.dart';

class AuthServices {
  Future<RegisterModel?> createUser(RegisterModel register) async {
    final url = Uri.parse("http://10.0.2.2:8000/api/register");
    final response = await http.post(
      url,
      headers: <String, String>{
        'Accept': 'application/json',
        'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
        'Content-Type': 'application/json',
      },
      body: json.encode(register.user?.toJson()),
    );
    print(register.toJson().toString());
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return RegisterModel.fromJson(
          jsonDecode(response.body)["data"] as Map<String, dynamic>);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      error = jsonDecode(response.body)["message"].toString();
      print(error);
      return null;
    }
  }

  Future<LoginModel?> getUser(LoginModel login) async {
    final url = Uri.parse("http://192.168.193.60:8000/api/login");
    // final url = Uri.parse("http://10.0.2.2:8000/api/login");
    print(login.toJson());
    final response = await http.post(
      url,
      headers: <String, String>{
        'Accept': 'application/json',
        'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
        'Content-Type': 'application/json',
      },
      body: json.encode(login.toJson()),
    );
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return LoginModel.fromJson(
          jsonDecode(response.body)["data"] as Map<String, dynamic>);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      error = jsonDecode(response.body)["message"].toString();
      print(error);
      return null;
    }
  }

  Future<int> deleteToken(String token) async {
    final url = "http://10.0.2.2:8000/api/logout";
    final response = await http.post(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token'},
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      return response.statusCode;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to logout');
    }
  }
}

final authProvider = Provider<AuthServices>((ref) => AuthServices());
