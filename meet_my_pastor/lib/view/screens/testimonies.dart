import 'package:flutter/material.dart';
import 'package:meet_my_pastor/widgets/event_widgets.dart';
import 'package:meet_my_pastor/widgets/testimony_widgets.dart';


class Testimonies extends StatelessWidget {
  const Testimonies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
mainAxisAlignment: MainAxisAlignment.start,
  children: [
    SizedBox(height: 30,),
   Padding(
    
     padding: const EdgeInsets.all(8.0),
     child: Text("Testimonies",style: TextStyle(fontSize:16,fontWeight: FontWeight.w800 ),),
   ),
      Testimony(),
      // SizedBox(height: 10,),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Up coming Events",style: TextStyle(fontSize:16,fontWeight: FontWeight.w800 ),),
      ),
      Events()
  ],
)
    
      );

    
  }
}
