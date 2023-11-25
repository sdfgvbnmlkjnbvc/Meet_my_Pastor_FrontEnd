import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:meet_my_pastor/controller/baseurl.dart';
import 'package:meet_my_pastor/page_navigator.dart';
import 'package:meet_my_pastor/view/admin.dart';
import 'package:meet_my_pastor/view/screens/appointment.dart';
import 'package:meet_my_pastor/view/screens/login.dart';
import 'package:meet_my_pastor/widgets/meettoast.dart';

class Authentication extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = false;
  bool _state = false;
  int? _itemCount;
  bool _admin = false;
  String userId = "";
  String _userName = "";
  Map<String, dynamic> respData = {};

  int? get itemCount => _itemCount;
  bool get state => _state;
  bool get isLoading => _isLoading;
  bool get admin => _admin;
  String get user_id => userId;
  String get userName => _userName;
  Future<void> signup({
    required String name,
    required String email,
    required String password,
    required String contact,
    required BuildContext context,
  }) async {
    _isLoading = true;
    notifyListeners();
    final body = {
      "name": name,
      "email": email,
      "contact": contact,
      "password": password,
      "admin": false
    };

    try {
      var dio = Dio();
      Response response =
          await dio.post("${APPBASEURL.baseUrl}user", data: body);
      respData = response.data;

      if (respData['status'] == 201) {
        ShowToast.vitaToast(message: "Account created", warn: false);
        _isLoading = false;
        notifyListeners();
        PageNavigator(ctx: _scaffoldKey.currentState?.context)
            .nextPage(page: const Login());
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
  }) async {
    _isLoading = true;
    notifyListeners();
    final body = {"email": email, "password": password};

    try {
      final dio = Dio();
      final response = await dio.post("${APPBASEURL.baseUrl}login", data: body);

      if (response.data['status'] == 200) {
        final res = response.data;
        // print("User data: $res");
        userId = res['user']['public_id'];
        _userName = res['user']['name'];
        // final token = res['auth_token'];
        _admin = res['user']['admin'];
        // print("admin: $_admin");

        if (_admin == true) {
          PageNavigator(ctx: _scaffoldKey.currentState?.context)
              .nextPageOnly(page: const Admin());
        } else {
          PageNavigator(ctx: _scaffoldKey.currentState?.context)
              .nextPageOnly(page: const Appointment());
        }

        ShowToast.vitaToast(message: "Authenticated", warn: state, long: true);
      } else {
        _state = true;
        ShowToast.vitaToast(
            message: "Wrong Credentials", warn: true, long: true);
      }
    } on DioError catch (e) {
      handleDioError(e, _scaffoldKey.currentState?.context);
    } catch (e) {
      handleGenericError(e, _scaffoldKey.currentState?.context);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getAll() async {
    try {
      final dio = Dio();

      final response =
          await dio.get('https://meet-my-pastor.onrender.com/api/users');

      respData = response.data;
 
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
    
    } catch (e) {
      handleGenericError(e);
      
    }
  }

  void handleDioError(DioError e, [BuildContext? context]) {
    _isLoading = false;
    _state = true;

    if (e.type == DioExceptionType.badResponse) {
      final response = e.response;
      final statusCode = response?.statusCode;
      final statusMessage = response?.statusMessage;
      ShowToast.vitaToast(message: "$statusCode: $statusMessage", warn: true);
    } else if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      ShowToast.vitaToast(message: "Network Timeout", warn: true);
    } else if (e.type == DioExceptionType.cancel) {
      ShowToast.vitaToast(message: "Request Cancelled", warn: true);
    } else {
      ShowToast.vitaToast(message: "Network Error", warn: true);
    }

    if (context != null) {
      notifyListeners();
  
    }
  }

  void handleGenericError(dynamic e, [BuildContext? context]) {
    _isLoading = false;
    _state = true;
    ShowToast.vitaToast(message: "$e", warn: true);
    if (context != null) {
      notifyListeners();
    
    }
  }
}
