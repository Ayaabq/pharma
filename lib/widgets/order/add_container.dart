import 'package:flutter/material.dart';
import 'package:pharma/widgets/order/adding_item.dart';
import 'package:pharma/widgets/order/final_add.dart';
// color: Theme.of(context).colorScheme.surfaceTint,

class AddContainer extends StatelessWidget {
 const AddContainer({super.key});

  @override
  Widget build(BuildContext context) {

    return  Container(
      width:  double.infinity,
      height: 170,
      decoration: BoxDecoration(
        color: Theme.of(context).splashColor,
        borderRadius:const  BorderRadius.only(
        topLeft: Radius.circular(20.0),
    topRight: Radius.circular(20.0),

    ),
    ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AddItemButton(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal:  5),
            child: FinalAddButton(onTap: (){},),
          )
        ],
      ));
  }
}
