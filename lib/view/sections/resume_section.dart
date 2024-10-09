import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/outlineButton.dart';
import 'package:portfolio/components/resumeCard.dart';
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  CustomOutlineButton(title: "Resume", onTap: () {}),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Education and Experience",
                    style: TextStyle(
                        color: cont.generalCont.whiteColor,
                        fontSize: width > 800 ? 72 : width * 0.1,
                        fontWeight: FontWeight.w200,
                        letterSpacing: 4,
                        height: 1.2),
                  ),
                  SizedBox(
                    height: 52,
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
                              width: 32,
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
                              height: 23,
                            ),
                    width > 500? Container():       Text(
                              "Experience",
                              style: TextStyle(
                                  color: cont.generalCont.whiteColor,
                                  fontSize: 32,
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
            );
          }),
    );
  }
}
