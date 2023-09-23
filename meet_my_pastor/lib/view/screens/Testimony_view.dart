import 'package:flutter/material.dart';

class TestimonyView extends StatefulWidget {
  Text title;
  Text body;
  TestimonyView({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  State<TestimonyView> createState() => _TestimonyViewState();
}

class _TestimonyViewState extends State<TestimonyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 220,
            color: Colors.amber,
            child: Image.asset(
              "images/Image.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget.title,
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
