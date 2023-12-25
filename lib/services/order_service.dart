import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:pharma/data/medicine.dart';
import 'package:pharma/models/category/category_model.dart';
import 'package:pharma/models/ordermodel.dart';
import 'package:pharma/models/user.dart';
import '../data/error_message.dart';
import '../providers/user_provider.dart';

class OrderService {
  Future<http.Response> PostAllOrders(
    //Ordermodel order,
    String token,
  ) async {
    print('hello');
    final container = ProviderContainer();
    final user = User(id: 2); // Replace '1' with the actual user ID

    // Update the user in the userProvider
    container.read(userProvider.notifier).setUser(user);
    final userId = container.read(userProvider)?.id;
    final order = Ordermodel(
      userId: userId,
      products: cart
          .map((pair) =>
              Products(id: (pair.second.id).toString(), quantity: pair.first))
          .toList(),
    );
    final Uri url = Uri.parse('http://10.0.2.2:8000/api/order');
    final Map<String, dynamic> orderMap = order.toJson();
    http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Accept': 'application/json',
        'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(orderMap),
    );
    print(response.statusCode);
    print(response.body);
    // if (response.statusCode == 201) {
    //   // final Ordermodel = Ordermodel.fromJson(
    //   //     jsonDecode(response.body) as Map<String, dynamic>);
    //   return response.body;
    // } else {
    //   // If the server did not return a 201 CREATED response,
    //   // then throw an exception.
    //   error = jsonDecode(response.body)["message"].toString();
    //   print(error);
    return response;
  }
}

final OrderProvider = Provider<OrderService>((ref) => OrderService());
