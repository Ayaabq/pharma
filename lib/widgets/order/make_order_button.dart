import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pharma/providers/auth_data_provider.dart';
import 'package:pharma/providers/user_provider.dart';
import 'package:pharma/services/order_service.dart';

import '../../providers/cart_provider.dart';

class OrderButton extends ConsumerWidget {
  OrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async {
        final tokenWathcer = ref.watch(tokenProvider);
        final userWatcher = ref.watch(userProvider);
        await ref
            .watch(OrderProvider)
            .PostAllOrders(tokenWathcer.toString(), userWatcher!.id!.toInt());
        ref.watch(cartProvider.notifier).resetData();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Your order has been added'),
        ));
        Navigator.of(context).pop();
      },
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
            Text("Order".tr),
          ],
        ),
      ),
    );
  }
}
