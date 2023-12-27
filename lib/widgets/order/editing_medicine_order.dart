import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma/data/medicine.dart';
import 'package:pharma/providers/cart_provider.dart';
import 'package:pharma/widgets/order/make_order_button.dart';

class EditingMedicineOrder extends ConsumerStatefulWidget {
  const EditingMedicineOrder({super.key});

  @override
  ConsumerState<EditingMedicineOrder> createState() =>
      _EditingMedicineOrderState();
}

class _EditingMedicineOrderState extends ConsumerState<EditingMedicineOrder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //showing the medicines
        Expanded(
          child: ListView.builder(
              itemCount: cart.length,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              itemBuilder: (ctx, index) => Card(
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20),
                      child: Stack(
                        children: [
                          // Medicine Name
                          Text(
                            cart[index].second.commercial_name,
                            style: TextStyle(fontSize: 20.0),
                            textAlign: TextAlign.center,
                          ),
                          // Icons on the right
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Row(
                              children: [
                                Text("${cart[index].first}"),
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (cart[index].first > 1) {
                                        ref
                                            .watch(cartProvider.notifier)
                                            .deleteEelementQuantity(
                                                cart[index].second, 1);
                                      } else {
                                        ref
                                            .watch(cartProvider.notifier)
                                            .deleteEelement(cart[index].second);
                                      }
                                    });

                                    // Handle reduce quantity
                                    // Add your logic here
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    // Handle delete
                                    setState(() {
                                      ref
                                          .watch(cartProvider.notifier)
                                          .deleteEelement(cart[index].second);
                                      // medicineNames.removeAt(medicineNames.indexOf(medicineName));
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              // onSelectedMedicine: _selectMedicine(context),

              ),
        ),
        OrderButton(),
      ],
    );
  }
}
