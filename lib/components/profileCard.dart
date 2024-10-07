import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:portfolio/components/CustomRoundedButton.dart';
import 'package:portfolio/components/mask.dart';
import 'package:portfolio/components/socialIcon.dart';
import 'package:portfolio/controllers/general_controller.dart';
import 'package:portfolio/utility/appsettings.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GetBuilder(
        init: GeneralController(),
        builder: (cont) {
          return Stack(
            children: [
              Container(
                width: 350,
                height: height * 0.8,
                constraints: BoxConstraints(minWidth: 400),
                padding: EdgeInsets.all(42),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(52),
                    border:
                        Border.all(width: 1, color: AppSettings.borderColor)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text("Mosen",
                                  style: TextStyle(
                                      color: AppSettings.whiteColor,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 38))),
                          Expanded(
                              flex: 1,
                              child: Text(
                                "Flutter Developer / \nFull Stack Developer",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: AppSettings.whiteColor,
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
                              color: AppSettings.borderColor,
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                  '../../assets/images/profile-pic.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(42)),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        "Muhammad Mohsin",
                        style: TextStyle(fontSize: 32, color: AppSettings.whiteColor),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "G.T Road, Gujrat Pakistan",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w300,
                            color: AppSettings.borderColor),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "m.mohsin2055@gmail.com",
                        style: TextStyle(
                            fontSize: 16,
                            color: AppSettings.whiteColor
,                            letterSpacing: 3,
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
                        onTap: () {},
                        icon: HugeIcons.strokeRoundedFilterMailSquare,
                        isRounded: true,
                      ),
                      SizedBox(height: 32),
                      Text(
                        "©2024, All Right Reserved.",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: AppSettings.borderColor),
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
                      height: cont.showSettings ? height * 0.8 : 0,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(52),
                          color: Colors.black54,
                          border: Border.all(
                              width: 1, color: AppSettings.borderColor)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 42,
                            ),
                            Text(
                              "Settings",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 32),
                            ), SizedBox(height: 32,),
                            ReusableRow(title: "Theme Setting", child: Switch(value: cont.isLightTheme, onChanged: (newVal){
                              cont.changeTheme(newVal);
                            }))
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
                    color: AppSettings.bgColor),
                child: MouseRegion(
                  onEnter: (_) => cont.onSettingHover(true),
                  onExit: (_) => cont.onSettingHover(false),
                  child: GestureDetector(
                    onTap: () {
                      cont.handleSetting();
                    },
                    child: AnimatedRotation(
                      duration: Duration(milliseconds: 1200),
                      turns: cont.isSettingHover
                          ? 0.5
                          : 0.0, // Rotate 180 degrees on hover

                      child: Icon(
                        FontAwesomeIcons.gear,
                        color: AppSettings.primaryColor,
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
          Text(
            '$title',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
          ),
          child
        ],
      ),
    );
  }
}
