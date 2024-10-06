import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:portfolio/components/floatingNavBar.dart';
import 'package:portfolio/components/socialIcon.dart';
import 'package:portfolio/view/sections/about_section.dart';
import 'package:portfolio/view/sections/contact_section.dart';
import 'package:portfolio/view/sections/hero_section.dart';
import 'package:portfolio/view/sections/portfolio_section.dart';
import 'package:portfolio/view/sections/resume_section.dart';
import 'package:portfolio/view/sections/service_section.dart';
import 'package:portfolio/view/sections/skill_section.dart';
import 'package:portfolio/view/sections/testimonial_section.dart';

class GeneralController extends GetxController {

  bool showSettings = false;


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

changePage(int index){
  pageController.animateToPage(index, duration: Duration(milliseconds: 900), curve: Curves.easeInOut);
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
