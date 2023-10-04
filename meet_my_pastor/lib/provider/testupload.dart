

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FetchImage with ChangeNotifier{
final ImagePicker picker =ImagePicker();
  XFile? _file;
  
  XFile? get file => _file;
  File _imageFile=File('');
bool _picked=false;
  File get imageFile =>  _imageFile;
  bool get picked=> _picked;
  Future<void> int() async{

   _file=await selectImageFromGallery();

  
 notifyListeners();
  print("tESTING ${file?.path}");
    if (_file != null) {
     
        _imageFile = File(_file!.path);
        _picked=true;
         notifyListeners();
      };

  }

  Future selectImageFromGallery() async{

    return await picker.pickImage(source: ImageSource.gallery);
  }
}