import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma/providers/auth_data_provider.dart';
import 'package:pharma/screens/order_screen.dart';
import 'package:pharma/services/order_service.dart';

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
        // final tokenWathcer = ref.watch(tokenProvider);
        // await ref.watch(OrderProvider).PostAllOrders(tokenWathcer.toString());

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
