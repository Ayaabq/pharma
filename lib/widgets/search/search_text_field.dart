import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pharma/controllers/search_controller.dart';


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
              labelText: "Search for a medicine or category".tr,
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
