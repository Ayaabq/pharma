import 'package:flutter/material.dart';
import 'package:pharma/widgets/side_drawer/drawer_option.dart';
class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectedScreen});
  final void Function (String identifier) onSelectedScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
                  ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)
              ),
              child: Row(
                children: [
                  Icon(Icons.local_pharmacy, size: 48, color: Theme.of(context).colorScheme.primary,),
                  const SizedBox(width: 18,),
                  Text('Cooking Up!',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color:Theme.of(context).colorScheme.primary
                    ),)
                ],
              )
          ),

          DrawerOption(onChose: (){}, icon: Icons.shopping_bag_rounded, title: "My Orders"),
          ListTile(
            leading: Icon(Icons.settings,size: 26,
              color: Theme.of(context).colorScheme.onBackground,),
            title: Text('My Favorite', style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 24
            ),),
            onTap: (){onSelectedScreen('filters');},
          ),
        ],
      ),
    );
  }
}
