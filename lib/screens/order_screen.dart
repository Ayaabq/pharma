import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma/models/medicine.dart';
import 'package:pharma/providers/auth_data_provider.dart';
import 'package:pharma/screens/medicine_details_screen.dart';
import 'package:pharma/services/get_medicine_service.dart';
import 'package:pharma/widgets/medicine_item.dart';
import 'package:pharma/services/get_medicine_service.dart';

class OrderScreen extends ConsumerStatefulWidget {
  const OrderScreen({
    super.key,
    // required this.medicines,
  });
  //List<MedicineModel> medicines;

  @override
  ConsumerState<OrderScreen> createState() => _MedicinesScreenState();
}

class _MedicinesScreenState extends ConsumerState<OrderScreen> {
  int _Index = 1;

  // _selectMedicine(context) {
  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Nothing in the Cart',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    if (_Index != 0) {
      content = Text("hello");
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Orders"),
        backgroundColor: Color.fromARGB(255, 67, 201, 201),
      ),
      body: content,
    );
  }
}
