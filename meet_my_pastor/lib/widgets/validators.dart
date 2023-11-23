String? errorText(emailController){
  var statusIn =false;
  final email=emailController.value.text;
 
  if(email.isNotEmpty && !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)){
   
    statusIn=false;
    return " Enter a valid email address";


  }else if(email.isEmpty){
    return null;
  }
  else {
     statusIn=true;
    return null;
  }}
  String? errorPassword(passwordController){
   var  statusIn=false;
     final password=passwordController.value.text;
 if(!password.isEmpty && !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(password)){
  statusIn=false;
    return " Enter a stronger password. consider using upper Case,lower case numbers and Special Characters";

  }else if(password.isEmpty){
    statusIn=false;
    return null;
  }
  else if (password.length <8){
    statusIn=false;
    return "password should be longer than 8 Characters";
  }
  statusIn=true;
return null;
}
String? confirmPassword(confirmPasswordController,passwordController){
 final cpassword=confirmPasswordController.value.text;
 final password=passwordController.value.text;
 if(cpassword.isNotEmpty&&  password !=cpassword ){
    return "Password don't match";

  }else if(cpassword.isEmpty){
    return null;
  }
 return null;
}

String? validContact(contactController){
  final contact=contactController.value.text;
 
  if(contact.isNotEmpty && !RegExp(r"^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$").hasMatch(contact)){
    return " Enter a valid contact address";

  }else if(contact.isEmpty){
    return null;
  }
  else {
    return null;
  }}



String? validName(nameController){
  final name=nameController.value.text;
 
  if(name.isNotEmpty && !RegExp(r"(^[A-Za-z]{3,16})([ ]{0,1})([A-Za-z]{3,16})?([ ]{0,1})?([A-Za-z]{3,16})?([ ]{0,1})?([A-Za-z]{3,16})").hasMatch(name)){
    
    return " Enter a valid name ";

  }else if(name.isEmpty){
    return null;
  }
  else {
    return null;
  }}