import 'package:flutter/material.dart';

class TestimonyView extends StatefulWidget {
  Text title;
  Text body;
  String urln;
  TestimonyView(
      {Key? key, required this.title, required this.body, required this.urln})
      : super(key: key);

  @override
  State<TestimonyView> createState() => _TestimonyViewState();
}

class _TestimonyViewState extends State<TestimonyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child:SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height*0.30,
                color: Colors.grey,
                child: Image.network(
                     widget.urln ,
                     
                  fit: BoxFit.contain,
                ),
              ),
             const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget.title,
              ),
             const  SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: widget.body,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
