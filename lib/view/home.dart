import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/general_controller.dart';
import 'package:portfolio/view/sections/about_section.dart';
import 'package:portfolio/view/sections/hero_section.dart';


class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     
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
    );
  }
}
