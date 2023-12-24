import 'package:flutter/material.dart';
import 'package:pharma/widgets/order/add_circular_button.dart';

import '../../data/medicine.dart';

class AddItemButton extends StatefulWidget {
   AddItemButton({super.key,required this.quantityLimit});
   int quantityLimit;
  @override
  State<AddItemButton> createState() => _AddItemButtonState();
}

class _AddItemButtonState extends State<AddItemButton> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
        borderRadius:const  BorderRadius.only(
        topLeft: Radius.circular(20.0),
    topRight: Radius.circular(20.0),),
            color: Theme.of(context).highlightColor,// Set your desired background color
          ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
              AddButton(onPressed: (){setState(() {
                  if(value< widget.quantityLimit)
                value++;
              });}, icon: Icons.add),
              Text("${value}"),
              AddButton(onPressed: (){setState(() {
                if(value>1)
               value--;
              });}, icon: Icons.minimize),
          ],
        ),
      ),
    );
  }
}
