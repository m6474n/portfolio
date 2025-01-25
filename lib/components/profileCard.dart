import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:portfolio/components/CustomInputField%20copy.dart';
import 'package:portfolio/components/CustomRoundedButton.dart';
import 'package:portfolio/components/customInputfield.dart';
import 'package:portfolio/components/mask.dart';
import 'package:portfolio/components/socialIcon.dart';
import 'package:portfolio/components/transparentButton.dart';
import 'package:portfolio/controllers/auth_controller.dart';
import 'package:portfolio/controllers/general_controller.dart';
import 'package:portfolio/controllers/theme_controller.dart';
import 'package:portfolio/utility/appsettings.dart';
import 'package:portfolio/view/LoginForm.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {

  var email =TextEditingController();
  var pass=TextEditingController();
var auth = Get.put(AuthController()
);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder(
        init: ColorManager(),
        builder: (cont) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(52),
                child: Stack(
                  children: [
                    Container(
                      width: width < AppSettings.mobileWidth ? width : 400,
                      // height: width < AppSettings.mobileWidth ? 350 : height * 0.8,
                      constraints: BoxConstraints(minWidth: 400),
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(52),
                          border:
                              Border.all(width: 1, color: colorManager.borderColor)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text("Mosen",
                                        style: TextStyle(
                                            color: colorManager.textColor,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 38))),
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Flutter Developer / \nFull Stack Developer",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: colorManager.textColor,
                                          letterSpacing: 2),
                                      textAlign: TextAlign.end,
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Container(
                              height: 250,
                              width: 300,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: colorManager.borderColor,
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/profile-pic.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(42)),
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Text(
                              "Muhammad Mohsin",
                              style: TextStyle(
                                  fontSize: 32, color: colorManager.textColor),
                            ),
                            SizedBox(height: 12),
                            Text(
                              "G.T Road, Gujrat Pakistan",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w300,
                                  color: colorManager.borderColor),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "m.mohsin2055@gmail.com",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: colorManager.textColor,
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.w300),
                            ),
                            SizedBox(height: 18),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SocialIcon(
                                  icon: FontAwesomeIcons.github,
                                  link: "https://github.com/m6474n",
                                ),
                                SocialIcon(
                                  icon: FontAwesomeIcons.instagram,
                                  link: "https://www.instagram.com/mosen_here/",
                                ),
                                SocialIcon(
                                  icon: FontAwesomeIcons.x,
                                  link: "https://x.com/mosen_here",
                                ),
                                SocialIcon(
                                  icon: FontAwesomeIcons.linkedin,
                                  link:
                                      "https://www.linkedin.com/in/muhammad--mohsin/",
                                ),
                              ],
                            ),
                            SizedBox(height: 18),
                            // Container(height: 30,child: HoverButtonDemo())
                            CustomRoundedButton(
                              label: "Hire Me",
                              onTap: () async {
                                String url =
                                    "https://www.fiverr.com/mosen_dev55";
                                if (await canLaunchUrl(Uri.parse(url))) {
                                  launchUrl(Uri.parse(url));
                                }
                              },
                              icon: HugeIcons.strokeRoundedFilterMailSquare,
                              isRounded: true,
                            ),
                            SizedBox(height: 32),
                            Text(
                              "©2024, All Right Reserved.",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: colorManager.borderColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(52),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 700),
                            height: colorManager.showSettings ? height : 0,
                            width: 350,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(52),
                                color: Colors.black54,
                                border: Border.all(
                                    width: 1, color: colorManager.borderColor)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32.0, vertical: 32),
                              child: AnimatedOpacity(
                                opacity: colorManager.showSettings ? 1 : 0,
                                duration: Duration(
                                    milliseconds:
                                        colorManager.showSettings ? 1200 : 200),
                                      //  child: LoginForm(),
//                                 child: Form(
//                                   key: auth.loginFormKey,
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       Text(
//                                         "Welcome Back!",
//                                         style: TextStyle(
//                                             color: colorManager.primaryColor,
//                                             fontSize: 32,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       Text(
//                                         "Enter your crendentials to continue",
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 16,
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 18,
//                                       ),
//                                       EmailField(
//                                           controller:email,
//                                           label: "Enter Email",
//                                           visibility: colorManager.showSettings),
//                                       PasswordField(
//                                           controller: pass,
//                                           label: "Enter Password",
//                                           visibility: colorManager.showSettings),
//                                       Container(
//                                           height: 50,
//                                           margin: EdgeInsets.only(top: 12),
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 12),
//                                           child: TransparentButton(
//                                               isLoading: auth.isLoading,
//                                               label: "Login",
//                                               onTap: ()async {
//                                                 setState(() {
//                                                   auth.isLoading = true;
//                                                 });

//                                                 if (auth
//                                                     .loginFormKey.currentState!
//                                                     .validate()) {
//                                            try{
//                                              await       FirebaseAuth.instance
//                                                       .signInWithEmailAndPassword(
//                                                           email: email.text,
//                                                           password: 
//                                                               pass
//                                                               .text)
//                                                       .then((v) {
//                                                    print("Login Successfully! ${v.user!.email}")
// ;                                                  });
//                                            }catch(E){
// print("Error:$E");
//                                            }
//                                                   // auth.login();
//                                                   print("Validate");
//                                                    setState(() {
//                                                       auth.isLoading = false;
//                                                     });
//                                                 }
//                                               })),
//                                     ],
//                                   ),
//                                 ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: colorManager.bgColor),
                child: MouseRegion(
                  onEnter: (_) => colorManager.onSettingHover(true),
                  onExit: (_) => colorManager.onSettingHover(false),
                  child: GestureDetector(
                    onTap: () {
                      // Get.to(page)
                      colorManager.handleSetting();
                    },
                    child: AnimatedRotation(
                      duration: Duration(milliseconds: 1200),
                      turns: colorManager.isSettingHover
                          ? 0.5
                          : 0.0, // Rotate 180 degrees on hover

                      child: Icon(
                        FontAwesomeIcons.gear,
                        color: colorManager.primaryColor,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}

class ReusableRow extends StatelessWidget {
  final String title;
  final Widget child;
  const ReusableRow({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              '$title',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(child: child)
        ],
      ),
    );
  }
}

class ProfileForMobile extends StatelessWidget {
  const ProfileForMobile({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder(
        init: AuthController(),
        builder: (cont) {
          return Stack(
            children: [
              Container(
                width: width < AppSettings.mobileWidth ? width : 350,
                // height: height * 0.4,
                constraints: BoxConstraints(minWidth: 400),
                padding: EdgeInsets.all(42),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(52),
                    border: Border.all(width: 1, color: colorManager.borderColor)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // SizedBox()
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text("Mosen",
                                  style: TextStyle(
                                      color: colorManager.textColor,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 38))),
                          Expanded(
                              flex: 1,
                              child: Text(
                                "Flutter Developer / \nFull Stack Developer",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: colorManager.textColor,
                                    letterSpacing: 2),
                                textAlign: TextAlign.end,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 250,
                            width: 300,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: colorManager.borderColor,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/profile-pic.png'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(42)),
                          ),
                          SizedBox(
                            width: 32,
                          ),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Muhammad Mohsin",
                                style: TextStyle(
                                    fontSize: 32, color: colorManager.textColor),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "G.T Road, Gujrat Pakistan",
                                style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.w300,
                                    color: colorManager.borderColor),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "m.mohsin2055@gmail.com",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: colorManager.textColor,
                                    letterSpacing: 3,
                                    fontWeight: FontWeight.w300),
                              ),

                              SizedBox(height: 18),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SocialIcon(
                                    icon: FontAwesomeIcons.github,
                                    link: "https://github.com/m6474n",
                                  ),
                                  SocialIcon(
                                    icon: FontAwesomeIcons.instagram,
                                    link:
                                        "https://www.instagram.com/mosen_here/",
                                  ),
                                  SocialIcon(
                                    icon: FontAwesomeIcons.x,
                                    link: "https://x.com/mosen_here",
                                  ),
                                  SocialIcon(
                                    icon: FontAwesomeIcons.linkedin,
                                    link:
                                        "https://www.linkedin.com/in/muhammad--mohsin/",
                                  ),
                                ],
                              ),
                              SizedBox(height: 18),
                              // Container(height: 30,child: HoverButtonDemo())
                              CustomRoundedButton(
                                label: "Hire Me",
                                onTap: () async {
                                  String url =
                                      "https://www.fiverr.com/mosen_dev55";
                                  if (await canLaunchUrl(Uri.parse(url))) {
                                    launchUrl(Uri.parse(url));
                                  }
                                },
                                icon: HugeIcons.strokeRoundedFilterMailSquare,
                                isRounded: true,
                              ),
                            ],
                          )),
                        ],
                      ),

                      SizedBox(height: 32),
                      Text(
                        "©2024, All Right Reserved.",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: colorManager.borderColor),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(52),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 700),
                      height: colorManager.showSettings ? height * 0.8 : 0,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(52),
                          color: Colors.black54,
                          border:
                              Border.all(width: 1, color: colorManager.borderColor)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Column(
                          children: [
                            // SizedBox(
                            //   height: 42,
                            // ),
                            // Text(
                            //   "Settings",
                            //   style: TextStyle(
                            //       color: Colors.white,
                            //       fontWeight: FontWeight.w200,
                            //       fontSize: 32),
                            // ), SizedBox(height: 32,),
                            // ReusableRow(title: "Color", child: Row(children: List.generate(colorManager.colors.length, (index){
                            //   return Padding(
                            //     padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            //     child: GestureDetector(
                            //       onTap: (){
                            //         // colorManager.changeColor(colorManager.colors[index]);
                            //       },
                            //       child: Container(height: 30,width: 30 ,decoration: BoxDecoration(color:colorManager.colors[index],borderRadius: BorderRadius.circular(50)))),
                            //   );
                            // }),)
                            // )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: colorManager.bgColor),
                child: MouseRegion(
                  onEnter: (_) => colorManager.onSettingHover(true),
                  onExit: (_) => colorManager.onSettingHover(false),
                  child: GestureDetector(
                    onTap: () {
                      colorManager.handleSetting();
                    },
                    child: AnimatedRotation(
                      duration: Duration(milliseconds: 1200),
                      turns: colorManager.isSettingHover
                          ? 0.5
                          : 0.0, // Rotate 180 degrees on hover

                      child: Icon(
                        FontAwesomeIcons.gear,
                        color: colorManager.primaryColor,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}

