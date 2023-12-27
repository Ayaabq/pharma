// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:pharma/models/order_details_model.dart';
//
// Future<void> getOrderDetails(
//   String token,
// ) async {
//   final String apiUrl = 'http://10.0.2.2:8000/api/getOrderDetailsid';
//
//   try {
//     final response = await http
//         .get(Uri.parse(apiUrl), headers: {'Authorization': 'Bearer $token'});
//
//     if (response.statusCode == 200) {
//       // If the server returns a 200 OK response, parse the JSON
//       Map<String, dynamic> jsonResponse = json.decode(response.body);
//       print("hi");
//       // Check if the response has the "data" field
//       if (jsonResponse.containsKey("data")) {
//         List<dynamic> orders = jsonResponse["data"];
//
//         for (var order in orders) {
//           // Access order details
//           int orderId = order["id"];
//           int userId = order["user_id"];
//           String status = order["status"];
//           String paymentStatus = order["payment_status"];
//           int orderPrice = order["order_price"];
//           // Access other order details as needed...
//
//           // If the order has products, access product details
//           if (order.containsKey("products")) {
//             List<dynamic> products = order["products"];
//             for (var product in products) {
//               int productId = product["id"];
//               String scientificName = product["scientific_name"];
//               String commercialName = product["commercial_name"];
//               // Access other product details as needed...
//
//               // Access pivot details
//               Map<String, dynamic> pivot = product["pivot"];
//               int quantity = pivot["quantity"];
//               // Access other pivot details as needed...
//             }
//           }
//         }
//         print(response.statusCode);
//         print(response.body);
//       } else {
//         // Handle error, as the "data" field is not present in the response
//         print("Error: Response does not contain 'data' field");
//       }
//     } else {
//       // If the server did not return a 200 OK response, throw an exception.
//       throw Exception('Failed to load order details ${response.statusCode}');
//     }
//   } catch (error) {
//     print('Error: $error');
//     // Handle other errors as needed
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharma/models/order_details_model.dart';

Future<List<Data>> getOrderDetails(
  String token,
) async {
  final String apiUrl = 'http://10.0.2.2:8000/api/getOrderDetailsid';

  try {
    final response = await http
        .get(Uri.parse(apiUrl), headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      print("hello");
      final jsonResponse = json.decode(response.body);

      if (jsonResponse.containsKey("data")) {
        List<dynamic> orders = jsonResponse["data"];

        List<Data> orderDetailsList =
            orders.map((orderJson) => Data.fromJson(orderJson)).toList();
        print(response.statusCode);
        print(jsonResponse);
        return orderDetailsList;
      } else {
        // Handle error, as the "data" field is not present in the response
        throw Exception("Error: Response does not contain 'data' field");
      }
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load order details');
    }
  } catch (error) {
    print('Error: $error');
    // Handle other errors as needed
    throw Exception('Failed to load order details');
  }
}
