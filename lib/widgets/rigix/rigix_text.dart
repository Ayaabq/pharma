import 'package:flutter/material.dart';
import 'package:pharma/utils/kcolors_utils.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
class RigixText extends StatelessWidget {
   RigixText(this.title,{super.key});
    String title;
  @override
  Widget build(BuildContext context) {
    return GradientText(
    title,
      colors: kTextGradiant,
      textAlign: TextAlign.start,
      style:const  TextStyle(

        fontFamily: 'SFUIDisplay',

        fontWeight: FontWeight.w500,
        fontSize: 45.0

      ),
    );
  }
}
