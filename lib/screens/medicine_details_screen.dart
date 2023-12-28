import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pharma/models/medicine.dart';
import 'package:pharma/providers/auth_data_provider.dart';
import 'package:pharma/services/get_medicine_service.dart';
import 'package:pharma/widgets/order/adding_item.dart';
import 'package:pharma/widgets/order/add_container.dart';

class MedDetails extends StatefulWidget {
  const MedDetails({
    super.key,
    required this.medicine,
  });
  final MedicineModel medicine;
  @override
  State<MedDetails> createState() => _MedDetailsState();
}

class _MedDetailsState extends State<MedDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 67, 201, 201),
        title: Text('Details'.tr),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        //padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  color: const Color.fromARGB(255, 67, 201, 201),
                  'assets/images/pill.svg',
                  width: 90,
                  height: 90,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Medicine Name'.tr,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.medicine.commercial_name.toString(),
                      //medicine.name.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Price'.tr,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${widget.medicine.cost.toString()}\$',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            //Scientific name
            Text(
              'Scientific Name'.tr,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.medicine.scientific_name.toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            //Company Name
            const SizedBox(height: 15),
            Text(
              'Company'.tr,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.medicine.company.toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            //spacer to the end of the screen
            const Spacer(),

            AddContainer(medicine: widget.medicine),
          ],
        ),
      ),
    );
  }
}
