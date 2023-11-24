import 'package:flutter/material.dart';
import 'package:meet_my_pastor/provider/pastor_provider.dart';
import 'package:meet_my_pastor/widgets/appointment_widgets.dart';
import 'package:provider/provider.dart';

import '../../page_navigator.dart';
import 'appointment_detail.dart';
import 'home.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  void dispose() {
    // Close the StreamController when the widget is disposed

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // late AnimationController controller;
    PastorProvider pastors = context.watch<PastorProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  pastors.dispose();
                  PageNavigator(ctx: context)
                      .nextPageOnly(page: const HomePage());
                },
                icon: const Icon(color: Colors.blue, Icons.exit_to_app))
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  margin: const EdgeInsetsDirectional.all(30),
                  child: TextField(  style: const TextStyle(  fontFamily: "Montserrat",
                      fontSize: 18, fontWeight: FontWeight.normal),
                    decoration: InputDecoration(
                        hintText: "Search for your favorite postor or apostle",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              const BorderSide(width: 3, color: Colors.blue),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.search))),
                  )),
            ),
            Expanded(
              child: pastors.itemCount == 0
                  ? const Text("No data",  style: TextStyle(  fontFamily: "Montserrat",
                      fontSize: 20, fontWeight: FontWeight.bold),)
                  : ListView.builder(
                      itemCount: pastors.itemCount,
                      itemBuilder: (context, index) {
                        return StreamBuilder<Map>(
                          stream: pastors.pastors(),
                          initialData: const {},
                          builder: (context, snapshot) {
                            if (snapshot.hasData == true &&
                                pastors.respData['status'] == 200) {
                              final pastorData =
                                  pastors.respData['pastor'][index];
                              return Flexible(
                                child: AppointmentCard(
                                  click: () {
                                    pastors.dispose();
                                    PageNavigator(ctx: context).nextPage(
                                        page: AppointmentDetail(
                                            pastorId: pastorData["user_id"],
                                            title: pastorData["title"]));
                                  },
                                  sourceLink: pastorData["Image"],
                                  name: pastorData["name"],
                                  title: pastorData["title"],
                                  contact: pastorData["Contact"],
                                ),
                              );
                            } else {
                              return const Text("");
                            }
                          },
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
