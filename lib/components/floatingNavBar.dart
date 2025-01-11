import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:portfolio/components/mask.dart';
import 'package:portfolio/components/socialIcon.dart';
import 'package:portfolio/controllers/general_controller.dart';
import 'package:portfolio/controllers/theme_controller.dart';
import 'package:portfolio/utility/appsettings.dart';

class FloatingNavbar extends StatelessWidget {
  const FloatingNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ColorManager(),
      builder: (cont) {
        return Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: cont.borderColor),
              borderRadius: BorderRadius.circular(32)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(cont.icons.length, (index){
              return CustomIcon(icon: cont.icons[index], onTap: (){
                cont.changePage(index);
              }, index: index,);
              })
            ),
          ),
        );
      }
    );
  }
}

class CustomIcon extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
final int index;
  const CustomIcon({super.key, required this.icon, required this.onTap, required this.index});

  @override
  Widget build(BuildContext context) {
    return colorManager.currentIndex == index ? Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
     
        child: Icon(
          icon,
          size: 24,
          color:colorManager.primaryColor,
        
      ),
    ):GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Icon(
            icon,
            size: 24,
            color: colorManager.borderColor,
          ),
        ));
  }
}
