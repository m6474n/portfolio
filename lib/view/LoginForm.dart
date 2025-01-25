import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:portfolio/components/CustomInputField%20copy.dart';
import 'package:portfolio/components/CustomRoundedButton.dart';
import 'package:portfolio/components/socialIcon.dart';
import 'package:portfolio/controllers/auth_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // Show an error message
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AuthController(),
        builder: (cont) {
          return Form(
                      
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                      color: colorManager.primaryColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Enter your crendentials to continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                CustomInputField(
                  controller: cont.emailController,
                  label: "Email",
                ),
                CustomInputField(
                  controller: cont.passwordController,
                  label: "Password",
                  obsecure: true,
                ),

                // Error message if any
                if (cont.errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      cont.errorMessage,
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),

                // Login Button
                cont.isLoading
                    ? SpinKitWave(
                        color: colorManager.primaryColor) // Loading indicator
                    : CustomRoundedButton(
                        fontSize: 14,
                        label: "Login",
                        onTap: () async {
                          cont.login();
                        },
                      ),


                      SizedBox(height: 50,),
                    // LottieBuilder.asset('assets/unlock_animation.json')
              ],
            ),
          );
        });
  }
}
