import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:portfolio/view/sections/about_section.dart';
import 'package:portfolio/view/sections/contact_section.dart';
import 'package:portfolio/view/sections/hero_section.dart';
import 'package:portfolio/view/sections/portfolio_section.dart';
import 'package:portfolio/view/sections/resume_section.dart';
import 'package:portfolio/view/sections/service_section.dart';
import 'package:portfolio/view/sections/skill_section.dart';
import 'package:portfolio/view/sections/testimonial_section.dart';

class ColorManager extends GetxController {
  var user = FirebaseAuth.instance.currentUser;


  List<String> currencyList = ["\$", "Rs."];
  String currency = "\$";
  String StoreLogo = 'assets/logo-light.png';

   Color primaryColor= Color(0xFF03DAC5);
   Color bgColor= Color(0xffffffff); 
    Color textColor = const Color.fromRGBO(22, 22, 22, 1);
  Color iconColor = const Color.fromARGB(255, 242, 148, 6);
  // Color iconColor = const Color(0xffEA7C69);
  Color whiteColor = Colors.white;
  Color darkBlue = const Color(0xff1F1D2B);

  Color greyText = Colors.grey.shade200;
  Color bgLight = const Color.fromARGB(255, 244, 244, 244);
  // Color bgLight = const Color.fromARGB(255, 237, 237, 237);
  Color bgDark = const Color.fromARGB(255, 255, 255, 255);
  Color borderColor = Color.fromARGB(255, 176, 176, 176);

  lightTheme() {
    textColor = const Color(0xff161616);
    greyText = Colors.grey.shade200;
    bgLight = const Color.fromARGB(255, 244, 244, 244);
    bgDark = const Color.fromARGB(255, 255, 255, 255);
    iconColor = primaryColor;
    Get.changeTheme(ThemeData.light());

    StoreLogo = 'assets/logo-light.png';
    borderColor = const Color.fromARGB(255, 217, 217, 217);
    update();
  }

  darkTheme() {
    textColor = Colors.white;
    greyText = primaryColor;
    bgLight = const Color(0xff393C49);
    bgDark = const Color(0xff1F1D2B);
    iconColor = Colors.white;
    Get.changeTheme(ThemeData.dark());
    StoreLogo = 'assets/logo-dark.png';
    borderColor = const Color.fromARGB(255, 217, 217, 217);
    update();
  }
  bool isLoggedin = false;
checkSession(){
 var user =  FirebaseAuth.instance.currentUser ;
 if(user!=null){
  isLoggedin = true;
  update();
 }else{isLoggedin = false;
 update();};
}
  @override
  void onInit() {
    super.onInit();
    checkSession();
     pageController.addListener(() {
      currentIndex = pageController.page!.round();
      update();
    });
    // loadThemeFromPreferences();
    // getUserRole();
  }

  bool isDark = false;
  void toggleTheme(newVal) {
    isDark = newVal;
    // isDarkTheme.value = newVal;
    isDark ? darkTheme() : lightTheme();
    // saveThemeToPreferences(isDark);
    update();
  }




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
//   colorManagerroller().update();
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

 
  // void loadThemeFromPreferences() async {
  //   // getStoreSettings();
  //   // settings = await store.getStoreSettings();
  //   // print(settings?.primaryColor);
  //   // var color = await FirebaseFirestore.instance.collection("StoreSettings");
  //   // primaryColor =
  //   //     Color(int.parse(hexToColor(settings?.primaryColor ?? "#06B7F2")));
  //   await SharedPreferences.getInstance().then((v) {
  //     isDark = v.getBool('isDarkTheme') ?? false;
  //     isDark ? darkTheme() : lightTheme();
  //     // primaryColor = v.getString('color')??
  //     primaryColor =
  //         Color(int.parse(hexToColor(v.getString('color') ?? "#06B7F2")));
  //     print("Id Dark theme:  $isDark");
  //     update();
  //   });
  // }

  // void saveThemeToPreferences(bool isDarkTheme) async {
  //   await SharedPreferences.getInstance().then((v) {
  //     v.setBool('isDarkTheme', isDarkTheme);
  //     update();
  //   });
  // }
}
