import 'package:flutter/material.dart';

class CartFloatingButton extends StatelessWidget {
  const CartFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){},
      shape: CircleBorder(),
      child: Icon(Icons.add_shopping_cart_outlined),
    );
  }
}
