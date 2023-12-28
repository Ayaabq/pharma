import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma/models/medicine.dart';
import 'package:pharma/models/order.dart';

import '../models/pair.dart';
//بترجع بتصفرا كلما تعمل طلب

List<Pair<int, MedicineModel>> cart = [];
List<Pair<int, int>> backCart = cart.map((e) {
  late Pair<int, int> p = Pair(e.first, e.second.id);

  return p;
}).toList();
int value = 1;
