import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/general_controller.dart';
import 'package:portfolio/models/contact.dart';

class ContactController extends GetxController{
  var contactDB = FirebaseFirestore.instance.collection("contact");
  // FirebaseFirestore
var generalCont = Get.find<GeneralController>();
  String email = "m.mohsin2055@gmail.com";
  final GlobalKey<FormState> formKey= GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var subjectController = TextEditingController();
  var messageController = TextEditingController();

  // Contact Model

clearScreen(){
  nameController.clear();
  emailController.clear();
  phoneController.clear();
  subjectController.clear();
  messageController.clear();
  update();
}

  sendMessage()async{
    Contact contact = Contact(clientName: nameController.text, clientEmail: emailController.text, clientPhone: phoneController.text, subject: subjectController.text, message: messageController.text);
await contactDB.add(contact.toMap()).then((v){
  // Easyload
  print("Submitted Successfully!");
});
    
    print(contact.toMap());
    clearScreen()
;  
  }
}
