import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pharma/models/order_details_model.dart';
import 'package:pharma/screens/order_details_screen.dart';
import 'package:pharma/services/get_order_details_service.dart';

import '../providers/auth_data_provider.dart';

class OrderList extends ConsumerStatefulWidget {
  const OrderList({super.key});

  @override
  ConsumerState<OrderList> createState() => _OrderListState();
}

class _OrderListState extends ConsumerState<OrderList> {
  @override
  Widget build(BuildContext context) {
    final tokenReader = ref.read(tokenProvider);
    return Column(
      children: [
        // ElevatedButton(
        //   onPressed: () {
        //     getOrderDetails("gYU2ZzZ3Rdv84RsmSXGigZDBNdDb6ZmCxPcYJEEn07e86a8e");
        //   },
        //   child: Text("press"),
        // ),
        FutureBuilder<List<Data>>(
          future: getOrderDetails(tokenReader.toString()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Data> orders = snapshot.data!;
              return Expanded(
                child: ListView.builder(
                  itemCount: orders?.length ?? 0,
                  //itemCount: orders.length,
                  // padding: const EdgeInsets.all(),
                  itemBuilder: (ctx, index) {
                    //Data order = orders[index];

                    return InkWell(
                      onTap: () {
                        // print('object');
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => ProductsDetailsScreen(
                              orderData: orders![index],
                            ),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 5,
                        margin:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                            15,
                            25,
                            25,
                            25,
                          ),
                          // EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Order# ${index + 1}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Price: ${orders![index].orderPrice.toString()}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // Add other order details as needed...
                                ],
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                top: 0,

                                //right: 0,
                                // child:
                                // Container(
                                //   padding: EdgeInsets.all(8),
                                //   decoration: BoxDecoration(
                                //     color: Colors.grey,
                                //     borderRadius: BorderRadius.circular(12),
                                //   ),

                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      orders![index].status.toString(),
                                      //style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                // ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );

                    //...............
                    //   Card(
                    //   // Your card UI here...
                    //   child: Column(
                    //     children: [
                    //       Text('Order: ${order.status}'),
                    //       // Text('Status: ${order.status}'),
                    //       // Other details...
                    //     ],
                    //   ),
                    // );
                  },
                  // Card(
                  //   margin: EdgeInsets.all(8.0),
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 10.0, vertical: 20),
                  //     child: Stack(
                  //       children: [
                  //         // Medicine Name
                  //
                  //         Text(
                  //           (orders).toString(),
                  //           style: TextStyle(fontSize: 20.0),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         // Icons on the right
                  //         Positioned(
                  //           top: 0,
                  //           right: 0,
                  //           child: Row(
                  //             children: [
                  //               //Text("${cart[index].first}"),
                  //               // IconButton(
                  //               //   icon: Icon(Icons.remove),
                  //               //   onPressed: () {
                  //               //     setState(() {
                  //               //       if (cart[index].first > 1) {
                  //               //         ref
                  //               //             .watch(cartProvider.notifier)
                  //               //             .deleteEelementQuantity(
                  //               //             cart[index].second, 1);
                  //               //       } else {
                  //               //         ref
                  //               //             .watch(cartProvider.notifier)
                  //               //             .deleteEelement(cart[index].second);
                  //               //       }
                  //               //     });
                  //               //
                  //               //     // Handle reduce quantity
                  //               //     // Add your logic here
                  //               //   },
                  //               // ),
                  //               // IconButton(
                  //               //   icon: Icon(Icons.delete),
                  //               //   onPressed: () {
                  //               //     // Handle delete
                  //               //     setState(() {
                  //               //       ref
                  //               //           .watch(cartProvider.notifier)
                  //               //           .deleteEelement(cart[index].second);
                  //               //       // medicineNames.removeAt(medicineNames.indexOf(medicineName));
                  //               //     });
                  //               //   },
                  //               // ),
                  //             ],
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // )
                  // onSelectedMedicine: _selectMedicine(context),
                ),
              );
            } else {
              return Center(
                child: Text(
                  'noOrders'.tr,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
