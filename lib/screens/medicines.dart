import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pharma/models/medicine.dart';
import 'package:pharma/providers/auth_data_provider.dart';
import 'package:pharma/screens/medicine_details_screen.dart';
import 'package:pharma/services/get_medicine_service.dart';
import 'package:pharma/widgets/medicine_item.dart';
import 'package:pharma/services/get_medicine_service.dart';

class MedicinesScreen extends ConsumerStatefulWidget {
  MedicinesScreen({super.key, required this.title, required this.medicines});
  final String title;
  List<MedicineModel> medicines;

  @override
  ConsumerState<MedicinesScreen> createState() => _MedicinesScreenState();
}

class _MedicinesScreenState extends ConsumerState<MedicinesScreen> {
  void _selectMedicine(MedicineModel medicine, int id, WidgetRef ref) async {
    final tokenWathcer = ref.watch(tokenProvider);
    final medicineDetailsWatcher = await ref
        .watch(medicineProvider)
        .getAllMedicine(tokenWathcer.toString(), id);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MedDetails(medicine: medicine),
      ),
    );
  }

  // _selectMedicine(context) {
  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!'.tr,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!'.tr,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    if (widget.medicines.isNotEmpty) {
      content = ListView.builder(
        itemCount: widget.medicines.length,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        itemBuilder: (ctx, index) => MedicineItem(
          medicine: widget.medicines[index],
          onSelectedMedicine: (int id) {
            _selectMedicine(widget.medicines[index], id, ref);
          },
          // onSelectedMedicine: _selectMedicine(context),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromARGB(255, 67, 201, 201),
      ),
      body: content,
    );
  }
}
