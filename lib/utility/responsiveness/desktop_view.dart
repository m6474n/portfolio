import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/circularTextButton.dart';
import 'package:portfolio/components/floatingNavBar.dart';
import 'package:portfolio/components/outlineButton.dart';
import 'package:portfolio/components/profileCard.dart';
import 'package:portfolio/components/socialIcon.dart';
import 'package:portfolio/controllers/auth_controller.dart';
import 'package:portfolio/controllers/general_controller.dart';
import 'package:portfolio/view/home.dart';
import 'package:portfolio/view/sections/hero_section.dart';

class DesktopView extends StatelessWidget {
  DesktopView({super.key});
  @override
  Widget build(BuildContext context) {
 
    return GetBuilder(
      init: AuthController(),
      builder: (cont) {
        return Scaffold(
            backgroundColor: colorManager.bgColor,
            body: LayoutBuilder(
              builder: (context, constraints) {
                double width = constraints.maxWidth
                // double width = 1366
;                return Center(
  child: Container(
    width: width,
    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 80),
                          child: Row(
                            children: [
                              //  Profile Card (fixed)
                              ProfileCard(),
                              SizedBox(
                                width: width * 0.04,
                              ),
                              // Web View
                              Expanded(
                                flex: 3,
                                child: Home(),
                              ),
                              SizedBox(
                                width: 80,
                                child: Center(
                                    child: Container(
                                        height: 350,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 30.0),
                                          child: FloatingNavbar(),
                                        ))),
                              )
                            ],
                          ),
                        ),
                      //   AnimatedContainer(
                      //     height:colorManager.isLoggedin? constraints.maxHeight:0,
                      //     width: constraints.maxWidth,
                      //     duration: Duration(milliseconds: 600),
                      //     decoration: BoxDecoration(color: colorManager.bgColor),
                      //  )
                      ],
                    ),
  ),
);
              }
            ));
      }
    );
  }
}
