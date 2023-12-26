import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pharma/utils/kcolors_utils.dart';
import 'package:switcher_button/switcher_button.dart';

import '../../local/local_controller.dart';

class DrawerOption extends StatelessWidget {
  DrawerOption(
      {super.key,
      required this.onChose,
      required this.icon,
      required this.title,
      required this.isToggle});
  void Function() onChose;
  String title;
  IconData icon;
  bool isToggle;
  @override
  Widget build(BuildContext context) {
    MyLocalController langCtr = Get.find();
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      title: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 24),
          ),
          if (isToggle)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SwitcherButton(
                offColor: kblue2,
                onColor: Color.fromARGB(255, 100, 150, 150)!,
                value: langCtr.getCurrentLocale().languageCode == "ar",
                onChange: (value) {
                  if (langCtr.getCurrentLocale().languageCode == "ar") {
                    langCtr.changeLang("en");
                  } else {
                    langCtr.changeLang("ar");
                  }
                },
              ),
            )
        ],
      ),
      onTap: onChose,
    );
  }
}
