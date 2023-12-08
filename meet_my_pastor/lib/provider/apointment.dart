import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meet_my_pastor/widgets/meettoast.dart';

class AppointmentProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _state = false;
  int? _itemCount;
  final bool _admin = false;
  Map<String, dynamic> _respData = {}; 

  int? get itemCount => _itemCount;
  bool get state => _state;
  bool get isLoading => _isLoading;
  bool get admin => _admin;
Map<String,dynamic> get respData =>_respData;
   
  Future<void> bookAppointment({
    required String name,
    required String email,
    required String userId,
    required String date,
    required String reason,
    required String time,
    required String pastor,
    required BuildContext context,
  }) async {
    _isLoading = true;
    notifyListeners();
    final body = {
      "user-id": userId,
      "pastor": pastor,
      "name": name,
      "email": email,
      "date": date,
      "time": time,
      "reason": reason
    };

    try {
      var dio = Dio();
      Response response =
          await dio.post("https://meet-my-pastor.onrender.com/api/appointment", data: body);
      _respData = response.data;

      if (_respData['status'] == 201) {
        ShowToast.vitaToast(message: "Appointment booked", warn: false);
        _isLoading = false;
        notifyListeners();
 
      } else {
        ShowToast.vitaToast(message: "User Already Exists", warn: false);
        _isLoading = false;
        _state = true;
        notifyListeners();
      }
    } on DioException catch (e) {
      handleDioError(e, context);
    } catch (e) {
      handleGenericError(e, context);
    }
  }

  Stream<void> Appointments({
    required BuildContext context,
  }) async* {
    _isLoading = true;
    notifyListeners();

    try {
      var dio = Dio();
      Response response =
          await dio.get("https://meet-my-pastor.onrender.com/api/getappointment");
      _respData = response.data;
      notifyListeners();

//  print(_respData);
    } on DioException catch (e) {
      handleDioError(e, context);
    } catch (e) {
      handleGenericError(e, context);
    }
  }

  void handleDioError(DioException e, [BuildContext? context]) {
    _isLoading = false;
    _state = true;

    if (e.type == DioExceptionType.badResponse) {
      final response = e.response;
      final statusCode = response?.statusCode;
      final statusMessage = response?.statusMessage;
      ShowToast.vitaToast(message: "$statusCode: $statusMessage", warn: true);
    } else if (e.type == DioExceptionType.connectionTimeout ||
        e.type ==  DioExceptionType.sendTimeout ||
        e.type ==  DioExceptionType.receiveTimeout) {
      ShowToast.vitaToast(message: "Network Timeout", warn: true);
    } else if (e.type ==  DioExceptionType.cancel) {
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
