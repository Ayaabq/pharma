import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma/models/medicine.dart';
import 'package:pharma/data/medicine.dart';

import '../models/pair.dart';

// sate notifier is a generic class we all the <>...
class valueNotifier extends StateNotifier<int> {
  valueNotifier() : super(1);
  setValue() {
    state = value;
  }

  restValue() {
    value = 1;
    state = 1;
  }
}

final valueProvider = StateNotifierProvider<valueNotifier, int>((ref) {
  return valueNotifier();
});
