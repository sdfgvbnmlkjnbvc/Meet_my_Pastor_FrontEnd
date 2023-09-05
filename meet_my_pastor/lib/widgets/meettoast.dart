import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ShowToast {
  static void vitaToast(
      {String message = "", bool warn = true, bool long = false}) {
    Toast.show(
      message,
      duration: long == true ? Toast.lengthLong : Toast.lengthShort,
      gravity: Toast.center,
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
