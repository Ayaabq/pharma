import 'package:flutter/material.dart';
import 'package:pharma/models/medicine.dart';
import 'package:pharma/screens/medicine_details_screen.dart';

import '../utils/kcolors_utils.dart';

class MedicineItem extends StatelessWidget {
  const MedicineItem(
      {super.key, required this.medicine, required this.onSelectedMedicine});
  final MedicineModel medicine;
  final Function(int medId) onSelectedMedicine;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.all(7),
      color: Colors.white54,
      child: InkWell(
        onTap: () {
          onSelectedMedicine(medicine.id);
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (ctx) => MedDetails(
          //           medicine: medicine,
          //         )));
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: [kblue2, kgreen2],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medicine.commercial_name.toString(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
