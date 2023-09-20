import 'package:flutter/material.dart';
import 'package:meet_my_pastor/provider/auth/auth_provider.dart';
import 'package:meet_my_pastor/provider/auth/sendimage.dart';
import 'package:meet_my_pastor/view/admin.dart';
import 'package:meet_my_pastor/view/screens/appointment.dart';
import 'package:meet_my_pastor/view/screens/home.dart';
import 'package:meet_my_pastor/provider/testupload.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Authentication()),
           ChangeNotifierProvider(
            create:(_)=> CloudImage(),
          ),
           ChangeNotifierProvider(
            create:(_)=> FetchImage(),
          )
      
        ],
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SafeArea(child: Appointment()),
      ),
    );
  }
}


