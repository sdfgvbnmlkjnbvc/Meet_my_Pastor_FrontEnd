
import 'package:flutter/material.dart';


import 'package:meet_my_pastor/provider/event_provider.dart';
import 'package:provider/provider.dart';



class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  void initState(){
    super.initState();
      final getEvent = Provider.of<EventProvider>(context,listen: false);
      getEvent.events();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(flex: 2,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 340,
                    width: 395,
                    child: Image.asset(
                      "images/Event.png",
                      height: 340,
                      width: 395,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "A Night of Praise and Adoration",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:8.0),
                    child: Text(
                      "Date:31 May,2023",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}