import 'package:flutter/material.dart';

 Widget buildTextField(
    TextEditingController controller,
    String hintText,
    bool isObscureText,
    Icon isObscureTextIcon,
    String? validateText,
    Function() onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 20.0, right: 20),
      child: TextField(
        controller: controller,
        obscureText: isObscureText,
        decoration: InputDecoration(
          hintText: hintText,
          errorText: validateText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: isObscureTextIcon,
            
          ),
        ),
      ),
    );
  }


  class EmailInput extends StatelessWidget {
  final String labelText;
  var height;
  var width;
  TextEditingController controller;
   TextStyle? labelTextStyle;
   EmailInput({required this.labelText,this.width,this.height,labelTextStyle,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        // boxShadow: kInputBoxShadow,
      ),
      width: width,
      height:height,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child:
          //  buildTextField(emailController, "Email", false,const Icon(Icons.alternate_email, color: Colors.black), errorText(emailController), () {}),
          TextField(
            controller: controller,
          expands: true,
           maxLines:null,
           minLines:null,
            decoration: InputDecoration(
           
             
              border: InputBorder.none,
              labelText: labelText,
              labelStyle:labelTextStyle ,
            ),
          ),
        ),
      ),
    );
  }
}
