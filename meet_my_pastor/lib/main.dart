import 'package:flutter/material.dart';
import 'package:meet_my_pastor/provider/Apointment.dart';
import 'package:meet_my_pastor/provider/auth/auth_provider.dart';
import 'package:meet_my_pastor/provider/auth/sendimage.dart';
import 'package:meet_my_pastor/provider/contact_provider.dart';
import 'package:meet_my_pastor/provider/event_provider.dart';
import 'package:meet_my_pastor/provider/pastor_provider.dart';
import 'package:meet_my_pastor/provider/testimony_provider.dart';
import 'package:meet_my_pastor/view/admin.dart';
import 'package:meet_my_pastor/view/screens/appointment_detail.dart';
import 'package:meet_my_pastor/view/screens/contact_us.dart';

import 'package:meet_my_pastor/view/screens/home.dart';
import 'package:meet_my_pastor/provider/testupload.dart';
import 'package:meet_my_pastor/view/screens/testimonies.dart';
import 'package:provider/provider.dart';

import 'view/screens/Testimony_view.dart';

void main() {
  runApp(
    
    MyApp());
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
        
      
          debugShowCheckedModeBanner: false, home: SafeArea(
            
            child: contactUs(),),),
    );
  }
}



  //  final getTestimony =Provider.of<TestimonyProvider>(context);
  //                    print("--check2--${getTestimony.itemCount}");
  //   print("--check2--${getTestimony.Data}");