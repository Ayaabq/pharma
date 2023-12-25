import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma/providers/auth_data_provider.dart';
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
        await ref.watch(OrderProvider).PostAllOrders(tokenWathcer.toString());
        ref.watch(cartProvider.notifier).resetData();
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
            Text('Order'),
          ],
        ),
      ),
    );
  }
}
