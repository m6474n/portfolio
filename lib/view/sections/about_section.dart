import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/outlineButton.dart';
import 'package:portfolio/components/socialIcon.dart';


class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
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
    double width = MediaQuery.of(context).size.width
;    return AnimatedOpacity(
      
      opacity: _opacity,
      duration: Duration(seconds: 1), // Duration of the fade-in animation
      curve: Curves.easeInOut, // Curve for the animation
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            CustomOutlineButton(title: "About", onTap: () {}),
            SizedBox(
              height: 12,
            ),
            Text(
              "Who I Am",
              style: TextStyle(
                  color: colorManager.textColor,
                  fontSize: width >800 ? 72: width *0.1,
                  fontWeight: FontWeight.w200,
                  letterSpacing: 4,
                  height: 1.2),
            ),
            Text(
              "Hello I am Mosen, a dedicated Full Stack Developer and Designer with over three years of experience in creating dynamic and visually appealing applications and websites. My technical expertise includes Flutter, WordPress, Next.js, JavaScript, and Ruby on Rails, allowing me to effectively bridge the gap between front-end and back-end development. With a strong background in graphic design, I focus on user-centric design principles to achieve a seamless blend of functionality and aesthetics.\n \nI am passionate about solving complex challenges and am driven by a commitment to deliver outstanding results, whether in a team setting or independently. As a lifelong learner, I am constantly exploring new technologies and methodologies to enhance my skills and contribute to project success. Thank you for visiting my portfolio. I am excited about the opportunity to collaborate on future projects. Please feel free to reach out with any questions or opportunities!",
              style: TextStyle(
                  color: colorManager.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w200,
                  letterSpacing: 4),
            ),
            SizedBox(
              height: 32,
            ),
           
          ],
        ),
      ),
    );
  }
}
