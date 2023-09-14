

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FetchImage with ChangeNotifier{
final ImagePicker picker =ImagePicker();
  XFile? _file;
  
  XFile? get file => _file;
  Future<void> int() async{

   _file=await selectImageFromGallery();
  // print("Testing");
   print("tESTING ${file}");

 notifyListeners();
  }

  Future selectImageFromGallery() async{

    return await picker.pickImage(source: ImageSource.gallery);
  }
}