import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoggedin = false;
  bool isLoading = false;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  login()async {
    isLoading = true;
  await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((v){
    isLoggedin = true;
    isLoading = false;
    update();
  })
;  }
}
