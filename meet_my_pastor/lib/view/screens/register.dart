

import 'package:flutter/material.dart';

class Register extends StatefulWidget {
 
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
     bool _eye=true;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
           SizedBox(height: 70,)
          ,
          Center(
            child: Image.asset("images/Register.png",width: 105,height: 101,),
          ),  SizedBox(height: 60,)
          ,
          Padding(
            padding: const EdgeInsets.only(top: 16,left:20.0,right: 20),
            child: TextField(
          
              decoration: InputDecoration(hintText: "Full name",
          border:OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                suffixIcon: Icon(Icons.person_pin_circle_outlined,color: Colors.black,)
              ),
            ),

          ),
          Padding(
            padding: const EdgeInsets.only(top: 16,left:20.0,right: 20),
            child: TextField(
          
              decoration: InputDecoration(hintText: "Email",
          border:OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                suffixIcon: Icon(Icons.alternate_email,color: Colors.black,)
              ),
            ),),
            Padding(
            padding: const EdgeInsets.only(top: 16,left:20.0,right: 20),
            child: TextField(
          
              decoration: InputDecoration(hintText: "Contact",
          border:OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                suffixIcon: Icon(Icons.phone_iphone_outlined,color: Colors.black,)
              ),
            ),),
           Padding(
            padding: const EdgeInsets.only(top: 16,left:20.0,right: 20),
            child: TextField(
          obscureText:true ,
              decoration: InputDecoration(hintText: "Password",
          border:OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                suffixIcon: IconButton(onPressed: (){
setState((){
  _eye=!_eye;
  print(_eye);
});
                },
                icon: _eye ? const Icon( Icons.remove_red_eye_outlined,color: Colors.black ) : const Icon(Icons.visibility_off,color: Colors.black,) )
              ),
            ),
          ),
       Padding(
            padding: const EdgeInsets.only(top: 16,left:20.0,right: 20),
            child: TextField(
          
              decoration: InputDecoration(hintText: "Confirm Password",
          border:OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                suffixIcon: Icon(Icons.remove_red_eye_outlined,color: Colors.black,)
              ),
            ),
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
            
          ),height:60,width: 364,child: Center(child: Text("Register",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),)), )),
      )
      ,
       Padding(
         padding: const EdgeInsets.all(20.0),
         child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text(" have an account? "),
           Text("SignIn",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
         ],),
       ),

        ]),
      ),
    );
  }
}