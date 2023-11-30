
import 'package:flutter/material.dart';
import 'package:regexpattern/regexpattern.dart';


 enum FormsTopic{
  email, password, phoneNumber,confirmPassword, userName
}
Map<FormsTopic,IconData> kFormIcon={
   FormsTopic.userName: Icons.account_circle_sharp,
  FormsTopic.email: Icons.email_outlined,
  FormsTopic.password: Icons.remove_red_eye_rounded,
  FormsTopic.confirmPassword: Icons.remove_red_eye_rounded,
  FormsTopic.phoneNumber: Icons.phone,
};
 Map<FormsTopic,TextInputType> kFormTextInputType={
  FormsTopic.email: TextInputType.emailAddress,
  FormsTopic.password: TextInputType.visiblePassword,
   FormsTopic.confirmPassword: TextInputType.visiblePassword,
  FormsTopic.phoneNumber: TextInputType.phone,
};


class FormsTextField extends StatefulWidget {

  FormsTextField({super.key, required this.topic, required this.label, required this.ctrl});
    FormsTopic topic;
    String label;
    TextEditingController ctrl;
  @override
  State<FormsTextField> createState() => _FormsTextFieldState();
}

class _FormsTextFieldState extends State<FormsTextField> {

  String? email;

    String? password;

    String? confPassword;
  String? errorText;

  String? validate (String? value){
     if(value== null || value=="" ) {
       return widget.topic == FormsTopic.confirmPassword
           ? "you should confirm your password"
           : " ${widget.topic.name}  is required";
     }
     if(widget.topic==FormsTopic.email&& !value.isEmail())
       {
         return "Enter a valid email address";
       }
     if(widget.topic==FormsTopic.password && !value.isPasswordNormal1()) {
       return "password is not safe, enter harder one ";
     }     if(widget.topic==FormsTopic.phoneNumber && !value.isPhone()) {
       return "enter a valid phone number ";}
     //     if(widget.topic==FormsTopic.confirmPassword && value!=password) {
     //   return "passwords are not the same";
     // }

     return  null;

   }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(

        controller:widget.ctrl,

        autofocus: true,
        keyboardType: kFormTextInputType[widget.topic],
        style:
       const  TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
        onSaved: (value) {
         // myData.add(value);
          errorText=validate(value);

        },
        onChanged: (value) {
          // email=value
          if(widget.topic==FormsTopic.password)
            password=value;

        },

        validator: validate,
        decoration:  InputDecoration(

          errorText: errorText,

            border: const OutlineInputBorder(

            ),
            labelText: widget.label,
            prefixIcon: Icon(
              kFormIcon[widget.topic],
              color:  Color.fromARGB(255, 52, 215, 172),

            ),
            labelStyle:const  TextStyle(fontSize: 15)),
      ),
    );
  }
}
