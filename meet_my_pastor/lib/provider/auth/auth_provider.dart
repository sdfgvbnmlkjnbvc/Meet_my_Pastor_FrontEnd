

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:meet_my_pastor/controller/baseurl.dart';
import 'package:meet_my_pastor/pageNavigator.dart';
import 'package:meet_my_pastor/view/screens/home.dart';
import 'package:meet_my_pastor/view/screens/login.dart';
import 'package:meet_my_pastor/widgets/meettoast.dart';


class Authentication extends ChangeNotifier {
  bool _isLoading = false;
  bool _state = false;
  Map<String, dynamic> respData = {};

  bool get state => _state;
  bool get isLoading => _isLoading;

  Future<void> signup({
    required String name,
    required String email,
    required String password,
    required String contact,
    required BuildContext context,
  }) async {
    _isLoading = true;
    notifyListeners();
    final body = {"name": name, "email": email, "contact": contact, "password": password};

    try {
      var  dio = Dio();
      Response response = await dio.post("${APPBASEURL.baseUrl}user", data: body);
      respData = response.data;

      if (respData['status'] == 201) {
        ShowToast.vitaToast(message: "Account created", warn: false);
        _isLoading = false;
        notifyListeners();
        pageNavigator(ctx: context).nextPage(page: const Login());
      } else {
        ShowToast.vitaToast(message: "User Already Exists", warn: false);
        _isLoading = false;
        _state = true;
        notifyListeners();
      }
    } on DioError catch (e) {
      handleDioError(e, context);
    } catch (e) {
      handleGenericError(e, context);
    }
  }

  Future<void> loginUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    _isLoading = true;
    notifyListeners();
    final body = {"email": email, "password": password};

    try {
      final dio = Dio();
      final response = await dio.post("${APPBASEURL.baseUrl}login", data: body);

      if (response.data['status'] == 200) {
        final res = response.data;
        final userId = res['user']['public_id'];
        final userName = res['user']['name'];
        final token = res['auth_token'];
        pageNavigator(ctx: context).nextPageOnly(page: const HomePage());
        ShowToast.vitaToast(message: "Authenticated", warn: state, long: true);
        _isLoading = false;
        notifyListeners();
      } else {
        _isLoading = false;
        _state = true;
        ShowToast.vitaToast(message: "Wrong Credentials", warn: true, long: true);
        notifyListeners();
      }
    } on DioError catch (e) {
      handleDioError(e, context);
    } catch (e) {
      handleGenericError(e, context);
    }
  }

  Future<void> getAll() async {
    try {
      final dio = Dio();

      final response = await dio.get('https://meet-my-pastor.onrender.com/api/users');
      // dio.options.headers['content-Type'] = 'text/plain; charset=UTF-8';
      // dio.options.headers['Access-Control-Allow-Origin'] = '*';
      // dio.options.headers['Access-Control-Allow-Methods'] = 'GET , POST';
      respData = response.data;
      print(respData);
      ShowToast.vitaToast(message: "${response.statusMessage}", warn: true);

      if (respData['status'] == 201) {
        ShowToast.vitaToast(message: "All users", warn: false);
        _isLoading = false;
        notifyListeners();
      } else {
        ShowToast.vitaToast(message: "User Already Exists", warn: false);
        _isLoading = false;
        _state = true;
        notifyListeners();
      }
    } on DioError catch (e) {
      handleDioError(e);
       print(e);
    } catch (e) {
      handleGenericError(e);
       print(e);
    }
  }

  void handleDioError(DioError e, [BuildContext? context]) {
    _isLoading = false;
    _state = true;

    if (e.type == DioErrorType.response) {
      final response = e.response;
      final statusCode = response?.statusCode;
      final statusMessage = response?.statusMessage;
      ShowToast.vitaToast(message: "$statusCode: $statusMessage", warn: true);
    } else if (e.type == DioErrorType.connectTimeout || e.type == DioErrorType.sendTimeout || e.type == DioErrorType.receiveTimeout) {
      ShowToast.vitaToast(message: "Network Timeout", warn: true);
    } else if (e.type == DioErrorType.cancel) {
      ShowToast.vitaToast(message: "Request Cancelled", warn: true);
    } else {
      ShowToast.vitaToast(message: "Network Error", warn: true);
    }

    if (context != null) {
      notifyListeners();
      // rethrow;
    }
  }

  void handleGenericError(dynamic e, [BuildContext? context]) {
    _isLoading = false;
    _state = true;
    ShowToast.vitaToast(message: "$e", warn: true);
    if (context != null) {
      notifyListeners();
      // rethrow;
    }
  }
}
