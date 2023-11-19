import 'package:flutter/material.dart';
class RigixText extends StatelessWidget {
   RigixText(this.title,{super.key});
    String title;
  @override
  Widget build(BuildContext context) {
    return Text(
    title,
      textAlign: TextAlign.start,
      style:const  TextStyle(
        color: Colors.deepPurple,
        fontFamily: 'SFUIDisplay',

        fontWeight: FontWeight.w500,
        fontSize: 45.0

      ),
    );
  }
}
