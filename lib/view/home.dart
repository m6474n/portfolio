import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/general_controller.dart';
import 'package:portfolio/utility/appsettings.dart';
import 'package:portfolio/view/sections/about_section.dart';
import 'package:portfolio/view/sections/hero_section.dart';


class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
backgroundColor: AppSettings.bgColor,
      body: GetBuilder(
        init: GeneralController(),
        builder: (cont) {
          return PageView(
            controller: cont.pageController,
            scrollDirection:Axis.vertical,
            physics: NeverScrollableScrollPhysics(), 
            children: cont.sectionList
          );
        }
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (){
      //   String text = "Working with Mohsin has been a fantastic experience. He helped me create a professional website that exceeded my expectations in terms of design, functionality, and attention to detail. From the start, they demonstrated a strong ability to understand my vision and turn it into an attractive and functional site. Communication";
      //   print(text.length);
      // }),
    );
  }
}
