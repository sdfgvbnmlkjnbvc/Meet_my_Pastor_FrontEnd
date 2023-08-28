import 'package:flutter/material.dart';


class appointment_card extends StatelessWidget {
  const appointment_card({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(margin: EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.white,boxShadow:  [BoxShadow(
                      color:Colors.grey,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),]),
        
        width: MediaQuery.of(context).size.width*0.8,
        height:154,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [
          Image.asset(
    
                            "images/Yoshua.png",
    
                            height: 109,
    
                            width: 96,
    
                            fit: BoxFit.fitWidth,
    
                          ), 
                          Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Text("Yoshua N. Masasu"),
                            Text("Apostle"),
                            Row(children: [Icon(Icons.call),Text("+233 544 084 355")],),
                            Material(
        child: InkWell(splashColor: Colors.transparent,onTap: (){
          print("hello world");
        },
          child: Container(decoration: BoxDecoration(
            color: Color(0xFFF3E64FF),
            borderRadius: BorderRadius.circular(6)
            
          ),height:22,width: 150,child: Center(child: Text("Book appointment",style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),)), )),
      )
                          ],)
        ]),
      ),
    );
  }
}