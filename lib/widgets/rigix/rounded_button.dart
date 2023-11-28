import 'package:flutter/material.dart';
import 'package:pharma/utils/kcolors_utils.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({super.key, required this.title,required this.onPressed});


  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const  EdgeInsets.all(16),
      child: Material(
        elevation: 5.0,
        color: Color.fromARGB(255, 52, 215, 172),

        borderRadius: BorderRadius.circular(16.0),
        child: MaterialButton(
          onPressed: onPressed,

          minWidth: double.infinity,
          height: 42.0,
          child: Text(
            title,
            style:const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}