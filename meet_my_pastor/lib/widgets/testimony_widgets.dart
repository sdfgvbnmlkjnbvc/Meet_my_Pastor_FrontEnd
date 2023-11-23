import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../page_navigator.dart';
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
                    PageNavigator(ctx: context).nextPage(
                      page: Flexible(
                        child: TestimonyView(
                          title: Text(
                              getTestimony.Data[index]["title"].toString()),
                          urln: getTestimony.Data[index]["Image"].toString(),
                          body: Text(
                              getTestimony.Data[index]["message"].toString()),
                        ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    child: Container(
                      color: Colors.grey,
                      height: 150,
                      width: 200,
                      child: Image.network(
                        testimonyData[index]["Image"].toString(),
                       
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Flexible(
                  child: Text(
                    "${testimonyData[index]["name"]}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                ),
                const Flexible(
                  child: Text(
                    "Rockson",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
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
        child: const Center(
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
