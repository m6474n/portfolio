import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/animatedCounter.dart';
import 'package:portfolio/components/circularTextButton.dart';
import 'package:portfolio/components/outlineButton.dart';
import 'package:portfolio/controllers/general_controller.dart';
import 'package:portfolio/test.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
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
  var generalCont = Get.find<GeneralController>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(seconds: 1), // Duration of the fade-in animation
      curve: Curves.easeInOut, // Curve for the animation
      child:SingleChildScrollView(
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
                  color: generalCont.whiteColor,
                  fontSize: width >800 ? 72: width *0.1,
                  fontWeight: FontWeight.w200,
                  letterSpacing: 4,
                  height: 1.2),
            ),
           Text(
                  "Muhammad Mohsin",
                  style: TextStyle(
                      color: generalCont.primaryColor,
                      fontSize: width >800 ? 90: width *0.13,
                      fontWeight: FontWeight.w900,
                      height: 1),
                ),
             width > 500? Container():  SizedBox(height: 10,),
            Text(
              "A Passionate Flutter Developer, Full-stack Web developer.",
              style: TextStyle(
                  color: generalCont.whiteColor,
                  fontSize: width >800 ? 28: width *0.05,
                  fontWeight: FontWeight.w300,
                  height: width >800 ? 2: 1.2,
                  letterSpacing: 3.5),
            ),
          width > 500? Container():  SizedBox(height: 18,),
            Text(
              "I specialize in transforming your vision into beautifully crafted, high-performing apps and websites. With over 3 years of experience as a Full Stack Developer & Designer, I blend design, functionality, and cutting-edge technology to create digital solutions that not only look great but deliver results. From Flutter to WordPress, Next.js to Ruby on Rails, I handle every step of the process to ensure your project exceeds expectations. Let’s collaborate to bring your ideas to life and build something extraordinary together!",
              style: TextStyle(
                  color: generalCont.whiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w200,
                  letterSpacing: 4),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: width>500? 250: 150,
              
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
                      )),Spacer(), 
                      
                      
                     width> 500? Container(
                       width: 200,
                        child:Center(child: RotatingContainer(onTap: (){
                          generalCont.changePage(5);
                        },))):Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
