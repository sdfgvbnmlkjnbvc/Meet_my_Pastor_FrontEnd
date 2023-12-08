

import 'package:flutter/material.dart';

class readAppointment extends StatelessWidget {
  Text msg;
  Text name;
  Text time;
  Text date;
  Text pastor;
   readAppointment({Key? key,required this.msg ,required this.name,required this.time,required this.date,required this.pastor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:const EdgeInsets.all(25.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
          Row(children: [date,const SizedBox(width: 20,),time,const Spacer(),name],),
          pastor,
         msg
        ],),
      ),
    );
  }
}