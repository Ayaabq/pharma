import 'package:flutter/material.dart';
import 'package:pharma/controllers/search_controller.dart';

class SearchTextField extends StatelessWidget {
 SearchTextField({super.key});
    final searchKey= GlobalKey<FormState>();

    void _onEnter(value){
      print("yeeeeees");
    }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
      child: TextFormField(
        key: searchKey,
       controller: searchController,

        autofocus: true,

        style:
        const  TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),

        onFieldSubmitted:_onEnter,
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
    );
  }
}
