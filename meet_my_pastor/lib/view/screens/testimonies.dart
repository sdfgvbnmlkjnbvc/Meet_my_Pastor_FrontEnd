import 'package:flutter/material.dart';
import 'package:meet_my_pastor/widgets/event_widgets.dart';
import 'package:meet_my_pastor/widgets/testimony_widgets.dart';

import '../../pageNavigator.dart';
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
                pageNavigator(ctx: context).nextPageOnly(page: const Appointment());
              },
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  pageNavigator(ctx: context).nextPageOnly(page: const HomePage());
                },
                icon: const Icon(color: Colors.blue, Icons.exit_to_app))
          ],
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
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
