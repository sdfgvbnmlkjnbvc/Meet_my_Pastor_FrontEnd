import 'package:flutter/material.dart';
import 'package:meet_my_pastor/pageNavigator.dart';
import 'package:meet_my_pastor/view/screens/about.dart';
import 'package:meet_my_pastor/view/screens/register.dart';
import 'package:meet_my_pastor/view/screens/testimonies.dart';

import 'login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "images/homePage.png",
                  width: 40,
                  height: 40,
                ),
                Spacer(),
                Icon(Icons.menu_sharp, weight: 69),
                SizedBox(height: 10),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                child: InkWell(onTap: (){
                  pageNavigator(ctx: context).nextPage(page: AboutPage());
                },
                  child: Text(
                    "About",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Material(
                child: InkWell(
                  onTap: (){
                    // pageNavigator(ctx: context).nextPage(page: AboutPage());
                  },
                  child: Text(
                    "Contact us",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Material(
                child: InkWell(
                  onTap: (){
                   
                    pageNavigator(ctx: context).nextPage(page: Testimonies());
                  },
                  child: Text(
                    "Testimonies",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Image.asset("images/text.png"),
          SizedBox(
            height: 40,
          ),
          Material(
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                print("hello world");
                 pageNavigator(ctx: context).nextPageOnly(page: Register());
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFF3E64FF),
                    borderRadius: BorderRadius.circular(6)),
                height: 60,
                width: 264,
                child: Center(
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Material(
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                print("hello world");
                pageNavigator(ctx: context).nextPageOnly(page: Login());
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFF3E64FF),
                    borderRadius: BorderRadius.circular(6)),
                height: 60,
                width: 264,
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          
           SizedBox(height: 30,),
           Image.asset("images/homePageImage.png")

        ],
      ),
    ),);
  }
}
