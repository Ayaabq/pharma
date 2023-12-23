
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma/models/medicine.dart';
import 'package:pharma/data/medicine.dart';

import '../models/pair.dart';
// sate notifier is a generic class we all the <>...
class CartNotifier extends StateNotifier<List<Pair<int, MedicineModel>>> {
  // we add all the initial value
  //and all the methods we want to ably on it

  // pass the initial data:
  CartNotifier() : super([]);

  addItem(MedicineModel medicine , int quantity) {
    List<Pair<int, MedicineModel>> temp= state;
    bool exist =false;
    for(var p in temp){
      if(p.second==medicine){
        p.first+=quantity;
        exist=true;
      }
    }
    if(!exist) {
      temp.add(Pair(quantity, medicine));
    }
    state = temp;
    cart=temp;
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<Pair<int, MedicineModel>>>((ref) {
  return CartNotifier();
});


