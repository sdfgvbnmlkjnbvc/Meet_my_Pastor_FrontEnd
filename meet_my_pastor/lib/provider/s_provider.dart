

// import 'package:dio/dio.dart';
// import 'package:flutter/widgets.dart';
// import 'package:vitacheck/controller/baseurl.dart';
// import 'Database/db_provider.dart';



// class SensorDataApi extends ChangeNotifier {

// Map respData={};
//   Map _Data1 = {};
//   int _status=0;
//   Map get sensorData1 => _sensorData1;
//   int get  status=>_status;
//    Stream<Map> initStream() async* {
//   var public = await DatabaseProvider().getUserId();
//     try {
//       var dio = Dio();
//       Response response = await dio.get(
//           APPBASEURL.baseUrl+"sensorData/${public}");
//          respData= response.data;

//          print(respData);
//       if (respData["status"] == 200) {
//         _sensorData1 =respData;
//         print("<____Status:${respData["status"]}");
//         notifyListeners();
       
//       } else {
//         print(respData['status']);
//      _status =   respData['status'];
//      _sensorData1 =respData;
  
//      print(_status);
//         print("Error fetching Data");
//          notifyListeners();
        
//       }
//     } catch (e) {
//       print(e);
     
//     }
//   }
// }
