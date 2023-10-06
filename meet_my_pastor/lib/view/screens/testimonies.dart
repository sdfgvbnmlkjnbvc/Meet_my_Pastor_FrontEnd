import 'package:flutter/material.dart';
import 'package:meet_my_pastor/provider/testimony_provider.dart';
import 'package:meet_my_pastor/widgets/event_widgets.dart';
import 'package:meet_my_pastor/widgets/testimony_widgets.dart';
import 'package:provider/provider.dart';

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
              icon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              onPressed: () {
                pageNavigator(ctx: context).nextPageOnly(page: Appointment());
              },
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  pageNavigator(ctx: context).nextPageOnly(page: HomePage());
                },
                icon: Icon(color: Colors.blue, Icons.exit_to_app))
          ],
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Testimonies",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
              ),
              Testimony(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Up coming Events",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
              ),
              Events()
            ],
          ),
        ));
  }
}
