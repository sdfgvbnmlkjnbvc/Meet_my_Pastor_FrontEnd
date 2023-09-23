import 'package:flutter/material.dart';

class EventView extends StatefulWidget {
  Text title;
  Text time;
  Text Date;
  Text body;
  EventView(
      {Key? key,
      required this.title,
      required this.time,
      required this.Date,
      required this.body})
      : super(key: key);

  @override
  State<EventView> createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 400,
                child: Image.asset(
                  "images/Event.png",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget.title,
                ),
                bottom: 20,
                left: 10,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [widget.time, Spacer(), widget.Date],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: widget.body,
          ),
        ],
      ),
    );
  }
}
