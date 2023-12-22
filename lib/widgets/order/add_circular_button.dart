import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
 AddButton({super.key, required this.onPressed, required this.icon});
final IconData icon;
void Function()  onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,

          ),
        child: Center(child: Icon(icon)),
      ),
    );
  }
}
