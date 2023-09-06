import 'package:flutter/material.dart';

Widget buildRegisterButton(BuildContext context, Function()? onTap) {
  
    return InkWell(
      splashColor: Colors.transparent,
      onTap:onTap,
      //  () {
     
      // },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF3E64FF),
          borderRadius: BorderRadius.circular(6),
        ),
        height: 60,
        width: 364,
        child: const Center(
          child: Text(
            "Register",
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }