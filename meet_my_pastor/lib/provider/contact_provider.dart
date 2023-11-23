import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meet_my_pastor/widgets/meettoast.dart';

import '../controller/baseurl.dart';

class ContactProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _state = false;
  int? _itemCount;
  final bool _admin = false;
  Map<String, dynamic> respData = {};

  int? get itemCount => _itemCount;
  bool get state => _state;
  bool get isLoading => _isLoading;
  bool get admin => _admin;

  Stream<Map> contacts() async* {
    _isLoading = true;
    notifyListeners();

    try {
      var dio = Dio();
      Response response = await dio.get("${APPBASEURL.baseUrl}contacts");
      respData = response.data;
      // print("--------- ${respData['contact'].length} --------------");
      //  _itemCount=respData['contact'].length;
      // print(_itemCount);
      if (respData['status'] == 200) {
        _itemCount = respData['contact'].length;
        // print(_itemCount);
        _isLoading = false;
        notifyListeners();
      } else {
        _isLoading = false;
        _state = true;
        notifyListeners();
      }
    } on DioError catch (e) {
      // handleDioError(e, context);
      ShowToast.vitaToast(message: " Error: $e", warn: true);
    } catch (e) {
      // handleGenericError(e, context);
      // print(e);
      ShowToast.vitaToast(message: " Error: $e", warn: true);
    }
  }

  Future<void> contact({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
    required String message,
    required BuildContext context,
  }) async {
    _isLoading = true;
    notifyListeners();
    final body = {
      "FirstName": firstName,
      "LastName": lastName,
      "Phone": phone,
      "Email": email,
      "Message": message
    };

    try {
      var dio = Dio();
      Response response =
          await dio.post("${APPBASEURL.baseUrl}contact", data: body);
      respData = response.data;
      // print("--------- ${respData['msg']} --------------");
      if (respData["status"] == 201) {
        ShowToast.vitaToast(message: "message sent", warn: false);
      }
      //  _itemCount=respData['contact'].length;
    } on DioError catch (e) {
      // handleDioError(e, context);
      ShowToast.vitaToast(
          message: "Server Encounted an Error \n error: $e ", warn: true);
      // print(e);
    } catch (e) {
      // handleGenericError(e, context);
      ShowToast.vitaToast(message: " Error: $e", warn: true);

      // print(e);
    }
  }
}
