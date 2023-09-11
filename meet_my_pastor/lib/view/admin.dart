import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:meet_my_pastor/widgets/InputTextfield.dart';
import '../widgets/meettoast.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final cloudinary = CloudinaryPublic('dam1p1eyw', 'UPLOAD_PRESET', cache: false);
  File? _imageFile;
  String? _imageUrl;
   final TextEditingController dateInput = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _timeController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  bool isDateSelected = false;


  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) _imageFile = File(pickedFile.path);
      print(pickedFile);
    });
  }

  Future<void> _uploadImage() async {
    if (_imageFile == null) {
      // Handle case when no image is selected
      ShowToast.vitaToast(message: "No image selected", warn: true, long: true);
      return;
    }

    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(_imageFile?.path ?? " ", resourceType: CloudinaryResourceType.Image),
      );
      
      setState(() {
        _imageUrl = response.secureUrl;
      });

      // Image uploaded successfully
      ShowToast.vitaToast(message: "Image added successfully", warn: false, long: true);
    } on CloudinaryException catch (e) {
      // Handle Cloudinary exceptions
      print(e.message);
      print(e.request);
      ShowToast.vitaToast(message: "Error uploading image: ${e.message}", warn: true, long: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 159,
              height: 187,
              color: Color(0xffD9D9D9),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    width: 120,
                    height: 120,
                  ),
                  Image.asset(
                    "images/camera.png",
                    width: 96,
                    height: 98,
                  ),
                  Positioned(
                    bottom: 30,
                    right: 30,
                    child: Material(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        height: 30,
                        width: 30,
                        child: InkWell(
                          onTap: () {
                            _pickImage(ImageSource.gallery);
                          },
                          child: Icon(
                            Icons.add_circle_outline,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 187,
              width: 192,
              color: Color(0xffD9D9D9),
              child: Column(
                children: [
                  // Add widgets as needed
                ],
              ),
            )
          ],
        ),
        // SizedBox(
        //   height: 20,
        // ),
        // Material(
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: Colors.amberAccent,
        //       borderRadius: BorderRadius.circular(100),
        //     ),
        //     height: 30,
        //     width: 100,
        //     child: InkWell(
        //       onTap: _uploadImage,
        //       child: Center(child: Text("Upload")),
        //     ),
        //   ),
        // ),

        // EmailInput(controller:_emailController,width: 363,height: 50,labelText: "Email"),
        //     Container(
        //        margin:const EdgeInsets.only(top: 10,left: 40, right: 40,bottom: 10),
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(6),
        //         color: Colors.white,
        //         // boxShadow: kInputBoxShadow,
        //       ),
        //       // padding:const EdgeInsets.all(15),
        //       width: 363,
        //       height: 40,
        //       child: Center(
        //         child:Text("Hello") 
            
        //       )   
        //       ),
            
                   
                  
               
              
          //  EmailInput(controller:_timeController,width: 363,height: 50,labelText: "Time"),
          // const  SizedBox(height: 30,),
          //  EmailInput(controller:_messageController ,height: 269,width: 363,labelText: "Please lets us know in more details your reason for this apointment",labelTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
          
          // SizedBox(height: 30,),
          // Padding(
          //   padding: const EdgeInsets.all(30.0),
          //   child: 
          //   // buildRegisterButton(context, () => null,Color(0xFF3E64FF), "Book now"),

          // ),
          //  Material(
          //       child: Consumer<Authentication>(
          //         builder: (context, auth, child) {
  


  //                   return buildRegisterButton(context,(){
  // // if (_nameController.value.text.isEmpty || _emailController.value.text.isEmpty ||  dateInput.value.text.isEmpty || _messageController.value.text.isEmpty){
  // //   setState(() {
  // //     inactive=true;
  // //   });}else if (inactive == false){
  // //                 final auth = Provider.of<Authentication>(context, listen: false);
  // //       auth.bookAppointment(
  // //         context: context,
  // //         userId: "5f8e7fc5-1508-4bca-8706-041193680363",
  // //         pastor:"Apostle" ,
  // //         time:  _timeController.text,
  // //         date: dateInput.value.text,
  // //         email: _emailController.value.text,
  // //         reason: _messageController.value.text,
  // //         name: _nameController.text,
  // //       );

  //   }
       
  //                   },
  //                   // inactive? Color(0xFF3E64FF): Colors.red[300],"Book now");
                  
  //                 },
  //               ),
              // )/,
      ],
    );
  }
}
