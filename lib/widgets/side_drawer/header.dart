import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma/providers/user_provider.dart';

class Header extends ConsumerWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userReader = ref.read(userProvider);
    return DrawerHeader(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Theme.of(context).colorScheme.primaryContainer,
          Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Row(
          children: [
            Icon(
              Icons.local_pharmacy,
              size: 48,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              width: 18,
            ),
            Text(
              _userReader!.name!,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            )
          ],
        ));
  }
}
