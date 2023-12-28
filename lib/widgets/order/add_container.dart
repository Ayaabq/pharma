import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pharma/data/medicine.dart';
import 'package:pharma/models/medicine.dart';
import 'package:pharma/models/pair.dart';
import 'package:pharma/providers/cart_provider.dart';
import 'package:pharma/providers/value.dart';
import 'package:pharma/widgets/order/adding_item.dart';
import 'package:pharma/widgets/order/final_add.dart';

// color: Theme.of(context).colorScheme.surfaceTint,
//it's a stless widget
class AddContainer extends ConsumerStatefulWidget {
  AddContainer({
    super.key,
    required this.medicine,
  });
  MedicineModel medicine;

  @override
  ConsumerState<AddContainer> createState() => _AddContainerState();
}

class _AddContainerState extends ConsumerState<AddContainer> {
  void _addItem(WidgetRef ref) {
    int quantity = value;
    value = 1;
    ref.watch(valueProvider.notifier).restValue();
    final cartWatcher =
        ref.watch(cartProvider.notifier).addItem(widget.medicine, quantity);
    final gg = ref.watch(cartProvider);
    for (var a in gg) {
      print(a.first);
      print(a.second.scientific_name);

      // cart.map((e) {
      //   //late Pair<int, int> p = Pair(e.first, e.second.id);
      //   //print(e.first);
      // }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
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
            AddItemButton(
              quantityLimit: widget.medicine.quantity_available,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              child: FinalAddButton(
                onTap: () {
                  _addItem(ref);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Product has been added to the cart'),
                  ));
                  Navigator.of(context).pop();
                },
                cost: widget.medicine.cost,
                orderedqu: value,
              ),
            )
          ],
        ));
  }
}
