import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToast {
  static void vitaToast(
      {String message = "", bool warn = true, bool long = false}) {
    Fluttertoast.showToast(
      msg:message,
      toastLength: long == true ? Toast.LENGTH_LONG: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: warn == true
          ? Colors.redAccent
          : const Color.fromARGB(255, 1, 198, 50),
    );
  }
}

void showMessage(
    {String message = "", bool warn = true, BuildContext? context}) {
  ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor:
        warn == true ? Colors.redAccent : const Color.fromARGB(255, 1, 198, 50),
  ));
}
