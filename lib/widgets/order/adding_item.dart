import 'package:flutter/material.dart';
import 'package:pharma/widgets/order/add_circular_button.dart';

class AddItemButton extends StatefulWidget {
  const AddItemButton({super.key});

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
              AddButton(onPressed: (){}, icon: Icons.add),
              Text("0"),
              AddButton(onPressed: (){}, icon: Icons.minimize),
          ],
        ),
      ),
    );
  }
}
