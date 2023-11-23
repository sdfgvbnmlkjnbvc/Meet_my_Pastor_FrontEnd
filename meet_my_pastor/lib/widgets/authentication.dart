import 'package:flutter/material.dart';

<<<<<<< HEAD
Widget buildRegisterButton(BuildContext context, Function()? onTap,Color? color1,var BtnTitle,double width,double height) {
 
    return Material(
      child: InkWell(
        splashColor: Colors.transparent,
        onTap:onTap,
        //  () {
       
        // },
        child: Container(
          decoration: BoxDecoration(
            color:  color1,
            borderRadius: BorderRadius.circular(6),
          ),
          height: height,
          width: width,
          child:  Center(
            child: Text(
              BtnTitle,
              style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
=======
Widget buildRegisterButton(BuildContext context, Function()? onTap,
    Color? color1, var BtnTitle, double width, double height) {
  return Material(
    child: InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      //  () {

      // },
      child: Container(
        decoration: BoxDecoration(
          color: color1,
          borderRadius: BorderRadius.circular(6),
        ),
        height: height,
        width: width,
        child: Center(
          child: Text(
            BtnTitle,
            style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
>>>>>>> 045705c4d45861a616606d76b4845c19c791672f
          ),
        ),
      ),
    ),
  );
}
