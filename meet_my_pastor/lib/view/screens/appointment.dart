import 'package:flutter/material.dart';
import 'package:meet_my_pastor/provider/auth/auth_provider.dart';
import 'package:meet_my_pastor/provider/pastor_provider.dart';
import 'package:meet_my_pastor/widgets/appointment_widgets.dart';
import 'package:provider/provider.dart';

import '../../pageNavigator.dart';
import 'home.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    late AnimationController controller;
    PastorProvider pastors = context.watch<PastorProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  pageNavigator(ctx: context).nextPageOnly(page: HomePage());
                },
                icon: Icon(color: Colors.blue, Icons.exit_to_app))
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  margin: EdgeInsetsDirectional.all(30),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search for your favority postor or apostle",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(width: 3, color: Colors.blue),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {}, icon: Icon(Icons.search))),
                  )),
            ),
            Expanded(
              child: pastors.itemCount == 0
                  ? Text("No data")
                  : ListView.builder(
                      itemCount: pastors.itemCount,
                      itemBuilder: (context, index) {
                        print("${pastors.itemCount}");
                        return StreamBuilder<Map>(
                          stream: pastors.pastors(),
                          initialData: {},
                          builder: (context, snapshot) {
                            if (snapshot.hasData == true &&
                                pastors.respData['status'] == 200) {
                              final pastorData =
                                  pastors.respData['pastor'][index];
                              return Flexible(
                                child: AppointmentCard(
                                  sourceLink: pastorData["Image"],
                                  name: pastorData["name"],
                                  title: pastorData["title"],
                                  contact: pastorData["Contact"],
                                ),
                              );
                            } else {
                              return Text("loading");
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
