import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({super.key, required this.title,required this.onPressed});


  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const  EdgeInsets.fromLTRB(0,10,0,5),
      child: Material(
        elevation: 5.0,
        color: Colors.purple
        ,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,

          minWidth: 200.0,
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