import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../controller/baseurl.dart';

class EventProvider extends ChangeNotifier {
  bool _isLoading = true;
  bool _state = false;
  int? _itemCount;
  bool _admin = false;
  Map<String, dynamic> respData = {};

  int? get itemCount => _itemCount;
  bool get state => _state;
  bool get isLoading => _isLoading;
  bool get admin => _admin;
List<dynamic> _Data = [];
 List<dynamic> get Data =>_Data;


 Future<Map> events() async {
  

    try {
      var dio = Dio();
      Response response = await dio.get("${APPBASEURL.baseUrl}events");
      respData = response.data;
      print("--------- Event Provider ${respData['event'].length} --------------");
      if (respData['status'] == 200) {
        _itemCount = respData['event'].length;
        _Data=respData['event'];
        print(_Data);
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

  Future<void> event({
    required String name,
    required String date,
    required String location,
    required String time,
    required String imageUrl,
     required String eventDescription,
    required BuildContext context,
  }) async {
    _isLoading = true;
    notifyListeners();
    final body = {
      "user-id": "5f8e7fc5-1508-4bca-8706-041193680363",
      "name": name,
      "date": date,
      "time":time,
      "location":location,
      "image": imageUrl,
      "eventDescription":eventDescription
    };

    try {
      var dio = Dio();
      Response response =
          await dio.post("${APPBASEURL.baseUrl}event", data: body);
      respData = response.data;
      print("--------- ${respData['event']} --------------");
    
    } on DioError catch (e) {

      print(e);
    } catch (e) {
      
      print(e);
    }
  }
}
