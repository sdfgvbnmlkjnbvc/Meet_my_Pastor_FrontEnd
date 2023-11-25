import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageNavigator {
  PageNavigator({this.ctx});
  BuildContext? ctx;
  Future nextPage({Widget? page}) {
     if (ctx != null && page != null) {

    return Navigator.push(
        ctx!, CupertinoPageRoute(builder: (context) => page));
     }
     else{
 throw "error page is null";
     }
  }

  void nextPageOnly({Widget? page}) {
     if (ctx != null && page != null) {

    Navigator.pushAndRemoveUntil(
        ctx!, MaterialPageRoute(builder: (context) => page), (route) => false);
     }else{
      throw "error page is null";
     }
  }
}
