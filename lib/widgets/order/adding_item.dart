import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma/providers/value.dart';

import 'package:pharma/widgets/order/add_circular_button.dart';

import '../../data/medicine.dart';

class AddItemButton extends ConsumerStatefulWidget {
  AddItemButton({super.key, required this.quantityLimit});
  int quantityLimit;
  @override
  ConsumerState<AddItemButton> createState() => _AddItemButtonState();
}

class _AddItemButtonState extends ConsumerState<AddItemButton> {
  @override
  Widget build(BuildContext context) {
    final valueWatcher = ref.watch(valueProvider);
    return Center(
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          color: Theme.of(context)
              .highlightColor, // Set your desired background color
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AddButton(
                onPressed: () {
                  setState(() {
                    if (value < widget.quantityLimit) value++;
                    ref.watch(valueProvider.notifier).setValue();
                  });
                },
                icon: Icons.add),
            Text("${valueWatcher.toString()}"),
            AddButton(
                onPressed: () {
                  setState(() {
                    if (value > 1) value--;
                    ref.watch(valueProvider.notifier).setValue();
                  });
                },
                icon: Icons.minimize),
          ],
        ),
      ),
    );
  }
}
