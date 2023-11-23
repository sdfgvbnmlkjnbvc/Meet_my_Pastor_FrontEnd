import 'package:flutter/material.dart';
import 'package:meet_my_pastor/provider/pastor_provider.dart';
import 'package:meet_my_pastor/widgets/appointment_widgets.dart';
import 'package:provider/provider.dart';

import '../../pageNavigator.dart';
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
                  pageNavigator(ctx: context).nextPageOnly(page: const HomePage());
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
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search for your favorite postor or apostle",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(width: 3, color: Colors.blue),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.search))),
                  )),
            ),
            Expanded(
              child: pastors.itemCount == 0
                  ? const Text("No data")
                  : ListView.builder(
                      itemCount: pastors.itemCount,
                      itemBuilder: (context, index) {
                        print("${pastors.itemCount}");
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
                                  click: (){
                                    pastors.dispose();
                                     pageNavigator(ctx: context).nextPage(page: AppointmentDetail(pastor_id:pastorData["user_id"],title:pastorData["title"]));
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