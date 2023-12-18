import 'package:flutter/material.dart';

class DrawerOption extends StatelessWidget {
  DrawerOption(
      {super.key,
      required this.onChose,
      required this.icon,
      required this.title});
  void Function() onChose;
  String title;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).colorScheme.onBackground, fontSize: 24),
      ),
      onTap: onChose,
    );
  }
}
