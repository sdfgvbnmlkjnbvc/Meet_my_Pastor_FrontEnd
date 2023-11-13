import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  final String? sourceLink;
  final String? name;
  final String? title;
  final String? contact;
  final void Function()? click;

  const AppointmentCard(
      {Key? key,
      this.sourceLink,
      this.name,
      this.title,
      this.contact,
      this.click})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(5.0, 5.0),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ],
        borderRadius: BorderRadius.circular(6),
      ),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 154,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: SizedBox(
              width: 120,
              height: 150,
              child: Image.network(
                sourceLink ?? "",
                fit: BoxFit.contain,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name ?? ""),
              Text(title ?? ""),
              Row(
                children: [
                  const Icon(Icons.call),
                  Text(contact ?? ""),
                ],
              ),
              Material(
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: click,
                  //  () {
                  //  pageNavigator(ctx: context).nextPage(page: AppointmentDetail());

                  // },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF3E64FF),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    height: 22,
                    width: 150,
                    child: const Center(
                      child: Text(
                        "Book appointment",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
