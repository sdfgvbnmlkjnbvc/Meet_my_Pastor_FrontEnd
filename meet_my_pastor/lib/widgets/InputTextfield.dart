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