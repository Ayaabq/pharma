import 'dart:convert';

import 'package:pharma/models/search.dart';
import 'package:http/http.dart' as http;
class SearchServices {
  Future<Map<int,List<dynamic>>?> serch(Search searchModel, String token) async {
    final url = Uri.parse("http://10.0.2.2:8000/api/search");


    final response = await http.post(
      url,
      headers: <String, String>{
        'Accept': 'application/json',
       'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode(searchModel.toJson()),
    );
print(response.statusCode);
print(response.body);
print(searchModel.toJson());
    if (response.statusCode == 200) {
      final search= Search.fromJson(
          jsonDecode(response.body)as Map<String, dynamic>);
      print(search.data);
      //List<dynamic> data=jsonDecode(search.data[i]);
      Map <int, List<dynamic>> mp ={};
      print(search.messag.toString());
      if(search.messag.toString()=="you search in product"){

        mp[0]=search.data!;
        print(mp[0]);
        return mp;
      }
      else if(search.messag.toString()=="you search in categorie"){
        mp[1]=search.data!;
        print(mp[1]);
        return mp;
      }else{
        print("yeeee");
        return null;
      }


    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed ');
    }
  }


}

// final authProvider = Provider<AuthServices>((ref) => AuthServices());