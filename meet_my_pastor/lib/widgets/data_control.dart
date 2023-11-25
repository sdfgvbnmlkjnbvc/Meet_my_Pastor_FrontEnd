import 'package:flutter/material.dart';

class data_control extends StatelessWidget {
String data;
Icon iconData;
Color circleColor;
   data_control({
    super.key,
    required this.data,required this.iconData,required this.circleColor
    
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

    Container(
      height:40,
     width:40,
      
     
      
      decoration: BoxDecoration(
 color: circleColor,
 borderRadius: BorderRadius.circular(50)

      ),
      child:   iconData,
    ),Text(data,style: const TextStyle(  fontFamily: "Montserrat",
                    fontSize: 12, fontWeight: FontWeight.bold,decoration: TextDecoration.none,
                    color:Colors.white),),
      ],
    );
  }
}