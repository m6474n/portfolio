import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/general_controller.dart';
import 'package:portfolio/models/contact.dart';

class ContactController extends GetxController{
  // var contact = FirebaseFirestore.instance.collection("contact");
  // FirebaseFirestore
final generalCont = Get.find<GeneralController>();
  String email = "m.mohsin2055@gmail.com";
  final GlobalKey<FormState> formKey= GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  // Contact Model



  sendMessage()async{
    Contact contact = Contact(clientName: nameController.text, clientEmail: emailController.text, clientPhone: phoneController.text, subject: subjectController.text, message: messageController.text);

    print(contact.toMap());
  
  }
}
