import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/outlineButton.dart';
import 'package:portfolio/components/skillCard.dart';
import 'package:portfolio/components/socialIcon.dart';
import 'package:portfolio/controllers/skill_controller.dart';
import 'package:portfolio/utility/appsettings.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
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
        init: SkillController(),
        builder: (cont) {
          return SingleChildScrollView(
            child: Padding(
          padding:width>500 ? EdgeInsets.symmetric(horizontal: 0):EdgeInsets.only(left: 8, top: 40, right: 8),
          child:  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  // SizedBox(
                  //   height: 100,
                  // ),
                  CustomOutlineButton(title: "Skills", onTap: () {}),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "My Advantages",
                    style: TextStyle(
                        color: colorManager.textColor,
                    fontSize: width >800 ? 54: width *0.1,
                        fontWeight: FontWeight.w200,
                        letterSpacing: 4,
                        height: 1.2),
                  ),
                  SizedBox(height: 20,),
                 Wrap(direction: Axis.horizontal,children: List.generate(cont.skills.length, (index){
                  return  SkillCard(title: cont.skills[index]['title'],icon: cont.skills[index]['icon'],);
                 }),)
              
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
