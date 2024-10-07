import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ContactController extends GetxController{

  String email = "m.mohsin2055@gmail.com";
  final GlobalKey<FormState> formKey= GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

}