import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:meet_my_pastor/view/screens/login.dart';

import '../../controller/baseurl.dart';
import '../../pageNavigator.dart';
import '../../view/screens/home.dart';
import '../../widgets/meettoast.dart';


class Authentication extends ChangeNotifier {
  bool _isloading = false;
  bool _state=false;
  Map respData={};
bool get state=>_state;
  bool get isloading => _isloading;
  Future<void> signup({
    required String name,
    required String email,
    required String password,
    required String contact,
   required BuildContext context,
  }) async {
    _isloading = true;
    notifyListeners();
    final body = {"name": name, "email": email,"contact":contact ,"password": password};

    try {
      var dio = Dio();
      Response response =
          await dio.post("${APPBASEURL.baseUrl}user", data: body);
          respData=response.data;
 
      if (respData['status']==201) {

              ShowToast.vitaToast(message: "account  created",warn: false);

         _isloading = false;
   
        notifyListeners();
      
        pageNavigator(ctx: context).nextPage(page: const Login());

        
      } else {

              ShowToast.vitaToast(message:"User Already Exists",warn: false);

        _isloading = false;
        _state=true;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isloading = false;
    
            ShowToast.vitaToast(message:"Network Error",warn: true);

       _state=true;
      notifyListeners();
      rethrow;
    } catch (e) {
      
      _isloading = false;
            ShowToast.vitaToast(message:"User Already Exists",warn: true);

      _state=true;
      notifyListeners();
    }
  }

  Future<void> loginUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    _isloading = true;
    notifyListeners();
    final body = {"email": email, "password": password};

    var respMess = "";

    try {
      var dio = Dio();
      Response response =
          await dio.post("${APPBASEURL.baseUrl}login", data: body);
          print(response.data);
      if (response.data['status']==200) {
     
        final res = response.data;

        final userId = res['user']['public_id'];
        final userName = res['user']['name'];
        final token = res['auth_token'];
        // DatabaseProvider().savedUserName(userName);
        // DatabaseProvider().savedUserId(userId);
        // DatabaseProvider().savedToken(token);
        pageNavigator(ctx: context).nextPageOnly(page: const HomePage());
        ShowToast.vitaToast(message:"Authenticated",warn: state,long: true);
         _isloading = false;
        
        notifyListeners();
      } else {
        _isloading = false;
        _state=true;
   
      ShowToast.vitaToast(message:"Wrong Credentials",warn: true,long: true);

        notifyListeners();
      }
    } on SocketException catch (_) {
      _isloading = false;
      
               ShowToast.vitaToast(message:"Internet connection is not available",warn: true);

    _state=true;
      notifyListeners();

      rethrow;
    } catch (e) {
      _isloading = false;
   
                     ShowToast.vitaToast(message:"Please try again",warn: true);

      _state=true;
      notifyListeners();
    }
  }


}
