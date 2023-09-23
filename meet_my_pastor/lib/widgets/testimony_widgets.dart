import 'package:flutter/material.dart';

import '../pageNavigator.dart';
import '../view/screens/Testimony_view.dart';

class Testimony extends StatelessWidget {
  const Testimony({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                child: InkWell(
                  onTap: () {
                    pageNavigator(ctx: context).nextPage(
                      page: TestimonyView(
                        title: Text(
                          "Testimony of a faith tested through depression and ultimately redeemed:",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24,
                              color: Color(
                                0xff008098,
                              )),
                        ),
                        body: Text(
                          "While on their spiritual journey with Jesus, many people find the most compelling stories about Jesus come from the Christians they already know. If you’re looking for proof of Jesus’ ability, ask your peers about their own journey with Christ. Your own story can be just as compelling and is the most powerful tool you have to demonstrate the love of Jesus and show how He has changed you to other people. While on their spiritual journey with Jesus, many people find the most compelling stories about Jesus come from the Christians they already know. If you’re looking for proof of Jesus’ ability, ask your peers about their own journey with Christ. Your own story can be just as compelling and is the most powerful tool you have to demonstrate the love of Jesus and show how He has changed you to other people.",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        child: Container(
                          color: Colors.amber,
                          height: 150,
                          width: 200,
                          child: Image.asset(
                            "images/Image.png",
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Michael",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "Rockson",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
