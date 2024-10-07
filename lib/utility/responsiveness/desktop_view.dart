import 'package:flutter/material.dart';
import 'package:portfolio/components/circularTextButton.dart';
import 'package:portfolio/components/floatingNavBar.dart';
import 'package:portfolio/components/outlineButton.dart';
import 'package:portfolio/components/profileCard.dart';
import 'package:portfolio/utility/appsettings.dart';
import 'package:portfolio/view/home.dart';
import 'package:portfolio/view/sections/hero_section.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppSettings.bgColor,
     
        body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
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
              ), SizedBox(width: 80,child: Center(child: Container(
                height: 350,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: FloatingNavbar(),
                ))),)
        ],
              ),
            ));
  }
}
