import 'package:flutter/material.dart';
import 'package:meet_my_pastor/pageNavigator.dart';

import '../view/screens/Event_view.dart';
import '../view/screens/Testimony_view.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Material(
                    child: InkWell(
                      onTap: () {
                        pageNavigator(ctx: context).nextPage(
                          page: EventView(
                            Date: Text("Date: 23-08-1965",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            time: Text(
                              "time: 12:30 pm",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            title: Text(
                              "A  Night  of Praise and Adoration",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            body: Text(
                              "While on their spiritual journey with Jesus, many people find the most compelling stories about Jesus come from the Christians they already know. If you’re looking for proof of Jesus’ ability, ask your peers about their own journey with Christ. Your own story can be just as compelling and is the most powerful tool you have to demonstrate the love of Jesus and show how He has changed you to other people. While on their spiritual journey with Jesus, many people find the most compelling stories about Jesus come from the Christians they already know. If you’re looking for proof of Jesus’ ability, ask your peers about their own journey with Christ. Your own story can be just as compelling and is the most powerful tool you have to demonstrate the love of Jesus and show how He has changed you to other people.",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 340,
                        width: 395,
                        child: Image.asset(
                          "images/Event.png",
                          height: 340,
                          width: 395,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
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
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Date:31 May,2023",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
