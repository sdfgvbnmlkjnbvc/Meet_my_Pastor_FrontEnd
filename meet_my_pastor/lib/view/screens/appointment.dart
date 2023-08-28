import 'package:flutter/material.dart';
import 'package:meet_my_pastor/widgets/appointment_widgets.dart';

class Appointment extends StatelessWidget {
  const Appointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                margin: EdgeInsetsDirectional.all(30),
                child: TextField(
                  decoration: InputDecoration(hintText: "Search for your favority postor or apostle",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(width: 3, color: Colors.blue),
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: Icon(Icons.search))),
                )),
          ),
          Flexible(
            child: ListView.builder(itemCount: 10,itemBuilder: (context,int){
              return appointment_card();
            }),
          )
        ],
      ),
    );
  }
}
