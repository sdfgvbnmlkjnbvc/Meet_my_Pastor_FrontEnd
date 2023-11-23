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

class FieldInput extends StatelessWidget {
  final String? labelText;
  final double? height;
  final double? width;
  final bool expand;
  int? maxLines = 1;
  final int? minLines;
  final TextEditingController controller;
  TextStyle? labelTextStyle;
  FieldInput(
      {super.key,
      required this.labelText,
      this.width,
      this.height,
      labelTextStyle,
      required this.controller,
      required this.expand,
      this.maxLines,
      this.minLines});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.red),
      width: width,
      height: height,
      child: Center(
        child: Material(
          child: TextField(
            style: const TextStyle(color: Colors.black, fontSize: 16),
            controller: controller,
            expands: expand,
            maxLines: maxLines,
            minLines: minLines,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
              hintText: labelText,
              hintStyle: labelTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
