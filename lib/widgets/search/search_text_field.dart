import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(

     //   controller:,

        autofocus: true,

        style:
        const  TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
        onSaved: (value) {

        },
        onChanged: (value) {

        },

       // validator: validate,
        decoration:  InputDecoration(

            //errorText: errorText,

            border: const OutlineInputBorder(

            ),
            labelText: "Search for a medicine or category",
            prefixIcon: Icon(
              Icons.search,
              color:  Color.fromARGB(255, 52, 215, 172),

            ),
            labelStyle:const  TextStyle(fontSize: 15)),
      ),
    );
  }
}
