import 'package:flutter/material.dart';
import 'package:pharma/models/medicine.dart';
import 'package:pharma/screens/medicine_details_screen.dart';
import 'package:pharma/widgets/medicine_item.dart';

class MedicinesScreen extends StatelessWidget {
  MedicinesScreen({super.key, required this.title, required this.medicines});
  final String title;
  List<MedicineModel> medicines;
  // _selectMedicine(context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (ctx) => MedDetails(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    if (medicines.isNotEmpty) {
      content = ListView.builder(
        itemCount: medicines.length,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        itemBuilder: (ctx, index) => MedicineItem(
          medicine: medicines[index],
          // onSelectedMedicine: _selectMedicine(context),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromARGB(255, 67, 201, 201),
      ),
      body: content,
    );
  }
}
