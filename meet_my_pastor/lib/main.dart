import 'package:flutter/material.dart';
import 'package:meet_my_pastor/provider/auth/auth_provider.dart';
import 'package:meet_my_pastor/view/screens/home.dart';
import 'package:meet_my_pastor/view/screens/login.dart';
import 'package:meet_my_pastor/view/screens/register.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Authentication()),
          // Add other providers as needed
        ],
        child: HomePage(),
      ),
    );
  }
}