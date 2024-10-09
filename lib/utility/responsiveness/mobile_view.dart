import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/floatingNavBar.dart';
import 'package:portfolio/components/profileCard.dart';
import 'package:portfolio/view/home.dart';

import '../../controllers/general_controller.dart';

class MobileView extends StatelessWidget {
   MobileView({super.key});
final generalCont = Get.find<GeneralController>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: generalCont.bgColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50,),
                //  Profile Card (fixed)
              width > 820?ProfileForMobile(): ProfileCard(),
                SizedBox(
                  width: width * 0.04,
                ),

                ...List.generate(generalCont.sectionList.length, (index){
                  return generalCont.sectionList[index];
                })
                // Web View
                // Expanded(
                //   flex: 3,
                //   child: Home(),
                // ),
                // SizedBox(
                //   width: 80,
                //   child: Center(
                //       child: Container(
                //           height: 350,
                //           child: Padding(
                //             padding: const EdgeInsets.only(left: 30.0),
                //             child: FloatingNavbar(),
                //           ))),
                // )
              ],
            ),
          ),
        ));
  }
}
