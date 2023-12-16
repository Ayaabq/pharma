import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharma/models/category/category_model.dart';

class AllCategoryService {
  Future<List<CategoryModel>> getAllCategory() async {
    print('hello1');

    http.Response response = await http
        .get(Uri.parse("http://10.0.2.2:8000/api/admin/getCategories"));
    print(response.statusCode);
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
