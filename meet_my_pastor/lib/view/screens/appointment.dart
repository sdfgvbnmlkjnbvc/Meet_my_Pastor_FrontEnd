import 'dart:html';

import 'package:flutter/material.dart';
import 'package:meet_my_pastor/provider/auth/auth_provider.dart';
import 'package:meet_my_pastor/widgets/appointment_widgets.dart';
import 'package:provider/provider.dart';

class Appointment extends StatelessWidget {
  const Appointment({super.key});

  @override
  Widget build(BuildContext context) {
      Authentication pastors = context.watch<Authentication>();
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
            
            child:
             ListView.builder(
  itemCount:pastors.itemCount,
  itemBuilder: (context, index) {
    return StreamBuilder<Map>(
      stream: pastors.pastors(),
      initialData: {},
      builder: (context, snapshot) {
        // Access data for the current index
        final pastorData = pastors.respData['pastor'][index];

        return AppointmentCard(
          sourceLink: pastorData["Image"],
          name: pastorData["name"],
          title: pastorData["title"],
          contact: pastorData["Contact"],
        );
      },
    );
  },
)
// ListView.builder(
//   itemCount: (pastors.respData != null && pastors.respData.containsKey('pastor') && pastors.respData['pastor'] is List)
//       ? pastors.respData['pastor'].length
//       : 0,
//   itemBuilder: (context, index) {
//     if (pastors.respData != null &&
//         pastors.respData.containsKey('pastor') &&
//         pastors.respData['pastor'] is List) {
//       final pastorData = pastors.respData['pastor'][index];
//       return StreamBuilder<Map>(
//         stream: pastors.Pastors(),
//         initialData: {},
//         builder: (context, snapshot) {
//           return AppointmentCard(
//             sourceLink: pastorData["Image"],
//             name: pastorData["name"],
//             title: pastorData["title"],
//             contact: pastorData["Contact"],
//           );
//         },
//       );
//     } else {
//       // Handle the case when 'pastor' data is not available or not in the expected format
//       return SizedBox(); // Return an empty widget or a placeholder
//     }
//   },
// )


          )
        ],
      ),
    );
  }
}
