import 'package:flutter/material.dart';
<<<<<<< HEAD
=======

>>>>>>> 045705c4d45861a616606d76b4845c19c791672f
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
<<<<<<< HEAD
                pageNavigator(ctx: context).nextPageOnly(page: const Appointment());
=======
                PageNavigator(ctx: context)
                    .nextPageOnly(page: const Appointment());
>>>>>>> 045705c4d45861a616606d76b4845c19c791672f
              },
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
<<<<<<< HEAD
                  pageNavigator(ctx: context).nextPageOnly(page: const HomePage());
=======
                  PageNavigator(ctx: context)
                      .nextPageOnly(page: const HomePage());
>>>>>>> 045705c4d45861a616606d76b4845c19c791672f
                },
                icon: const Icon(color: Colors.blue, Icons.exit_to_app))
          ],
        ),
        body: const SafeArea(
          child: Padding(
<<<<<<< HEAD
            padding: EdgeInsets.all(10.0),
=======
            padding: EdgeInsets.all(8.0),
>>>>>>> 045705c4d45861a616606d76b4845c19c791672f
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                ),
                Testimony(),
<<<<<<< HEAD
          
=======
>>>>>>> 045705c4d45861a616606d76b4845c19c791672f
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Up coming Events",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                ),
                Events()
              ],
            ),
          ),
        ));
  }
}
