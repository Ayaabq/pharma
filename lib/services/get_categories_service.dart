import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharma/models/category/category_model.dart';

class AllCategoryService {
  Future<List<CategoryModel>> getAllCategory(String token) async {
    print('hello1');

    http.Response response = await http.get(
        Uri.parse("http://10.0.2.2:8000/api/admin/getCategories"),
        headers: {'Authorization': 'Bearer $token'});
    print(response.statusCode);
    print(response.body);
    print('hello2');
    List<dynamic> data = jsonDecode(response.body);
    print('hello3');
    List<CategoryModel> categoryList = [];
    for (int i = 0; i < data.length; i++) {
      categoryList.add(
        CategoryModel.fromJson(data[i]),
      );
      print(data[i]);
    }
    return categoryList;
  }
}
