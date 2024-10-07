import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:portfolio/components/floatingNavBar.dart';
import 'package:portfolio/components/socialIcon.dart';
import 'package:portfolio/utility/appsettings.dart';
import 'package:portfolio/view/sections/about_section.dart';
import 'package:portfolio/view/sections/contact_section.dart';
import 'package:portfolio/view/sections/hero_section.dart';
import 'package:portfolio/view/sections/portfolio_section.dart';
import 'package:portfolio/view/sections/resume_section.dart';
import 'package:portfolio/view/sections/service_section.dart';
import 'package:portfolio/view/sections/skill_section.dart';
import 'package:portfolio/view/sections/testimonial_section.dart';

class GeneralController extends GetxController {
// Colors.
  //  Color primaryColor= Color(0xFFcc4499);
   Color primaryColor= Color(0xff03dac5);
   Color bgColor= Color(0xff1f1f1f);
   Color borderColor= Color.fromARGB(255, 119, 119, 119);

   Color whiteColor= Color(0xFFFFFFFF);
  // static Color grad1= Color(0xFFDB6885);
  // static Color grad2= Color(0xFF972239);
   Color grad1= Color(0xFF663dff);
   Color grad2= Color(0xFFcc4499);
  // static Gradient primaryGradient = LinearGradient(colors: [grad1,grad2],begin: Alignment.centerLeft, end: Alignment.centerRight);
// sizing
static double mobileWidth = 1220;

  



  
  List<Color > colors = [
    Color(0xffFFC857),
    Color(0xffbb86fc),
    Color(0xff03dac5),
    Color(0xffFF5797),
  
  ];


// changeColor(Color newColor)
// {
//   primaryColor = newColor;
//   GeneralController().update();
//   update();
// }
  bool showSettings = false;

  handleSetting() {
    showSettings = !showSettings;
    update();
  }

  final PageController pageController = PageController();
  int currentIndex = 0;

  List<Widget> sectionList = <Widget>[
    const HeroSection(),
    const AboutSection(),
    const ResumeSection(),
    const ServiceSection(),
    const SkillsSection(),
    const PortfolioSection(),
    const TestimonialSection(),
    const ContactSection(),
  ];
  List<IconData> icons = [
    HugeIcons.strokeRoundedHome01,
    HugeIcons.strokeRoundedUser,
    HugeIcons.strokeRoundedBriefcase01,
    HugeIcons.strokeRoundedListView,
    HugeIcons.strokeRoundedLayers02,
    HugeIcons.strokeRoundedLayout01,
    HugeIcons.strokeRoundedChatting01,
    HugeIcons.strokeRoundedContact,
  ];
// Circulat text button
  bool isButtonHover = false;

  handleHover(val) {
    isButtonHover = val;
    update();
  }

// Profile Card
  bool isSettingHover = false;

  onSettingHover(bool val) {
    isSettingHover = val;
    update();
  }

  changePage(int index) {
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 900), curve: Curves.easeInOut);
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit

    pageController.addListener(() {
      currentIndex = pageController.page!.round();
      update();
    });
    super.onInit();
  }
}
