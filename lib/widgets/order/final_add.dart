import 'package:flutter/material.dart';

class FinalAddButton extends StatefulWidget {
  const FinalAddButton({super.key});

  @override
  State<FinalAddButton> createState() => _FinalAddButtonState();
}

class _FinalAddButtonState extends State<FinalAddButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Theme.of(context).colorScheme.surfaceTint,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

      Text("Add to Cart"),
    SizedBox(width: 15,),
      Text("Prise"),
    ],),);
  }
}
