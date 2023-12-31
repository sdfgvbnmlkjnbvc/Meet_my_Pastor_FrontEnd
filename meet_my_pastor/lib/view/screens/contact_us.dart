import 'package:flutter/material.dart';
import 'package:meet_my_pastor/provider/contact_provider.dart';

import 'package:meet_my_pastor/widgets/authentication.dart';
import 'package:provider/provider.dart';

import '../../page_navigator.dart';
import '../../widgets/input_text_field.dart';
import 'appointment.dart';
import 'home.dart';

const List<BoxShadow> kInputBoxShadow = [
  BoxShadow(
    color: Colors.grey,
    offset: Offset(2.0, 2.0),
    blurRadius: 2.0,
    spreadRadius: 2.0,
  ),
  BoxShadow(
    color: Colors.white,
    offset: Offset(0.0, 0.0),
    blurRadius: 0.0,
    spreadRadius: 0.0,
  ),
];

class contactUs extends StatefulWidget {
  const contactUs({Key? key}) : super(key: key);

  @override
  _contactUsState createState() => _contactUsState();
}

class _contactUsState extends State<contactUs> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _emailController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contactData = Provider.of<ContactProvider>(context);
    // bool inactive = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            icon: const Icon(
              Icons.home,
              color: Colors.blue,
            ),
            onPressed: () {
              PageNavigator(ctx: context)
                  .nextPageOnly(page: const Appointment());
            },
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                PageNavigator(ctx: context)
                    .nextPageOnly(page: const HomePage());
              },
              icon: const Icon(color: Colors.blue, Icons.exit_to_app))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            FieldInput(
                expand: false,
                controller: _firstNameController,
                width: 363,
                height: 50,
                labelText: "First Name"),
            FieldInput(
                expand: false,
                controller: _lastNameController,
                width: 363,
                height: 50,
                labelText: "Last Name"),
            FieldInput(
                expand: false,
                controller: _phoneController,
                width: 363,
                height: 50,
                labelText: "Phone"),
            FieldInput(
                expand: false,
                controller: _emailController,
                width: 363,
                height: 50,
                labelText: "Email"),
            const SizedBox(
              height: 30,
            ),
            FieldInput(
              expand: true,
              controller: _messageController,
              height: 269,
              width: 363,
              labelText:
                  "Please lets us know in more details your reason for this apointment",
              labelTextStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: buildRegisterButton(context, () {
                contactData.contact(
                    context: context,
                    phone: _phoneController.value.text,
                    firstName: _firstNameController.value.text,
                    lastName: _lastNameController.value.text,
                    email: _emailController.value.text,
                    message: _messageController.value.text);
                PageNavigator(ctx: context)
                    .nextPageOnly(page: const HomePage());
              }, const Color(0xFF3E64FF), "Send", 250, 60),
            ),
          ],
        ),
      ),
    );
  }
}
