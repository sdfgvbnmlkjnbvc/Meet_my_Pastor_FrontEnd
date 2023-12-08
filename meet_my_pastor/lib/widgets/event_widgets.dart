import 'package:flutter/material.dart';
import 'package:meet_my_pastor/page_navigator.dart';
import 'package:meet_my_pastor/provider/event_provider.dart';
import 'package:meet_my_pastor/view/screens/Event_view.dart';
import 'package:provider/provider.dart';

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  initState() {
    super.initState();
    final getEvent = Provider.of<EventProvider>(context, listen: false);
    getEvent.events();
  }

  @override
  Widget build(BuildContext context) {
    final getEvent = Provider.of<EventProvider>(context);

    // return  Text("${getEvent.Data}");
    if (getEvent.isLoading == false) {
      // print(getEvent.itemCount);
      return Expanded(
        flex: 2,
        child: ListView.builder(
          itemCount: getEvent.itemCount,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  PageNavigator(ctx: context).nextPage(
                    page: EventView(
                      title: Text(getEvent.Data[index]["name"].toString(), style: const TextStyle(  fontFamily: "Montserrat",
                            fontSize: 24, fontWeight: FontWeight.bold,
                            color: Colors.white),
                      
                      ),
                      time: Text(getEvent.Data[index]["time"].toString() , style: const TextStyle(  fontFamily: "Montserrat",
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                      date: Text(getEvent.Data[index]["date"].toString(), style: const TextStyle(  fontFamily: "Montserrat",
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                      urln: getEvent.Data[index]["Image"].toString(),
                      body: Text(
                          getEvent.Data[index]["eventDescription"].toString(),
                          style:const TextStyle(  fontFamily: "Montserrat",
                            fontSize: 18, fontWeight: FontWeight.normal),
                          ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 340,
                        width: 395,
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.network(
                                getEvent.Data[index]["Image"],
                                height: 340,
                                width: 395,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "A Night of Praise and Adoration",
                      style:
                          TextStyle(  fontFamily: "Montserrat",
                            fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Date: ${getEvent.Data[index]["date"]}",
                        style: const TextStyle(  fontFamily: "Montserrat",
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    } else {
      return Container(
        height: 150,
        width: 200,
        color: Colors.blueGrey,
        child: const Center(
          child: Text(
            "No events available",
            style: TextStyle(
            fontFamily: "Montserrat",
                            
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      );
    }
  }
}
