import 'package:flutter/material.dart';
import 'package:portfolio/components/animatedCounter.dart';
import 'package:portfolio/components/circularTextButton.dart';
import 'package:portfolio/components/outlineButton.dart';
import 'package:portfolio/test.dart';
import 'package:portfolio/utility/appsettings.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
          ),
          CustomOutlineButton(title: "introduction", onTap: () {}),
          SizedBox(
            height: 12,
          ),
          Text(
            "Say Hi from ",
            style: TextStyle(
                color: AppSettings.whiteColor,
                fontSize: 72,
                fontWeight: FontWeight.w200,
                letterSpacing: 4,
                height: 1.2),
          ),
          ShaderMask(
              shaderCallback: (bounds) =>
                  AppSettings.primaryGradient.createShader(bounds),
              child: Text(
                "Muhammad Mohsin",
                style: TextStyle(
                    color: AppSettings.whiteColor,
                    fontSize: 90,
                    fontWeight: FontWeight.w900,
                    height: 1),
              )),
          Text(
            "A Passionate Flutter Developer, Full-stack Web developer.",
            style: TextStyle(
                color: AppSettings.whiteColor,
                fontSize: 28,
                fontWeight: FontWeight.w300,
                height: 2,
                letterSpacing: 3.5),
          ),
          Text(
            "I specialize in transforming your vision into beautifully crafted, high-performing apps and websites. With over 3 years of experience as a Full Stack Developer & Designer, I blend design, functionality, and cutting-edge technology to create digital solutions that not only look great but deliver results. From Flutter to WordPress, Next.js to Ruby on Rails, I handle every step of the process to ensure your project exceeds expectations. Let’s collaborate to bring your ideas to life and build something extraordinary together!",
            style: TextStyle(
                color: AppSettings.whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.w200,
                letterSpacing: 4),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 250,
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 200,
                    width: 150,
                    
                    child: AnimatedCounter(
                      title: "Years of Experience",
                      endValue: 3,
                    )),
                    SizedBox(width: 30,),
                     Container(
                    height: 200,
                    width: 150,
                    child: AnimatedCounter(
                      title: "Completed Projects",
                      endValue: 50,
                    )),Spacer(), Container(
                     width: 200,
                      child:Center(child: RotatingContainer()))
              ],
            ),
          )
        ],
      ),
    );
  }
}