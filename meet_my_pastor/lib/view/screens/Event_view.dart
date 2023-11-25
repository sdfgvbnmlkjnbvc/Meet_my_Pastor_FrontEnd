import 'package:flutter/material.dart';

class EventView extends StatefulWidget {
  Text title;
  Text time;
  Text date;
  Text body;
  String urln;
  EventView(
      {Key? key,
      required this.title,
      required this.time,
      required this.date,
      required this.urln,
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
              SizedBox(
                width: double.infinity,
                height: 400,
                child: Image.network(
                  widget.urln,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                left: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget.title,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [widget.time, const Spacer(), widget.date],
            ),
          ),
          const SizedBox(
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
