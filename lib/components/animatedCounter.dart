import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/mask.dart';
import 'package:portfolio/controllers/general_controller.dart';

class AnimatedCounter extends StatelessWidget {
  final int endValue; 
  final String title; 
  AnimatedCounter({super.key, required this.endValue, required this.title});

final cont = Get.find<GeneralController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cont.bgColor,
      body: TweenAnimationBuilder<int>(
        tween: IntTween(begin: 0, end: endValue),
        duration: Duration(seconds: 3), // Duration of the animation
        builder: (context, value, child) {
          return Container(
            // decoration: BoxDecoration(
            //     border: Border.all(width: 1, color: cont.borderColor)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
           
                Text(
                    '$value+',
                    style: TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.w900,
                        color: cont.primaryColor, height: 1),textAlign: TextAlign.center,
                  ),
              
                Text(
                  '$title',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w200,
                      color: cont.whiteColor, letterSpacing: 3),textAlign: TextAlign.center,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
