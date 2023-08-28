import 'package:flutter/material.dart';


class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.25,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:2.0),
                  child: Text("Vision",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),Spacer()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("To raise an Army of Disciples of Jesus Christ who are life givers, fully consecrated to Jesus Christ, coming from different backgrounds and with different history, interconnected by the spirit of family, restored , trained, equipped, and sent , who have resolved to make known Jesus Christ as Lord and King in their lives, families and in all Nations in this generation",
            maxLines: 12,
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
              children: [
                Text("Mission",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),Spacer()
              ],
                      ),
            ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("1. Winning souls for Christ \n 2. Care for the souls \n 3. Training/Preparation/Equipping the souls for Christian life and Ministry \n 4. Sending/Mission/Commission \n 5. To establish /build The Kingdom of God on Earth",
            maxLines: 12,
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
          ),
          Row(children: [
            Spacer(),Padding(
              padding: const EdgeInsets.only(right:15.0),
              child: Image.asset(
                "images/logo1.png",width: 70,height: 70,
              ),
            )
          ],)
        ],
      ),
    )
    );
  }
}