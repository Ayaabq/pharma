import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma/models/order_details_model.dart';
import 'package:pharma/screens/order_screen.dart';

// class OrderDetailsScreen extends StatelessWidget {
//   OrderDetailsScreen({super.key, required this.dr});
//   Data dr;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Order Details'),
//         backgroundColor: Color.fromARGB(255, 67, 201, 201),
//       ),
//       body: ListView.builder(
//         itemCount: dr.products?.length,
//         padding: const EdgeInsets.symmetric(horizontal: 5),
//         itemBuilder: (ctx, index) => OrderDetailsList(
//           pr: dr.products!,
//
//           // onSelectedMedicine: _selectMedicine(context),
//         ),
//       ),
//     );
//   }
// }

// class OrdersScreen extends StatefulWidget {
//   OrderScreen({super.key});
//   @override
//   _OrdersScreenState createState() => _OrdersScreenState();
// }
//
// class _OrdersScreenState extends State<OrdersScreen> {
//   List<Data>? ordersData = []; // Replace with actual data
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Orders'),
//       ),
//       body: ListView.builder(
//         itemCount: ordersData?.length ?? 0,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text('Order #${ordersData![index].id}'),
//             subtitle: Text('Status: ${ordersData![index].status}'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ProductsDetailsScreen(
//                     orderData: ordersData![index],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class OrdersScreen extends StatefulWidget {
//   OrdersScreen({super.key, required this.ordersData});
//   List<Data> ordersData;
//   @override
//   State<OrdersScreen> createState() => _OrdersScreenState();
// }
//
// class _OrdersScreenState extends State<OrdersScreen> {
//   // Replace with actual data
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Orders'),
//       ),
//       body: ListView.builder(
//         itemCount: widget.ordersData?.length ?? 0,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text('Order #${widget.ordersData![index].id}'),
//             subtitle: Text('Status: ${widget.ordersData![index].status}'),
//             onTap: () {
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //     builder: (context) => ProductsDetailsScreen(
//               //       orderData: ordersData![index],
//               //     ),
//               //   ),
//               // );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

class ProductsDetailsScreen extends StatelessWidget {
  const ProductsDetailsScreen({super.key, required this.orderData});
  final Data orderData;
  @override
  Widget build(BuildContext context) {
    // num totalPrice = orderData.products?.fold(
    //     0, (sum, product) => sum + product.quantityAvailable! * product.cost!);

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'.tr),
        backgroundColor: Color.fromARGB(255, 67, 201, 201),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('${'Status'.tr}: ${orderData.status}'),
          ),
          ListTile(
            title: Text('${'Payment Status'.tr}: ${orderData.paymentStatus}'),
          ),
          ListTile(
            title: Text('${'Total Price'.tr}: ${orderData.orderPrice}'),
          ),
          Divider(),
          Text('${'Products'.tr}:'),
          Expanded(
            child: ListView.builder(
              itemCount: orderData.products?.length ?? 0,
              itemBuilder: (context, index) {
                Products product = orderData.products![index];
                return ListTile(
                  title: Text(product.commercialName!),
                  subtitle:
                      Text('${'Quantity'.tr}: ${product.pivot!.quantity}'),
                  trailing: Text(
                      '${'Price'.tr}: ${product.pivot!.quantity! * product.cost!}'),
                );
              },
            ),
          ),
          // ListTile(
          //   title: Text('Total Price: ${orderData.orderPrice}'),
          // ),
        ],
      ),
    );
    ;
  }
}
