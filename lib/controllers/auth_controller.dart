import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool obscure = true;

  showPass() {
    obscure = !obscure;
    update();
  }
  String errorMessage = "";
  clearForm() {
    emailController.clear();
    passwordController.clear();

    isLoading = false;
    update();
  }

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      errorMessage = "Please fill in both fields.";

      return;
    }

    try {
      isLoading = true; // Start loading
      errorMessage = ''; // Clear error message
update();
      // Attempt login with Firebase Auth
      await auth
          .signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((v) {
        print("User Details : ${v.user?.email}");
      });

      // After successful login, clear fields and navigate
clearForm();

      // Navigate to home screen or dashboard (or reset state)
      // Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific errors

      isLoading = false;
      errorMessage = e.message ?? 'An error occurred, please try again.';
      update();
    } catch (e) {
      // General catch if something unexpected happens

      isLoading = false;
      errorMessage = 'An error occurred, please try again.';
      update();
    }

    update();

    ;
  }
  checkSession()async{
  auth.currentUser!=null? isLoading = true : isLoading = false;
  update();
  }
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
   
;  }
}
