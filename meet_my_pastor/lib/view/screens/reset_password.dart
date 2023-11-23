


import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
        const SizedBox(height: 90,),
        Image.asset("images/reset.png",width: 236,height: 254,),
        const SizedBox(height: 90,),
         Padding(
            padding: const EdgeInsets.only(top: 16,left:20.0,right: 20),
            child: TextField(
          
              decoration: InputDecoration(hintText: "Enter your email",
          border:OutlineInputBorder(borderRadius: BorderRadius.circular(8),
          // borderSide: BorderSide(width: 2.0,color:Colors.red
          // ),
              ),
                suffixIcon:const Icon(Icons.alternate_email,color: Colors.black,)
            ),
          ),),
          const SizedBox(height: 120,),
           Material(
        child: InkWell(splashColor: Colors.transparent,onTap: (){
          print("hello world");
        },
          child: Container(decoration: BoxDecoration(
            color: const Color(0xfff3e64ff),
            borderRadius: BorderRadius.circular(6)
            
          ),height:60,width: 360,child: const Center(child: Text("Reset",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),)), )),
      )
      ]),
    );
  }
}