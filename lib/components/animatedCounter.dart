import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/mask.dart';
import 'package:portfolio/components/socialIcon.dart';
import 'package:portfolio/controllers/general_controller.dart';

class AnimatedCounter extends StatelessWidget {
  final int endValue; 
  final String title; 
  AnimatedCounter({super.key, required this.endValue, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorManager.bgColor,
      body: TweenAnimationBuilder<int>(
        tween: IntTween(begin: 0, end: endValue),
        duration: Duration(seconds: 3), // Duration of the animation
        builder: (context, value, child) {
          return Container(
            // decoration: BoxDecoration(
            //     border: Border.all(width: 1, color: colorManager.borderColor)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
           
                Text(
                    '$value+',
                    style: TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.w900,
                        color: colorManager.primaryColor, height: 1),textAlign: TextAlign.center,
                  ),
              
                Text(
                  '$title',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w200,
                      color: colorManager.textColor, letterSpacing: 3),textAlign: TextAlign.center,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
