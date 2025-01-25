import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/outlineButton.dart';
import 'package:portfolio/components/resumeCard.dart';
import 'package:portfolio/components/socialIcon.dart';
import 'package:portfolio/controllers/experience_controller.dart';
import 'package:portfolio/models/experience.dart';

class ResumeSection extends StatefulWidget {
  const ResumeSection({super.key});

  @override
  State<ResumeSection> createState() => _ResumeSectionState();
}

class _ResumeSectionState extends State<ResumeSection> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Trigger the animation after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 0), () {
        setState(() {
          _opacity = 1.0;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(seconds: 1), // Duration of the fade-in animation
      curve: Curves.easeInOut, // Curve for the animation
      child: GetBuilder(
          init: ExperienceController(),
          builder: (cont) {
            return SingleChildScrollView(
              child:Padding(
          padding:width>500 ? EdgeInsets.symmetric(horizontal: 0):EdgeInsets.only(left: 8, top: 40, right: 8),
          child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  
                    CustomOutlineButton(title: "Resume", onTap: () {}),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Education and Experience",
                      style: TextStyle(
                          color: colorManager.textColor,
                          fontSize: width > 800 ? 54 : width * 0.1,
                          fontWeight: FontWeight.w200,
                          letterSpacing: 4,
                          height: 1.2),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    width > 800
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    List.generate(cont.education.length, (index) {
                                  return ResumeCard(
                                      experience: Experience.fromJson(
                                          cont.education[index]));
                                }),
                              )),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                    cont.experienceList.length, (index) {
                                  return ResumeCard(
                                      experience: Experience.fromJson(
                                          cont.experienceList[index]));
                                }),
                              ))
                            ],
                          )
                        : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             
                                    ...List.generate(cont.education.length, (index) {
                                  return ResumeCard(
                                      experience: Experience.fromJson(
                                          cont.education[index]));
                                }),
                              
                              SizedBox(
                                height: 16,
                              ),
                      width > 500? Container():       Text(
                                "Experience",
                                style: TextStyle(
                                    color: colorManager.textColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w200,
                                    letterSpacing: 4,
                                    height: 1.2),
                              ),
                             width >500?  Container():   SizedBox(height: 32,),
                            ... List.generate(
                                    cont.experienceList.length, (index) {
                                  return ResumeCard(
                                      experience: Experience.fromJson(
                                          cont.experienceList[index]));
                                }),
                           
                            ],
                          )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
