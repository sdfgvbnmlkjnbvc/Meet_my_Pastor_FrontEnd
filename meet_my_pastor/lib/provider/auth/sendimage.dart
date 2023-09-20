
import 'dart:async';

import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meet_my_pastor/widgets/meettoast.dart';


const String apiKey =
    String.fromEnvironment('CLOUDINARY_API_KEY', defaultValue: '237849255135734');
const String apiSecret =
    String.fromEnvironment('CLOUDINARY_API_SECRET', defaultValue: 'dRs86Lnn3AF7zVIS2HZH_8-64Mo');
const String cloudName =
    String.fromEnvironment('CLOUDINARY_CLOUD_NAME', defaultValue: 'dmbjvvuu8');
const String folder =
    String.fromEnvironment('CLOUDINARY_FOLDER', defaultValue: 'public');
const String uploadPreset =
    String.fromEnvironment('CLOUDINARY_UPLOAD_PRESET', defaultValue: 'meetPastor');
final cloudinary = Cloudinary.unsignedConfig(
  cloudName: cloudName,
);
class CloudImage with ChangeNotifier{
CloudinaryResponse  _response =CloudinaryResponse();
 String? _url ;
 bool _isloading = true ;
 bool _uploaded =false;
 bool get uploaded =>_uploaded;
String? get url => _url;
 CloudinaryResponse? get response => _response;
 bool get isloading => _isloading;
Future<void> upload(XFile filePAth,String name) async{
List<int> varb =await filePAth.readAsBytes();

final response= await 
cloudinary.unsignedUpload
(
file: filePAth.path,
uploadPreset: uploadPreset,
fileBytes:varb,
resourceType: CloudinaryResourceType.image,
folder: folder,
fileName: name,
progressCallback: (count, total) {
print(
'Uploading image from file with progress: $count/$total');
});
 _response = response;
//  print(_response.isSuccessful);
  ShowToast.vitaToast(message: "Uploaded image", warn: false, long: true);
  if(response.isSuccessful) {
print('Get your image from with ${response.secureUrl}');

   _url=response.secureUrl;
}
//  print(_response.secureUrl);
 notifyListeners();
 if(_response==null){
 ShowToast.vitaToast(message: "Error uploading image", warn: true, long: true);
 _uploaded =false;
 return print("No response");
 }
 else {
 
 _url=response.secureUrl.toString();
 
_uploaded =true;
 _isloading = false;
 notifyListeners();
 }
 }
}
