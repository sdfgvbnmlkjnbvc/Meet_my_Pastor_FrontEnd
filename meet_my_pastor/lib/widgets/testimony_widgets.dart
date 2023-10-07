import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pageNavigator.dart';
import '../provider/testimony_provider.dart';
import '../view/screens/Testimony_view.dart';

class Testimony extends StatefulWidget {
  const Testimony({super.key});

  @override
  State<Testimony> createState() => _TestimonyState();
}

class _TestimonyState extends State<Testimony> {
  @override
  void initState() {
    super.initState();
    final getTestimony = Provider.of<TestimonyProvider>(context, listen: false);
    getTestimony.testimonies();
  }

  @override
  Widget build(BuildContext context) {
    final getTestimony = Provider.of<TestimonyProvider>(context);
    if (getTestimony.isLoading == false) {
      return Expanded(
          child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: getTestimony.itemCount,
        itemBuilder: (context, index) {
          final testimonyData = getTestimony.Data;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    pageNavigator(ctx: context).nextPage(
                      page: TestimonyView(
                        title:
                            Text(getTestimony.Data[index]["title"].toString()),
                        // time: Text(getTestimony.Data[index]["time"].toString()),
                        // Date: Text(getTestimony.Data[index]["date"].toString()),
                        urln: getTestimony.Data[index]["Image"].toString(),
                        body: Text(
                            getTestimony.Data[index]["message"].toString()),
                      ),
                    );
                  },
                  child: ClipRRect(
                    child: Container(
                      color: Colors.amber,
                      height: 150,
                      width: 200,
                      child: Image.network(
                        testimonyData[index]["Image"],
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "${testimonyData[index]["name"]}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
                Text(
                  "Rockson",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          );
        },
      ));
    } else {
      return Container(
        height: 150,
        width: 200,
        color: Colors.blueGrey,
        child: Center(
          child: Text(
            "No testimonies available",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      );
    }
  }
}
