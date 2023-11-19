import 'package:flutter/material.dart';

class TButton extends StatelessWidget {
  TButton({super.key, required this.title, required this.onPressed});
  final String title;
  void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 16.0,
        ),
      ),
    );
  }
}