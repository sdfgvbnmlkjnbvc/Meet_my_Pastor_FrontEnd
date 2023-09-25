import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../controller/baseurl.dart';

class PastorProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _state = false;
  int? _itemCount;
  bool _admin = false;
  Map<String, dynamic> respData = {};

  int? get itemCount => _itemCount;
  bool get state => _state;
  bool get isLoading => _isLoading;
  bool get admin => _admin;

  Stream<Map> pastors() async* {
    _isLoading = true;
    notifyListeners();

    try {
      var dio = Dio();
      Response response = await dio.get("${APPBASEURL.baseUrl}pastors");
      respData = response.data;
      print("--------- ${respData['pastor'].length} --------------");
      //  _itemCount=respData['pastor'].length;
      print(_itemCount);
      if (respData['status'] == 200) {
        _itemCount = respData['pastor'].length;
        print(_itemCount);
        _isLoading = false;
        notifyListeners();
      } else {
        _isLoading = false;
        _state = true;
        notifyListeners();
      }
    } on DioError catch (e) {
      // handleDioError(e, context);
      print(e);
    } catch (e) {
      // handleGenericError(e, context);
      print(e);
    }
  }

  Future<void> pastor({
    required String name,
    required String title,
    required String contact,
    required String imageUrl,
    required BuildContext context,
  }) async {
    _isLoading = true;
    notifyListeners();
    final body = {
      "user-id": "5f8e7fc5-1508-4bca-8706-041193680363",
      "Pastor-Name": name,
      "Contact": contact,
      "title": title,
      "Image": imageUrl
    };

    try {
      var dio = Dio();
      Response response =
          await dio.post("${APPBASEURL.baseUrl}pastor", data: body);
      respData = response.data;
      print("--------- ${respData['pastor']} --------------");
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
