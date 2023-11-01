
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meet_my_pastor/provider/Apointment.dart';

import 'package:meet_my_pastor/widgets/authentication.dart';
import 'package:provider/provider.dart';

import '../../pageNavigator.dart';
import '../../provider/auth/auth_provider.dart';
import '../../widgets/InputTextfield.dart';
import 'appointment.dart';
import 'home.dart';

const List<BoxShadow> kInputBoxShadow = [
  BoxShadow(
    color: Colors.grey,
    offset: const Offset(2.0, 2.0),
    blurRadius: 2.0,
    spreadRadius: 2.0,
  ),
  BoxShadow(
    color: Colors.white,
    offset: const Offset(0.0, 0.0),
    blurRadius: 0.0,
    spreadRadius: 0.0,
  ),
];

class contactUs extends StatefulWidget {
  contactUs({Key? key}) : super(key: key);

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
 void dispose(){
  _firstNameController.dispose();
  _emailController.dispose();
  _lastNameController.dispose();
_phoneController.dispose();
_messageController.dispose();
super.dispose();
 }

  @override
  Widget build(BuildContext context) {
    bool inactive = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            onPressed: () {
              pageNavigator(ctx: context).nextPageOnly(page: Appointment());
            },
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                pageNavigator(ctx: context).nextPageOnly(page: HomePage());
              },
              icon: Icon(color: Colors.blue, Icons.exit_to_app))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            FieldInput(
                expand:false ,
                controller: _firstNameController,
                width: 363,
                height: 50,
                labelText: "First Name"),
                 FieldInput(
                expand:false ,
                controller: _lastNameController,
                width: 363,
                height: 50,
                labelText: "Last Name"),
            FieldInput(
                expand:false ,
                controller: _phoneController,
                width: 363,
                height: 50,
                labelText: "Phone"),
                   FieldInput(
                expand:false ,
                controller: _emailController,
                width: 363,
                height: 50,
                labelText: "Email"),
            
            const SizedBox(
              height: 30,
            ),
            FieldInput(
                expand:true,
        
              controller: _messageController,
              height: 269,
              width: 363,
              labelText:
                  "Please lets us know in more details your reason for this apointment",
              labelTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: buildRegisterButton( 
                context, () {
                  print("First Name: ${_firstNameController.value.text} Last Name: ${_lastNameController.value.text}  phone: ${_phoneController.value.text} email: ${_emailController.value.text}" );
                  pageNavigator(ctx: context).nextPageOnly(page: HomePage());
                },
                              Color(0xFF3E64FF), "Register", 363, 60
                
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
