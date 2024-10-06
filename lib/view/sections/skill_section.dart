import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/outlineButton.dart';
import 'package:portfolio/components/skillCard.dart';
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
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(seconds: 1), // Duration of the fade-in animation
      curve: Curves.easeInOut, // Curve for the animation
      child: GetBuilder(
        init: SkillController(),
        builder: (cont) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              CustomOutlineButton(title: "Skills", onTap: () {}),
              SizedBox(
                height: 12,
              ),
              Text(
                "My Advantages",
                style: TextStyle(
                    color: AppSettings.whiteColor,
                    fontSize: 72,
                    fontWeight: FontWeight.w200,
                    letterSpacing: 4,
                    height: 1.2),
              ),
              SizedBox(height: 20,),
             Wrap(direction: Axis.horizontal,children: List.generate(cont.skills.length, (index){
              return  SkillCard(title: cont.skills[index]['title'],icon: cont.skills[index]['icon'],);
             }),)
          
            ],
          );
        }
      ),
    );
  }
}
