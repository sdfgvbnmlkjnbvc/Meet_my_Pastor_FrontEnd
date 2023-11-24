import 'package:flutter/material.dart';
import 'package:meet_my_pastor/widgets/event_widgets.dart';
import 'package:meet_my_pastor/widgets/testimony_widgets.dart';

import '../../page_navigator.dart';
import 'appointment.dart';
import 'home.dart';

class Testimonies extends StatelessWidget {
  const Testimonies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.blue,
              ),
              onPressed: () {
                PageNavigator(ctx: context)
                    .nextPageOnly(page: const Appointment());
              },
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  PageNavigator(ctx: context)
                      .nextPageOnly(page: const HomePage());
                },
                icon: const Icon(color: Colors.blue, Icons.exit_to_app))
          ],
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Testimonies",
                    style: TextStyle(  fontFamily: "Montserrat",
                      fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Testimony(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Up coming Events",
                    style: TextStyle(  fontFamily: "Montserrat",
                      fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10,),
                Events()
              ],
            ),
          ),
        ));
  }
}
