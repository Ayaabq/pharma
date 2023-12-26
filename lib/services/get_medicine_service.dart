import 'dart:convert';
import 'package:pharma/data/IP.dart';
import 'package:pharma/data/dummy_data_medicine.dart';
import 'package:pharma/models/medicine.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:riverpod/riverpod.dart';

class AllMedicineService {
  Future<List<MedicineModel>> getAllMedicine(String token, int id) async {
    print('hello medicine 1');

    http.Response response =
        await http.get(Uri.parse("http://${IP}:8000/api/admin/getProduct"),
            // Uri.parse("http://10.0.2.2:8000/api/admin/getProduct"),
            headers: {'Authorization': 'Bearer $token'});
    print(response.statusCode);
    print('hello2');
    List<dynamic> data = jsonDecode(response.body);

    print('hello3');
    List<MedicineModel> medicineList = [];
    print('hello4');
    for (int i = 0; i < data.length; i++) {
      print(MedicineModel.fromJson(data[i]).category_id);
      if ((MedicineModel.fromJson(data[i]).category_id) == id) {
        medicineList.add(
          MedicineModel.fromJson(data[i]),
        );
        //print(data[i].toString());
      }
    }
    return medicineList;
  }
}

final medicineProvider =
    Provider<AllMedicineService>((ref) => AllMedicineService());
