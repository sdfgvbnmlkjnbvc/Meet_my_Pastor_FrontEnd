import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';


import '../controller/baseurl.dart';

class TestimonyProvider extends ChangeNotifier {
  bool _isLoading = true;
  bool _state = false;
  int? _itemCount;
  bool _admin = false;
  Map<String, dynamic> respData = {};
List<dynamic> _Data = [];
  int? get itemCount => _itemCount;
  bool get state => _state;
  bool get isLoading => _isLoading;
  bool get admin => _admin;
List<dynamic> get Data =>_Data;

  Future<Map>testimonies() async {

    try {
      var dio = Dio();
      Response response = await dio.get("https://meet-my-pastor.onrender.com/api/testimonies");
      respData = response.data;
     
      print("-----Checking Testimony---- ${respData['Testimony'].length} --------------");
   
      if (respData['status'] == 200) {
        _itemCount = respData['Testimony'].length;
       _Data = respData['Testimony'];

        print(_itemCount);
        _isLoading = false;
        notifyListeners();
      } else {
        _isLoading = false;
        _state = true;
        notifyListeners();
      }
    } on DioError catch (e) {
      
      print(e);
    } catch (e) {
     
      print(e);
    }
    return {"no Data":"no Data"};
  }

  Future<void> testimony({
    required String name,
    required String date,
    required String message,
    required String title,
    required String imageUrl,
    required BuildContext context,
  }) async {
    _isLoading = true;
    notifyListeners();
    final body = {
      "user-id": "5f8e7fc5-1508-4bca-8706-041193680363",
      "name": name,
      "message": message,
      "date": date,
      "title":title,
      "Image": imageUrl
    };

    try {
      var dio = Dio();
      Response response =
          await dio.post("${APPBASEURL.baseUrl}testimony", data: body);
      respData = response.data;
      print("--------- ${respData['testimony']} --------------");
      //  _itemCount=respData['pastor'].length;
    } on DioError catch (e) {
      // handleDioError(e, context);
      print(e);
    } catch (e) {
      // handleGenericError(e, context);
      print(e);
    }
  }
}


