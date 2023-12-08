import 'package:flutter/material.dart';

Widget buildInputField({
    required TextEditingController controller,
    required String labelText,
    bool isDateSelected = false,
    bool isTimeSelected = false,
    Function? onTap,
    required List<BoxShadow> kInputBoxShadow
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        boxShadow: kInputBoxShadow,
      ),
      width: 363,
      height: 40,
      child: Center(
        child: TextField(
          style: const TextStyle(fontSize: 18),
          controller: controller,
          clipBehavior: Clip.antiAlias,
          decoration: InputDecoration(
            icon: const Icon(Icons.calendar_today),
            border: InputBorder.none,
            labelText: isDateSelected || isTimeSelected ? "" : labelText,
            labelStyle: (isDateSelected || isTimeSelected)
                ? const TextStyle(fontSize: 0.1, fontWeight: FontWeight.bold)
                : const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          readOnly: true,
          onTap: onTap as void Function()?,
        ),
      ),
    );
  }

