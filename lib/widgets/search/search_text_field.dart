import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma/controllers/search_controller.dart';
import 'package:pharma/models/category/category_model.dart';
import 'package:pharma/models/medicine.dart';
import 'package:pharma/models/search.dart';
import 'package:pharma/providers/auth_data_provider.dart';
import 'package:pharma/services/search_service.dart';

class SearchTextField extends ConsumerWidget {
 SearchTextField({super.key, required this.onEnter, required this.focusNode});
    final searchKey= GlobalKey<FormState>();
    final focusNode;
    void Function(WidgetRef ref) onEnter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Focus(
        focusNode: focusNode,
       // autofocus: true,
        child: TextFormField(
          key: searchKey,
         controller: searchController,

          autofocus: true,

          style:
          const  TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),

          onFieldSubmitted: (v){onEnter(ref);},
          decoration:  InputDecoration(


              border:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),

              ),
              labelText: "Search for a medicine or category",
              prefixIcon:const Icon(
                Icons.search,
                color:  Color.fromARGB(255, 52, 215, 172),

              ),
              labelStyle:const  TextStyle(fontSize: 15)),
        ),
      ),
    );
  }
}
