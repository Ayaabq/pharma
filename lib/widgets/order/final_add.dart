import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pharma/providers/value.dart';

import '../../data/medicine.dart';

class FinalAddButton extends ConsumerStatefulWidget {
  FinalAddButton(
      {super.key,
      required this.onTap,
      required this.cost,
      required this.orderedqu});
  void Function() onTap;
  double cost;
  int orderedqu;
  @override
  ConsumerState<FinalAddButton> createState() => _FinalAddButtonState();
}

class _FinalAddButtonState extends ConsumerState<FinalAddButton> {
  @override
  Widget build(BuildContext context) {
    final valueWatcher = ref.watch(valueProvider);

    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Add to Cart".tr),
            SizedBox(
              width: 10,
            ),
            //Text(value.toString()),
            Text("${(widget.cost * valueWatcher).toString()}"),
          ],
        ),
      ),
    );
  }
}
