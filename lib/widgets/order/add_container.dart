import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma/data/medicine.dart';
import 'package:pharma/models/medicine.dart';
import 'package:pharma/providers/cart_provider.dart';
import 'package:pharma/widgets/order/adding_item.dart';
import 'package:pharma/widgets/order/final_add.dart';
// color: Theme.of(context).colorScheme.surfaceTint,

class AddContainer extends ConsumerWidget {
  AddContainer({super.key, required this.medicine, });
  MedicineModel medicine;

  void _addItem(WidgetRef ref) {
    int quantity = value;
    value = 1;
    final cartWatcher =
        ref.watch(cartProvider.notifier).addItem(medicine, quantity);
    final gg=ref.watch(cartProvider);
    for(var a in gg) {
      print(a.first);
      print(a.second.scientific_name);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color: Theme.of(context).splashColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AddItemButton(quantityLimit:medicine.quantity_available,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              child: FinalAddButton(
                onTap: () {
                  _addItem(ref);
                },
              ),
            )
          ],
        ));
  }
}
