import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dio/dio.dart';

Future<Response> uploadImage(String url, XFile imageFile, {String fieldName = 'profile'}) async {
  Dio dio = Dio();
  try {
    FormData formData = FormData.fromMap({
      'uploads_preset': 'meetPastor',
      
      fieldName: await MultipartFile.fromFile(imageFile.path),
    });
    Response response = await dio.post(
      url,
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );
    return response;
  } catch (e) {
    print('Error uploading image: $e');
    throw e;
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key}) ;
  // final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  XFile? _image;

  Future getImage(ImageSource source) async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      try {
        final response = await uploadImage(
          'https://api.cloudinary.com/v1_1/dam1p1eyw/upload',
          pickedFile,
        );
        print('Response from create-profile: ${response.data}');
      } catch (e) {
        print('Error uploading image to create-profile: $e');
      }

      try {
        final response = await uploadImage(
          'https://api.cloudinary.com/v1_1/dam1p1eyw/upload',
          pickedFile,
          
          fieldName: 'file', // Change the field name if needed
        );
        print('Response from profile-pic-upload: ${response.data}');
      } catch (e) {
        print('Error uploading image to profile-pic-upload: $e');
      }

      setState(() {
        _image = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: _image == null ? Text('No image selected.') : Image.file(File(_image!.path)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => getImage(ImageSource.gallery),
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
