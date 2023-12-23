import 'package:flutter/material.dart';

class FinalAddButton extends StatefulWidget {
 FinalAddButton({super.key, required this.onTap});
    void Function() onTap;
  @override
  State<FinalAddButton> createState() => _FinalAddButtonState();
}

class _FinalAddButtonState extends State<FinalAddButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

        Text("Add to Cart"),
      SizedBox(width: 15,),
        Text("Prise"),
      ],),),
    );
  }
}
