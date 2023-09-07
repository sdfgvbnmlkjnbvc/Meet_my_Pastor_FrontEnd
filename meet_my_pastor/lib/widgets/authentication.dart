import 'package:flutter/material.dart';

Widget buildRegisterButton(BuildContext context, Function()? onTap,Color? color1,var BtnTitle) {
 
    return InkWell(
      splashColor: Colors.transparent,
      onTap:onTap,
      //  () {
     
      // },
      child: Container(
        decoration: BoxDecoration(
          color:  color1,
          borderRadius: BorderRadius.circular(6),
        ),
        height: 60,
        width: 364,
        child:  Center(
          child: Text(
            BtnTitle,
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }