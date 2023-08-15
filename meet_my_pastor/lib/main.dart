import 'package:flutter/material.dart';

void main() {
  //print("hello world");
  runApp(
    MaterialApp(home:AboutPage())
  );
}
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Text(
        "hello!",
        style: TextStyle(fontSize: 30),
    
      ),
    ),);
  }
}