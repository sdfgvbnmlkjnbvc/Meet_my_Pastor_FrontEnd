
import 'package:flutter/material.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
           SizedBox(height: 120,)
          ,
          Center(
            child: Image.asset("images/login.png",width: 236,height: 254,),
          ),
          Padding(
            padding: const EdgeInsets.only(left:20.0,right: 20),
            child: TextField(
          
              decoration: InputDecoration(hintText: "Enter your email",
          border:OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                suffixIcon: Icon(Icons.alternate_email)
              ),
            ),
          ), Padding(
            padding: const EdgeInsets.only(top: 16,left:20.0,right: 20),
            child: TextField(
          
              decoration: InputDecoration(hintText: "Password",
          border:OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                suffixIcon: Icon(Icons.remove_red_eye)
              ),
            ),
          ),
      
          Padding(
            padding: const EdgeInsets.only(left:20.0,top: 12),
            child: Row(children: [
              Text("Forgot Password ? "),
              Text("Reset",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
            ],),
          ),
          SizedBox(height: 60,)
          ,
      Material(
        child: InkWell(splashColor: Colors.transparent,onTap: (){
          print("hello world");
        },
          child: Container(decoration: BoxDecoration(
            color: Color(0xFFF3E64FF),
            borderRadius: BorderRadius.circular(6)
            
          ),height:60,width: 364,child: Center(child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),)), )),
      )
        ]),
      ),
    );
  }
}
