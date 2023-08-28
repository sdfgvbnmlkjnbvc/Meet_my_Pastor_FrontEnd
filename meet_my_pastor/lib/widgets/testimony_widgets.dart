

import 'package:flutter/material.dart';

class Testimony extends StatelessWidget {
  const Testimony({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          
              itemCount: 10,
              itemBuilder: (context, index){
    
    return Padding(
    padding: const EdgeInsets.all(8.0),
    child:   Column(
    
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
    
    children: [ClipRRect(child: Container(color: Colors.amber,height: 150,width: 200,child: Image.asset(
    
                            "images/Image.png",
    
                            height: MediaQuery.of(context).size.height,
    
                            width: MediaQuery.of(context).size.width,
    
                            fit: BoxFit.fitWidth,
    
                          ), ),),
    SizedBox(height: 10,),
                          Text("Michael",style: TextStyle(fontSize:16,fontWeight: FontWeight.w800 ),), Text("Rockson",style: TextStyle(fontSize:16,fontWeight: FontWeight.w800 ),)
    
                          ],
    
    ),
    );
              }
                  
                     
         ),
    );
  }
}
