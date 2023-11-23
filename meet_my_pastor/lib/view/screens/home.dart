import 'package:flutter/material.dart';
import 'package:meet_my_pastor/page_navigator.dart';
import 'package:meet_my_pastor/view/screens/about.dart';
import 'package:meet_my_pastor/view/screens/contact_us.dart';
import 'package:meet_my_pastor/view/screens/register.dart';
import 'package:meet_my_pastor/view/screens/testimonies.dart';

import 'login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    const Spacer(),
                    const Icon(Icons.menu_sharp, weight: 69),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Material(
                    child: InkWell(
                      onTap: () {
                        PageNavigator(ctx: context)
                            .nextPage(page: const AboutPage());
                      },
                      child: const Text(
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
                      onTap: () {
                        PageNavigator(ctx: context)
                            .nextPage(page: const contactUs());
                      },
                      child: const Text(
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
                      onTap: () {
                        PageNavigator(ctx: context)
                            .nextPage(page: const Testimonies());
                      },
                      child: const Text(
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
              const SizedBox(
                height: 40,
              ),
              Image.asset("images/text.png"),
              const SizedBox(
                height: 40,
              ),
              Material(
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    PageNavigator(ctx: context)
                        .nextPageOnly(page: const Register());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFF3E64FF),
                        borderRadius: BorderRadius.circular(6)),
                    height: 60,
                    width: 264,
                    child: const Center(
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
              const SizedBox(
                height: 20,
              ),
              Material(
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    PageNavigator(ctx: context)
                        .nextPageOnly(page: const Login());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFF3E64FF),
                        borderRadius: BorderRadius.circular(6)),
                    height: 60,
                    width: 264,
                    child: const Center(
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
              const SizedBox(
                height: 30,
              ),
              Image.asset("images/homePageImage.png")
            ],
          ),
        ),
      ),
    );
  }
}
