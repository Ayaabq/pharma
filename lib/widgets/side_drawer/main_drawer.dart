import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma/providers/auth_data_provider.dart';
import 'package:pharma/screens/rigex_screens/login.dart';
import 'package:pharma/services/auth_service.dart';
import 'package:pharma/widgets/side_drawer/drawer_option.dart';
import 'package:pharma/widgets/side_drawer/header.dart';

class MainDrawer extends ConsumerWidget {
  const MainDrawer({super.key, required this.onSelectedScreen});
  final void Function(String identifier) onSelectedScreen;
  void _onLogOut(WidgetRef ref, BuildContext context) async{
    final tokenWatcher= ref.watch(tokenProvider);
    ref.watch(authProvider).deleteToken(tokenWatcher.toString());
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>LoginScreen()));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: Column(
        children: [
          const Header(),
          DrawerOption(
              onChose: () {},
              icon: Icons.shopping_bag_rounded,
              title: "My Orders"),
          DrawerOption(
              onChose: () {},
              icon: Icons.favorite_rounded,
              title: "My Favorite"),
          DrawerOption(
              onChose: (){_onLogOut(ref, context);}, icon: Icons.logout, title: "Log Out"),
        ],
      ),
    );
  }
}
