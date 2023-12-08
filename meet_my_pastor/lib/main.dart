import 'package:flutter/material.dart';
import 'package:meet_my_pastor/provider/apointment.dart';
import 'package:meet_my_pastor/provider/auth/auth_provider.dart';
import 'package:meet_my_pastor/provider/auth/sendimage.dart';
import 'package:meet_my_pastor/provider/contact_provider.dart';
import 'package:meet_my_pastor/provider/event_provider.dart';
import 'package:meet_my_pastor/provider/pastor_provider.dart';
import 'package:meet_my_pastor/provider/testimony_provider.dart';

import 'package:meet_my_pastor/provider/testupload.dart';
import 'package:meet_my_pastor/view/screens/appointment_detail.dart';
import 'package:meet_my_pastor/view/screens/home.dart';
import 'package:provider/provider.dart';

import 'view/screens/admin_control.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Authentication()),
        ChangeNotifierProvider(
          create: (_) => CloudImage(),
        ),
        ChangeNotifierProvider(
          create: (_) => FetchImage(),
        ),
        ChangeNotifierProvider(create: (_) => AppointmentProvider()),
        ChangeNotifierProvider(create: (_) => EventProvider()),
        ChangeNotifierProvider(create: (_) => ContactProvider()),
        ChangeNotifierProvider(create: (_) => PastorProvider()),
        ChangeNotifierProvider(create: (_) => TestimonyProvider())
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true,
        brightness: Brightness.light,
        fontFamily:"Montserrat",
        
        
        ),
        debugShowCheckedModeBanner: false,
        home: const SafeArea(
          child:
          // AppointmentDetail(pastorId:"526f04e3-e5c3-455a-99f4-96b4300dab7a" ,title: "new",),
          HomePage(),
          // Controlpage()
          
        ),
      ),
    );
  }
}


