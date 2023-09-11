import 'package:path/path.dart';
import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';

/**
 * accepts three parameters, the endpoint, formdata (except fiels),files (key,File)
 * returns Response from server
 */
Future<Response> sendForm(
    String url, Map<String, dynamic> data, Map<String, File> files) async {
  Map<String, MultipartFile> fileMap = {};
  for (MapEntry fileEntry in files.entries) {
    File file = fileEntry.value;
    String fileName = basename(file.path);
    fileMap[fileEntry.key] =
        MultipartFile(file.openRead(), await file.length(), filename: fileName);
  }
  data.addAll(fileMap);
  var formData = FormData.fromMap(data);
  Dio dio = new Dio();
  return await dio.post(url,
      data: formData, options: Options(contentType: 'multipart/form-data'));
}

/**
 * accepts two parameters,the endpoint and the file
 * returns Response from server
 */
Future<Response> sendFile(String url, File file) async {
  Dio dio = new Dio();
  var len = await file.length();
  var response = await dio.post(url,
      data: file.openRead(),
      options: Options(headers: {
        Headers.contentLengthHeader: len,
      } // set content-length
          ));
  return response;
}