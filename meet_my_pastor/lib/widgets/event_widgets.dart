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
<<<<<<< HEAD
  void initState() {
=======
  initState() {
>>>>>>> 045705c4d45861a616606d76b4845c19c791672f
    super.initState();
    final getEvent = Provider.of<EventProvider>(context, listen: false);
    getEvent.events();
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
   
  final getEvent = Provider.of<EventProvider>(context);
    
          // return  Text("${getEvent.Data}");
        if (getEvent.isLoading ==false) {
        print(getEvent.itemCount);
          return Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: getEvent.itemCount,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      pageNavigator(ctx: context).nextPage(
                        page: EventView(
                          title: Text(getEvent.Data[index]["name"].toString()),
                          time: Text(getEvent.Data[index]["time"].toString()),
                          Date: Text(getEvent.Data[index]["date"].toString()),
                          urln: getEvent.Data[index]["Image"].toString(),
                          body: Text(getEvent.Data[index]["eventDescription"].toString()),
                        ),
                      );
                    },
                    child: 
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 340,
                            width: 395,
                            child:Column(
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
                            ) 
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "A Night of Praise and Adoration",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              "Date: ${getEvent.Data[index]["date"]}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w800),
                            ),
                          ),
                        ],
                      ),
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
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          );
        }
      }
    
  }
=======
    final getEvent = Provider.of<EventProvider>(context);
>>>>>>> 045705c4d45861a616606d76b4845c19c791672f

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
                      title: Text(getEvent.Data[index]["name"].toString()),
                      time: Text(getEvent.Data[index]["time"].toString()),
                      date: Text(getEvent.Data[index]["date"].toString()),
                      urln: getEvent.Data[index]["Image"].toString(),
                      body: Text(
                          getEvent.Data[index]["eventDescription"].toString()),
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
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Date: ${getEvent.Data[index]["date"]}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
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
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      );
    }
  }
}
