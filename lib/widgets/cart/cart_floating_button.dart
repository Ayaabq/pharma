import 'package:flutter/material.dart';
import 'package:pharma/screens/order_screen.dart';

class CartFloatingButton extends StatelessWidget {
  CartFloatingButton({
    super.key,
    // required this.pressedIcon,
  });
  // void Function() pressedIcon;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.teal,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => OrderScreen(),
          ),
        );
        // print('hee');
      },
      shape: CircleBorder(),
      child: Icon(Icons.add_shopping_cart_outlined),
    );
  }
}
